using Wscd.Domain.Sales;

namespace Wscd.Services.Sales;

public interface IReceivableStore
{
    Task<IReadOnlyList<ReceivableSummary>> ListAsync(string? customer, DateOnly? from, DateOnly? to,
        TitleStatus? status, DateOnly today);
    Task<AccountReceivable?> FindAsync(int id);
    Task<bool> CreateAsync(AccountReceivable account);
    Task<TitleSettlement> ReceiveAsync(AccountReceivable account, SalePayment payment);
    Task<TitleSettlement> ReverseAsync(AccountReceivable account, SalePayment payment, SettlementReversal reversal);
}

public enum TitleStatus { Open, Overdue, Paid }
public enum TitleSettlement { Recorded, NotFound, InvalidPayment, InvalidCashAccount, Conflict, AlreadyReversed, InvalidReversal }

public sealed record ReceivableSummary(int Id, int? SaleId, string CustomerName, string? Description, DateOnly DueDate, decimal Amount, decimal Balance);
