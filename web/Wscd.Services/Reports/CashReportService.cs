namespace Wscd.Services.Reports;

public sealed class CashReportService(ICashReceiptStore store)
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

        var receipts = await store.ListAsync(cashAccountId,
            from is DateOnly start ? StartOfDayUtc(start) : null,
            to is DateOnly end && end != DateOnly.MaxValue ? StartOfDayUtc(end.AddDays(1)) : null);

        return new CashReport(receipts.Select(receipt => receipt with
        {
            ReceivedAt = InBrasilia(receipt.ReceivedAt)
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

public sealed record CashReport(IReadOnlyList<CashReceipt> Receipts)
{
    public decimal Total => Receipts.Sum(receipt => receipt.Amount);
}
