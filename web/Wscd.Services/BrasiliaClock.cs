namespace Wscd.Services;

/// <summary>
/// Centraliza datas e horários correntes no fuso horário de Brasília.
/// </summary>
public static class BrasiliaClock
{
    public static readonly TimeZoneInfo TimeZone = TimeZoneInfo.FindSystemTimeZoneById("America/Sao_Paulo");

    public static DateTimeOffset InBrasilia(DateTimeOffset timestamp) => TimeZoneInfo.ConvertTime(timestamp, TimeZone);

    public static DateOnly Today => DateOnly.FromDateTime(InBrasilia(DateTimeOffset.UtcNow).DateTime);

    public static DateTimeOffset StartOfDayUtc(DateOnly date)
    {
        var midnight = date.ToDateTime(TimeOnly.MinValue);
        // Historical daylight saving transitions in Brasilia could skip midnight.
        if (TimeZone.IsInvalidTime(midnight))
        {
            midnight = midnight.AddHours(1);
        }
        return TimeZoneInfo.ConvertTimeToUtc(midnight, TimeZone);
    }
}
