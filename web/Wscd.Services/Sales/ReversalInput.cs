using Wscd.Domain.Sales;

namespace Wscd.Services.Sales;

public sealed class ReversalInput
{
    public Guid? Revision { get; set; }
    public string? Reason { get; set; }

    internal SettlementReversal? Build(string? userId) =>
        Revision.HasValue && Reason?.Trim() is { Length: > 0 and <= 240 } reason &&
        !string.IsNullOrWhiteSpace(userId) && userId.Length <= 450
            ? new SettlementReversal(DateTimeOffset.UtcNow, reason, userId)
            : null;
}
