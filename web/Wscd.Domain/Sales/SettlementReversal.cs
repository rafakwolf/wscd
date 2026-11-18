namespace Wscd.Domain.Sales;

public sealed record SettlementReversal(DateTimeOffset AtUtc, string Reason, string UserId);
