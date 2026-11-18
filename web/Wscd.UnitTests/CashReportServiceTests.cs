using Wscd.Domain.Sales;
using Wscd.Services.Reports;

namespace Wscd.UnitTests;

public sealed class CashReportServiceTests
{
    [Theory]
    [InlineData(2026, 11, 18, 3, 3, 0)]
    [InlineData(2018, 11, 4, 3, 2, 1)]
    public async Task PeriodUsesInclusiveBrasiliaDatesAndSeparatesEntriesFromExpenses(
        int year, int month, int day, int startHour, int endHour, int localStartHour)
    {
        var date = new DateOnly(year, month, day);
        var start = new DateTimeOffset(date.ToDateTime(new TimeOnly(startHour, 0)), TimeSpan.Zero);
        var end = new DateTimeOffset(date.AddDays(1).ToDateTime(new TimeOnly(endHour, 0)), TimeSpan.Zero);
        var store = new Store([
            new CashMovement(1, start.AddSeconds(-1), "Caixa", "Cliente", PaymentMethod.Cash, 10m),
            new CashMovement(2, start, "Caixa", "Cliente", PaymentMethod.Pix, 20.15m),
            new CashMovement(null, end.AddSeconds(-1), "Caixa", "Fornecedor", PaymentMethod.Cash, 5.10m, AccountPayableId: 3),
            new CashMovement(4, end, "Caixa", "Cliente", PaymentMethod.Cash, 50m)
        ]);

        var report = Assert.IsType<CashReport>(await new CashReportService(store).GetAsync(7, date, date));

        Assert.Equal(7, store.AccountId);
        Assert.Equal(3, report.Movements[0].AccountPayableId);
        Assert.Equal(2, report.Movements[1].SaleId);
        Assert.Equal(localStartHour, report.Movements[1].OccurredAt.Hour);
        Assert.Equal(date, DateOnly.FromDateTime(report.Movements[0].OccurredAt.DateTime));
        Assert.Equal(20.15m, report.TotalEntries);
        Assert.Equal(5.10m, report.TotalExpenses);
    }

    [Fact]
    public async Task ReversalChangesDirectionWithoutRemovingOriginalMovement()
    {
        var time = new DateTimeOffset(2026, 11, 18, 12, 0, 0, TimeSpan.Zero);
        var receipt = new CashMovement(null, time, "Caixa", "Cliente", PaymentMethod.Cash, 10m, AccountReceivableId: 4);
        var expense = new CashMovement(null, time, "Caixa", "Fornecedor", PaymentMethod.Pix, 5m, AccountPayableId: 8);
        var store = new Store([receipt, expense,
            receipt with { IsReversal = true, OccurredAt = time.AddDays(1) },
            expense with { IsReversal = true, OccurredAt = time.AddDays(1) }]);
        var report = Assert.IsType<CashReport>(await new CashReportService(store).GetAsync(null, new DateOnly(2026, 11, 19), null));

        Assert.Equal(5m, report.TotalEntries);
        Assert.Equal(10m, report.TotalExpenses);
        Assert.All(report.Movements, movement => Assert.True(movement.IsReversal));
    }

    [Fact]
    public async Task ReversedPeriodDoesNotQueryReceipts()
    {
        var store = new Store([]);
        var date = new DateOnly(2026, 11, 18);

        Assert.Null(await new CashReportService(store).GetAsync(7, date, date.AddDays(-1)));
        Assert.Null(store.AccountId);
    }

    private sealed class Store(IReadOnlyList<CashMovement> movements) : ICashMovementStore
    {
        public int? AccountId { get; private set; }

        public Task<IReadOnlyList<CashMovement>> ListAsync(int? cashAccountId, DateTimeOffset? fromUtc, DateTimeOffset? toUtcExclusive)
        {
            AccountId = cashAccountId;
            return Task.FromResult<IReadOnlyList<CashMovement>>(movements.Where(movement =>
                (fromUtc is null || movement.OccurredAt >= fromUtc) &&
                (toUtcExclusive is null || movement.OccurredAt < toUtcExclusive)).ToArray());
        }
    }
}
