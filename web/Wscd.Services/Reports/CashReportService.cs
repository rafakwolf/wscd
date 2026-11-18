namespace Wscd.Services.Reports;

public sealed class CashReportService(ICashMovementStore store)
{
    private static readonly TimeZoneInfo Brasilia = TimeZoneInfo.FindSystemTimeZoneById("America/Sao_Paulo");

    public static DateTimeOffset InBrasilia(DateTimeOffset timestamp) => TimeZoneInfo.ConvertTime(timestamp, Brasilia);

    public static DateOnly Today => DateOnly.FromDateTime(InBrasilia(DateTimeOffset.UtcNow).DateTime);

    public async Task<CashReport?> GetAsync(int? cashAccountId, DateOnly? from, DateOnly? to) =>
        await ReadAsync(cashAccountId, from, to) is { } movements ? new CashReport(movements) : null;

    public async Task<TitleSettlementReport?> GetSettlementsAsync(TitleSide side, string? party, int? cashAccountId, DateOnly? from, DateOnly? to) =>
        await ReadAsync(cashAccountId, from, to, side, string.IsNullOrWhiteSpace(party) ? null : party.Trim()) is { } movements
            ? new TitleSettlementReport(movements) : null;

    private async Task<IReadOnlyList<CashMovement>?> ReadAsync(int? cashAccountId, DateOnly? from, DateOnly? to,
        TitleSide? side = null, string? party = null)
    {
        if (from > to)
        {
            return null;
        }

        var movements = await store.ListAsync(cashAccountId,
            from is DateOnly start ? StartOfDayUtc(start) : null,
            to is DateOnly end && end != DateOnly.MaxValue ? StartOfDayUtc(end.AddDays(1)) : null, side, party);

        return movements.OrderByDescending(movement => movement.OccurredAt).Select(movement => movement with
        {
            OccurredAt = InBrasilia(movement.OccurredAt)
        }).ToArray();
    }

    private static DateTimeOffset StartOfDayUtc(DateOnly date)
    {
        var midnight = date.ToDateTime(TimeOnly.MinValue);
        // Historical daylight saving transitions in Brasilia could skip midnight.
        if (Brasilia.IsInvalidTime(midnight))
        {
            midnight = midnight.AddHours(1);
        }
        return TimeZoneInfo.ConvertTimeToUtc(midnight, Brasilia);
    }
}

public sealed record CashReport(IReadOnlyList<CashMovement> Movements)
{
    public decimal TotalEntries => Movements.Where(item => !item.IsExpense).Sum(item => item.Amount);
    public decimal TotalExpenses => Movements.Where(item => item.IsExpense).Sum(item => item.Amount);
}

public sealed record TitleSettlementReport(IReadOnlyList<CashMovement> Movements)
{
    public decimal Gross => Movements.Where(item => !item.IsReversal).Sum(item => item.Amount);
    public decimal Reversals => Movements.Where(item => item.IsReversal).Sum(item => item.Amount);
    public decimal Net => Gross - Reversals;
}
