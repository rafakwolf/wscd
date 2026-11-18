using Wscd.Domain.Sales;

namespace Wscd.Services.Reports;

public interface ICashMovementStore
{
    Task<IReadOnlyList<CashMovement>> ListAsync(int? cashAccountId, DateTimeOffset? fromUtc, DateTimeOffset? toUtcExclusive);
}

public sealed record CashMovement(int? SaleId, DateTimeOffset OccurredAt, string CashAccountName, string PartyName,
    PaymentMethod Method, decimal Amount, int? AccountReceivableId = null, int? AccountPayableId = null)
{
    public bool IsReversal { get; init; }
    public bool IsSaleCancellation { get; init; }
    public bool IsSaleReturn { get; init; }
    public bool IsExpense => IsSaleReturn || (AccountPayableId.HasValue != IsReversal);
}
