namespace Wscd.Services.Reports;

public sealed class CashReportService(ICashMovementStore store)
{
    private static readonly TimeZoneInfo Brasilia = TimeZoneInfo.FindSystemTimeZoneById("America/Sao_Paulo");

    public static DateTimeOffset InBrasilia(DateTimeOffset timestamp) => TimeZoneInfo.ConvertTime(timestamp, Brasilia);

    public static DateOnly Today => DateOnly.FromDateTime(InBrasilia(DateTimeOffset.UtcNow).DateTime);

    public async Task<CashReport?> GetAsync(int? cashAccountId, DateOnly? from, DateOnly? to)
    {
        if (from > to)
        {
            return null;
        }

        var movements = await store.ListAsync(cashAccountId,
            from is DateOnly start ? StartOfDayUtc(start) : null,
            to is DateOnly end && end != DateOnly.MaxValue ? StartOfDayUtc(end.AddDays(1)) : null);

        return new CashReport(movements.OrderByDescending(movement => movement.OccurredAt).Select(movement => movement with
        {
            OccurredAt = InBrasilia(movement.OccurredAt)
        }).ToArray());
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
