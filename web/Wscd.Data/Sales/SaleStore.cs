using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.Data.Sales;

public sealed class SaleStore(WscdDbContext db) : ISaleStore
{
    public async Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, SaleStatus? status)
    {
        var query = db.Sales.AsNoTracking();
        if (!string.IsNullOrEmpty(search))
        {
            var lowerSearch = search.ToLowerInvariant();
            query = query.Where(sale => sale.Customer.Name.ToLower().Contains(lowerSearch));
        }
        if (from is DateOnly start)
        {
            query = query.Where(sale => sale.Date >= start);
        }
        if (to is DateOnly end)
        {
            query = query.Where(sale => sale.Date <= end);
        }
        query = status switch
        {
            SaleStatus.Draft => query.Where(sale => sale.CompletedAtUtc == null),
            SaleStatus.Completed => query.Where(sale => sale.CompletedAtUtc != null && sale.CancelledAtUtc == null),
            SaleStatus.Cancelled => query.Where(sale => sale.CancelledAtUtc != null),
            _ => query
        };

        return await query.OrderByDescending(sale => sale.Date).ThenByDescending(sale => sale.Id)
            .Select(sale => new SaleSummary(sale.Id, sale.Date, sale.Customer.Name,
                sale.Items.Sum(item => item.Total), sale.CancelledAtUtc != null ? SaleStatus.Cancelled :
                    sale.CompletedAtUtc != null ? SaleStatus.Completed : SaleStatus.Draft))
            .ToListAsync();
    }

    public Task<Sale?> FindAsync(int id) => db.Sales.AsNoTracking()
        .Include(sale => sale.Customer)
        .Include(sale => sale.Seller)
        .Include(sale => sale.Items.OrderBy(item => item.Id))
        .Include(sale => sale.Payments.OrderBy(payment => payment.Id)).ThenInclude(payment => payment.CashAccount)
        .Include(sale => sale.Receivable)
            .ThenInclude(account => account!.Payments).ThenInclude(payment => payment.CashAccount)
        .AsSingleQuery()
        .SingleOrDefaultAsync(sale => sale.Id == id);

    public async Task<bool> CreateAsync(Sale sale, Guid? quotationRevision)
    {
        await using var transaction = quotationRevision.HasValue ? await db.Database.BeginTransactionAsync() : null;
        try
        {
            if (quotationRevision is Guid revision)
            {
                // A concurrent conversion or reopening must not both succeed.
                var claimed = await db.Quotations.Where(quote => quote.Id == sale.QuotationId &&
                        quote.IsCompleted && quote.Revision == revision)
                    .ExecuteUpdateAsync(update => update.SetProperty(quote => quote.Revision, Guid.NewGuid()));
                if (claimed != 1)
                {
                    return false;
                }
            }

            sale.Revision = Guid.NewGuid();
            db.Sales.Add(sale);
            await db.SaveChangesAsync();
            if (transaction is not null)
            {
                await transaction.CommitAsync();
            }
            return true;
        }
        catch (Exception exception) when (FinancePersistence.IsWriteConflict(exception))
        {
            db.ChangeTracker.Clear();
            return false;
        }
    }

    public async Task<bool> UpdateAsync(int id, Func<Sale, bool> change)
    {
        var sale = await db.Sales.Include(sale => sale.Items).SingleOrDefaultAsync(sale => sale.Id == id);
        if (sale is null || !change(sale))
        {
            return false;
        }

        sale.Revision = Guid.NewGuid();
        try
        {
            await db.SaveChangesAsync();
            return true;
        }
        catch (Exception exception) when (FinancePersistence.IsWriteConflict(exception))
        {
            db.ChangeTracker.Clear();
            return false;
        }
    }

    public async Task<SaleCheckout> CheckoutAsync(Sale sale, IReadOnlyList<SalePayment> payments, AccountReceivable? receivable, DateTimeOffset completedAt)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            var claimed = await db.Sales.Where(current => current.Id == sale.Id &&
                    current.CompletedAtUtc == null && current.Revision == sale.Revision)
                .ExecuteUpdateAsync(update => update
                    .SetProperty(current => current.CompletedAtUtc, completedAt)
                    .SetProperty(current => current.Revision, Guid.NewGuid()));
            if (claimed != 1)
            {
                return SaleCheckout.Conflict;
            }

            // Lock the selected accounts in a consistent order until all receipts are committed.
            foreach (var accountId in payments.Select(payment => payment.CashAccountId).Distinct().Order())
            {
                if (!await db.LockActiveCashAccountAsync(sale.OrganizationId, accountId))
                {
                    return SaleCheckout.InvalidCashAccount;
                }
            }

            foreach (var item in sale.Items.OrderBy(item => item.ProductId))
            {
                var updated = await db.Products.Where(product => product.Id == item.ProductId && product.Stock >= item.Quantity)
                    .ExecuteUpdateAsync(update => update.SetProperty(product => product.Stock, product => product.Stock - item.Quantity));
                if (updated != 1)
                {
                    return SaleCheckout.InsufficientStock;
                }
            }

            db.SalePayments.AddRange(payments);
            if (receivable is not null)
            {
                db.AccountsReceivable.Add(receivable);
            }
            await db.SaveChangesAsync();
            await transaction.CommitAsync();
            return SaleCheckout.Completed;
        }
        catch (Exception exception) when (FinancePersistence.IsWriteConflict(exception))
        {
            db.ChangeTracker.Clear();
            return SaleCheckout.Conflict;
        }
    }

    public async Task<SaleCancellation> CancelAsync(Sale sale, SettlementReversal cancellation)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            var claimed = await db.Sales.Where(current => current.Id == sale.Id &&
                    current.CompletedAtUtc != null && current.CancelledAtUtc == null && current.Revision == sale.Revision)
                .ExecuteUpdateAsync(update => update
                    .SetProperty(current => current.CancelledAtUtc, cancellation.AtUtc)
                    .SetProperty(current => current.CancellationReason, cancellation.Reason)
                    .SetProperty(current => current.CancelledByUserId, cancellation.UserId)
                    .SetProperty(current => current.Revision, Guid.NewGuid()));
            if (claimed != 1)
            {
                return SaleCancellation.Conflict;
            }

            if (sale.Receivable is { } account &&
                await db.AccountsReceivable.Where(current => current.Id == account.Id && current.Revision == account.Revision)
                    .ExecuteUpdateAsync(update => update.SetProperty(current => current.Balance, 0m)
                        .SetProperty(current => current.Revision, Guid.NewGuid())) != 1)
            {
                return SaleCancellation.Conflict;
            }

            foreach (var item in sale.Items.OrderBy(item => item.ProductId))
            {
                var updated = await db.Products.Where(product => product.Id == item.ProductId &&
                        product.Stock <= int.MaxValue - item.Quantity)
                    .ExecuteUpdateAsync(update => update.SetProperty(product => product.Stock, product => product.Stock + item.Quantity));
                if (updated != 1)
                {
                    return SaleCancellation.Conflict;
                }
            }

            await transaction.CommitAsync();
            return SaleCancellation.Cancelled;
        }
        catch (Exception exception) when (FinancePersistence.IsWriteConflict(exception))
        {
            return SaleCancellation.Conflict;
        }
    }
}
