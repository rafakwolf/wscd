using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.Data.Sales;

public sealed class ReceivableStore(WscdDbContext db) : IReceivableStore
{
    public async Task<IReadOnlyList<ReceivableSummary>> ListAsync(string? customer, DateOnly? from, DateOnly? to,
        ReceivableStatus? status, DateOnly today)
    {
        var query = db.AccountsReceivable.AsNoTracking();
        if (!string.IsNullOrEmpty(customer))
        {
            var search = customer.ToLowerInvariant();
            query = query.Where(account => account.Sale.Customer.Name.ToLower().Contains(search));
        }
        if (from is DateOnly start)
        {
            query = query.Where(account => account.DueDate >= start);
        }
        if (to is DateOnly end)
        {
            query = query.Where(account => account.DueDate <= end);
        }
        query = status switch
        {
            ReceivableStatus.Open => query.Where(account => account.Balance > 0),
            ReceivableStatus.Overdue => query.Where(account => account.Balance > 0 && account.DueDate < today),
            ReceivableStatus.Paid => query.Where(account => account.Balance == 0),
            _ => query
        };

        return await query.OrderBy(account => account.Balance == 0).ThenBy(account => account.DueDate).ThenBy(account => account.Id)
            .Select(account => new ReceivableSummary(account.Id, account.SaleId, account.Sale.Customer.Name,
                account.DueDate, account.Amount, account.Balance))
            .ToListAsync();
    }

    public Task<AccountReceivable?> FindAsync(int id) => db.AccountsReceivable.AsNoTracking()
        .Include(account => account.Sale).ThenInclude(sale => sale.Customer)
        .Include(account => account.Payments.OrderByDescending(payment => payment.Id)).ThenInclude(payment => payment.CashAccount)
        .SingleOrDefaultAsync(account => account.Id == id);

    public async Task<ReceivableSettlement> ReceiveAsync(AccountReceivable account, SalePayment payment)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            // shortcut: balance is a version while it only decreases; use a revision when reversals are supported.
            var updated = await db.AccountsReceivable.Where(current => current.Id == account.Id &&
                    current.Balance == account.Balance && current.Balance >= payment.Amount)
                .ExecuteUpdateAsync(update => update.SetProperty(current => current.Balance, current => current.Balance - payment.Amount));
            if (updated != 1)
            {
                return ReceivableSettlement.Conflict;
            }
            if (!await db.LockActiveCashAccountAsync(account.OrganizationId, payment.CashAccountId))
            {
                return ReceivableSettlement.InvalidCashAccount;
            }

            db.SalePayments.Add(payment);
            await db.SaveChangesAsync();
            await transaction.CommitAsync();
            return ReceivableSettlement.Received;
        }
        catch (Exception exception) when (SalesPersistence.IsWriteConflict(exception))
        {
            db.ChangeTracker.Clear();
            return ReceivableSettlement.Conflict;
        }
    }
}
