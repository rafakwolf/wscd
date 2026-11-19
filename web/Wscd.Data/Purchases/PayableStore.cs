using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Purchases;
using Wscd.Domain.Sales;
using Wscd.Services.Purchases;
using Wscd.Services.Sales;

namespace Wscd.Data.Purchases;

public sealed class PayableStore(WscdDbContext db) : IPayableStore
{
    public async Task<IReadOnlyList<PayableSummary>> ListAsync(string? supplier, DateOnly? from, DateOnly? to,
        TitleStatus? status, DateOnly today)
    {
        var query = db.AccountsPayable.AsNoTracking();
        if (!string.IsNullOrEmpty(supplier))
        {
            var search = supplier.ToLowerInvariant();
            query = query.Where(account => account.Supplier.Name.ToLower().Contains(search));
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
            TitleStatus.Open => query.Where(account => account.Balance > 0),
            TitleStatus.Overdue => query.Where(account => account.Balance > 0 && account.DueDate < today),
            TitleStatus.Paid => query.Where(account => account.Balance == 0),
            TitleStatus.Cancelled => query.Where(_ => false),
            _ => query
        };

        return await query.OrderBy(account => account.Balance == 0).ThenBy(account => account.DueDate).ThenBy(account => account.Id)
            .Select(account => new PayableSummary(account.Id, account.PurchaseId, account.Supplier.Name,
                account.Description, account.DueDate, account.Amount, account.Balance))
            .ToListAsync();
    }

    public Task<AccountPayable?> FindAsync(int id) => db.AccountsPayable.AsNoTracking()
        .Include(account => account.Supplier)
        .Include(account => account.Payments.OrderByDescending(payment => payment.Id)).ThenInclude(payment => payment.CashAccount)
        .SingleOrDefaultAsync(account => account.Id == id);

    public Task<bool> CreateAsync(AccountPayable account) => db.CreateTitleAsync(account);

    public async Task<bool> UpdateManualAsync(AccountPayable account, Guid expectedRevision)
    {
        try
        {
            var updated = await db.AccountsPayable
                .Where(current => current.Id == account.Id && current.PurchaseId == null &&
                    current.Revision == expectedRevision && !current.Payments.Any())
                .ExecuteUpdateAsync(update => update
                    .SetProperty(current => current.SupplierId, account.SupplierId)
                    .SetProperty(current => current.Description, account.Description)
                    .SetProperty(current => current.Document, account.Document)
                    .SetProperty(current => current.CreatedDate, account.CreatedDate)
                    .SetProperty(current => current.DueDate, account.DueDate)
                    .SetProperty(current => current.Amount, account.Amount)
                    .SetProperty(current => current.Balance, account.Balance)
                    .SetProperty(current => current.Revision, Guid.NewGuid()));
            return updated == 1;
        }
        catch (Exception exception) when (FinancePersistence.IsWriteConflict(exception))
        {
            return false;
        }
    }

    public async Task<bool> DeleteManualAsync(int id, Guid expectedRevision)
    {
        try
        {
            var deleted = await db.AccountsPayable
                .Where(current => current.Id == id && current.PurchaseId == null &&
                    current.Revision == expectedRevision && !current.Payments.Any())
                .ExecuteDeleteAsync();
            return deleted == 1;
        }
        catch (Exception exception) when (FinancePersistence.IsWriteConflict(exception))
        {
            return false;
        }
    }

    public Task<TitleSettlement> PayAsync(AccountPayable account, PayablePayment payment) =>
        db.RecordSettlementAsync(account.OrganizationId, payment.CashAccountId, () => db.AccountsPayable
            .Where(current => current.Id == account.Id && current.Revision == account.Revision && current.Balance >= payment.Amount)
            .ExecuteUpdateAsync(update => update.SetProperty(current => current.Balance, current => current.Balance - payment.Amount)
                .SetProperty(current => current.Revision, Guid.NewGuid())), payment);

    public Task<TitleSettlement> ReverseAsync(AccountPayable account, PayablePayment payment, SettlementReversal reversal) =>
        db.ReverseSettlementAsync(
            () => db.AccountsPayable.Where(current => current.Id == account.Id && current.Revision == account.Revision &&
                    current.Balance <= current.Amount - payment.Amount)
                .ExecuteUpdateAsync(update => update.SetProperty(current => current.Balance, current => current.Balance + payment.Amount)
                    .SetProperty(current => current.Revision, Guid.NewGuid())),
            () => db.PayablePayments.Where(current => current.Id == payment.Id && current.AccountPayableId == account.Id && current.ReversedAtUtc == null)
                .ExecuteUpdateAsync(update => update.SetProperty(current => current.ReversedAtUtc, reversal.AtUtc)
                    .SetProperty(current => current.ReversalReason, reversal.Reason).SetProperty(current => current.ReversedByUserId, reversal.UserId)));
}
