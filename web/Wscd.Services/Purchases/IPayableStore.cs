using Wscd.Domain.Purchases;
using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.Services.Purchases;

public interface IPayableStore
{
    Task<IReadOnlyList<PayableSummary>> ListAsync(string? supplier, DateOnly? from, DateOnly? to,
        TitleStatus? status, DateOnly today);
    Task<AccountPayable?> FindAsync(int id);
    Task<bool> CreateAsync(AccountPayable account);
    Task<bool> UpdateManualAsync(AccountPayable account, Guid expectedRevision);
    Task<bool> DeleteManualAsync(int id, Guid expectedRevision);
    Task<TitleSettlement> PayAsync(AccountPayable account, PayablePayment payment);
    Task<TitleSettlement> ReverseAsync(AccountPayable account, PayablePayment payment, SettlementReversal reversal);
}

public sealed record PayableSummary(int Id, int? PurchaseId, string SupplierName, string? Description, DateOnly DueDate, decimal Amount, decimal Balance);
