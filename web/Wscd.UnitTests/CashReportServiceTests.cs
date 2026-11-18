using Wscd.Services.Reports;

namespace Wscd.UnitTests;

public sealed class CashReportServiceTests
{
    [Theory]
    [InlineData(2026, 11, 18, 3, 3, 0)]
    [InlineData(2018, 11, 4, 3, 2, 1)]
    public async Task PeriodUsesInclusiveBrasiliaDatesAndTotalsOnlyMatchingReceipts(
        int year, int month, int day, int startHour, int endHour, int localStartHour)
    {
        var date = new DateOnly(year, month, day);
        var start = new DateTimeOffset(date.ToDateTime(new TimeOnly(startHour, 0)), TimeSpan.Zero);
        var end = new DateTimeOffset(date.AddDays(1).ToDateTime(new TimeOnly(endHour, 0)), TimeSpan.Zero);
        var store = new Store([
            new CashReceipt(1, start.AddSeconds(-1), "Caixa", "Cliente", 10m),
            new CashReceipt(2, start, "Caixa", "Cliente", 20.15m),
            new CashReceipt(3, end.AddSeconds(-1), "Caixa", "Cliente", 5.10m),
            new CashReceipt(4, end, "Caixa", "Cliente", 50m)
        ]);

        var report = Assert.IsType<CashReport>(await new CashReportService(store).GetAsync(7, date, date));

        Assert.Equal(7, store.AccountId);
        Assert.Equal([2, 3], report.Receipts.Select(receipt => receipt.SaleId));
        Assert.Equal(localStartHour, report.Receipts[0].ReceivedAt.Hour);
        Assert.Equal(date, DateOnly.FromDateTime(report.Receipts[1].ReceivedAt.DateTime));
        Assert.Equal(25.25m, report.Total);
    }

    [Fact]
    public async Task ReversedPeriodDoesNotQueryReceipts()
    {
        var store = new Store([]);
        var date = new DateOnly(2026, 11, 18);

        Assert.Null(await new CashReportService(store).GetAsync(7, date, date.AddDays(-1)));
        Assert.Null(store.AccountId);
    }

    private sealed class Store(IReadOnlyList<CashReceipt> receipts) : ICashReceiptStore
    {
        public int? AccountId { get; private set; }

        public Task<IReadOnlyList<CashReceipt>> ListAsync(int? cashAccountId, DateTimeOffset? fromUtc, DateTimeOffset? toUtcExclusive)
        {
            AccountId = cashAccountId;
            return Task.FromResult<IReadOnlyList<CashReceipt>>(receipts.Where(receipt =>
                (fromUtc is null || receipt.ReceivedAt >= fromUtc) &&
                (toUtcExclusive is null || receipt.ReceivedAt < toUtcExclusive)).ToArray());
        }
    }
}
