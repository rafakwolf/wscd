using Wscd.Services.Reports;

namespace Wscd.UnitTests;

public sealed class PeriodSalesReportServiceTests
{
    [Fact]
    public async Task ReportSeparatesDiscountsAndReturnsWithoutDroppingFullyReturnedSales()
    {
        var from = new DateOnly(2026, 11, 1);
        var to = from.AddDays(17);
        var store = new Store([
            new(1, from, "Cliente A", "Vendedor", 5.25m, 29.75m, 10m),
            new(2, to, "Cliente A", "Vendedor", 1m, 25m, 25m),
            new(3, to, "Cliente A", "Vendedor", 0m, 5.45m, 0m)
        ]);
        var report = Assert.IsType<PeriodSalesReport>(
            await new PeriodSalesReportService(store).GetAsync(from, to, "  Cliente A  ", 4));

        Assert.Equal((from, to, "Cliente A", 4), store.Filter);
        Assert.Equal(3, report.Rows.Count);
        Assert.Equal(0m, report.Rows[1].NetTotal);
        Assert.Equal(6.25m, report.ItemDiscounts);
        Assert.Equal(60.20m, report.OriginalTotal);
        Assert.Equal(35m, report.ReturnedAmount);
        Assert.Equal(25.20m, report.NetTotal);
    }

    [Fact]
    public async Task InvalidFiltersDoNotQueryTheStore()
    {
        var date = new DateOnly(2026, 11, 18);
        var store = new Store([]);
        var service = new PeriodSalesReportService(store);

        Assert.Null(await service.GetAsync(date, date.AddDays(-1), null, null));
        Assert.Null(await service.GetAsync(date, date, null, 0));
        Assert.Null(store.Filter);

        Assert.Empty((await service.GetAsync(date, date, "  ", null))!.Rows);
        Assert.Equal((date, date, (string?)null, (int?)null), store.Filter);
    }

    private sealed class Store(IReadOnlyList<PeriodSaleRow> rows) : IPeriodSalesReportStore
    {
        public (DateOnly From, DateOnly To, string? Customer, int? SellerId)? Filter { get; private set; }

        public Task<IReadOnlyList<PeriodSaleRow>> ListAsync(DateOnly from, DateOnly to, string? customer, int? sellerId)
        {
            Filter = (from, to, customer, sellerId);
            return Task.FromResult(rows);
        }
    }
}
