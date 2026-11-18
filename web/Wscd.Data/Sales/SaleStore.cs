using Microsoft.EntityFrameworkCore;
using Npgsql;
using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.Data.Sales;

public sealed class SaleStore(WscdDbContext db) : ISaleStore
{
    public async Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed)
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
        if (completed is bool isCompleted)
        {
            query = query.Where(sale => (sale.CompletedAtUtc != null) == isCompleted);
        }

        return await query.OrderByDescending(sale => sale.Date).ThenByDescending(sale => sale.Id)
            .Select(sale => new SaleSummary(sale.Id, sale.Date, sale.Customer.Name,
                sale.Items.Sum(item => item.Total), sale.CompletedAtUtc != null))
            .ToListAsync();
    }

    public Task<Sale?> FindAsync(int id) => db.Sales.AsNoTracking()
        .Include(sale => sale.Customer)
        .Include(sale => sale.Seller)
        .Include(sale => sale.Items.OrderBy(item => item.Id))
        .Include(sale => sale.Payments.OrderBy(payment => payment.Id)).ThenInclude(payment => payment.CashAccount)
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
        catch (Exception exception) when (IsWriteConflict(exception))
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
        catch (Exception exception) when (IsWriteConflict(exception))
        {
            db.ChangeTracker.Clear();
            return false;
        }
    }

    public async Task<SaleCheckout> CheckoutAsync(Sale sale, IReadOnlyList<SalePayment> payments, DateTimeOffset completedAt)
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
                var account = await db.CashAccounts.FromSql($"""
                    SELECT * FROM "CashAccounts"
                    WHERE "IDOrganization" = {sale.OrganizationId} AND "ID" = {accountId}
                    FOR SHARE
                    """).AsNoTracking().SingleOrDefaultAsync();
                if (account is not { IsInactive: false })
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
            await db.SaveChangesAsync();
            await transaction.CommitAsync();
            return SaleCheckout.Completed;
        }
        catch (Exception exception) when (IsWriteConflict(exception))
        {
            db.ChangeTracker.Clear();
            return SaleCheckout.Conflict;
        }
    }

    private static bool IsWriteConflict(Exception exception) => exception is DbUpdateConcurrencyException ||
        (exception as PostgresException ?? exception.InnerException as PostgresException) is
        {
            SqlState: PostgresErrorCodes.ForeignKeyViolation or PostgresErrorCodes.UniqueViolation or
            PostgresErrorCodes.DeadlockDetected or PostgresErrorCodes.SerializationFailure
        };
}
