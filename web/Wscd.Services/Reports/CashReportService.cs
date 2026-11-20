namespace Wscd.Services.Reports;

public sealed class CashReportService(ICashMovementStore store)
{
    public static DateTimeOffset InBrasilia(DateTimeOffset timestamp) => BrasiliaClock.InBrasilia(timestamp);

    public static DateOnly Today => BrasiliaClock.Today;

    public async Task<CashReport?> GetAsync(int? cashAccountId, DateOnly? from, DateOnly? to,
        bool? isExpense = null, string? search = null) =>
        await ReadAsync(cashAccountId, from, to, party: string.IsNullOrWhiteSpace(search) ? null : search.Trim()) is { } movements
            ? new CashReport(isExpense is bool expense
                ? movements.Where(item => item.IsExpense == expense).ToArray()
                : movements)
            : null;

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
            from is DateOnly start ? BrasiliaClock.StartOfDayUtc(start) : null,
            to is DateOnly end && end != DateOnly.MaxValue ? BrasiliaClock.StartOfDayUtc(end.AddDays(1)) : null, side, party);

        return movements.OrderByDescending(movement => movement.OccurredAt).Select(movement => movement with
        {
            OccurredAt = InBrasilia(movement.OccurredAt)
        }).ToArray();
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
