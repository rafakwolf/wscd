using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.Data.Sales;

public sealed class ReceivableStore(WscdDbContext db) : IReceivableStore
{
    public async Task<IReadOnlyList<ReceivableSummary>> ListAsync(string? customer, DateOnly? from, DateOnly? to,
        TitleStatus? status, DateOnly today)
    {
        var query = db.AccountsReceivable.AsNoTracking();
        if (!string.IsNullOrEmpty(customer))
        {
            var search = customer.ToLowerInvariant();
            query = query.Where(account => account.Customer.Name.ToLower().Contains(search));
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
            TitleStatus.Paid => query.Where(account => account.Balance == 0 &&
                (account.Sale == null || account.Sale.CancelledAtUtc == null)),
            TitleStatus.Cancelled => query.Where(account => account.Sale != null && account.Sale.CancelledAtUtc != null),
            _ => query
        };

        return await query.OrderBy(account => account.Balance == 0).ThenBy(account => account.DueDate).ThenBy(account => account.Id)
            .Select(account => new ReceivableSummary(account.Id, account.SaleId, account.Customer.Name,
                account.Description, account.DueDate, account.Amount, account.Balance,
                account.Sale != null && account.Sale.CancelledAtUtc != null))
            .ToListAsync();
    }

    public Task<AccountReceivable?> FindAsync(int id) => db.AccountsReceivable.AsNoTracking()
        .Include(account => account.Customer)
        .Include(account => account.Sale).ThenInclude(sale => sale!.Payments)
        .Include(account => account.Sale).ThenInclude(sale => sale!.Returns)
        .Include(account => account.Payments.OrderByDescending(payment => payment.Id)).ThenInclude(payment => payment.CashAccount)
        .AsSingleQuery()
        .SingleOrDefaultAsync(account => account.Id == id);

    public Task<bool> CreateAsync(AccountReceivable account) => db.CreateTitleAsync(account);

    public Task<TitleSettlement> ReceiveAsync(AccountReceivable account, SalePayment payment) =>
        db.RecordSettlementAsync(account.OrganizationId, payment.CashAccountId, () => db.AccountsReceivable
            .Where(current => current.Id == account.Id && current.Revision == account.Revision && current.Balance >= payment.Amount)
            .ExecuteUpdateAsync(update => update.SetProperty(current => current.Balance, current => current.Balance - payment.Amount)
                .SetProperty(current => current.Revision, Guid.NewGuid())), payment);

    public Task<TitleSettlement> ReverseAsync(AccountReceivable account, SalePayment payment, SettlementReversal reversal) =>
        db.ReverseSettlementAsync(
            () => db.AccountsReceivable.Where(current => current.Id == account.Id && current.Revision == account.Revision &&
                    current.Balance <= current.Amount - payment.Amount)
                .ExecuteUpdateAsync(update => update.SetProperty(current => current.Balance, current => current.Balance + payment.Amount)
                    .SetProperty(current => current.Revision, Guid.NewGuid())),
            () => db.SalePayments.Where(current => current.Id == payment.Id && current.AccountReceivableId == account.Id && current.ReversedAtUtc == null)
                .ExecuteUpdateAsync(update => update.SetProperty(current => current.ReversedAtUtc, reversal.AtUtc)
                    .SetProperty(current => current.ReversalReason, reversal.Reason).SetProperty(current => current.ReversedByUserId, reversal.UserId)));
}
