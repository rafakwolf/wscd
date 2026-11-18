namespace Wscd.Services.Reports;

public interface ICashReceiptStore
{
    Task<IReadOnlyList<CashReceipt>> ListAsync(int? cashAccountId, DateTimeOffset? fromUtc, DateTimeOffset? toUtcExclusive);
}

public sealed record CashReceipt(int SaleId, DateTimeOffset ReceivedAt, string CashAccountName, string CustomerName, decimal Amount);
