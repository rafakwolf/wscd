using Wscd.Domain.Sales;

namespace Wscd.Services.Sales;

public interface IReceivableStore
{
    Task<IReadOnlyList<ReceivableSummary>> ListAsync(string? customer, DateOnly? from, DateOnly? to,
        ReceivableStatus? status, DateOnly today);
    Task<AccountReceivable?> FindAsync(int id);
    Task<ReceivableSettlement> ReceiveAsync(AccountReceivable account, SalePayment payment);
}

public enum ReceivableStatus { Open, Overdue, Paid }
public enum ReceivableSettlement { Received, NotFound, InvalidPayment, InvalidCashAccount, Conflict }

public sealed record ReceivableSummary(int Id, int SaleId, string CustomerName, DateOnly DueDate, decimal Amount, decimal Balance);
