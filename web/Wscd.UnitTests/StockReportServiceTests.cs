using Wscd.Services.Reports;

namespace Wscd.UnitTests;

public sealed class StockReportServiceTests
{
    [Fact]
    public async Task StockPositionIncludesTheExactMinimumAndSeparatelyCountsItemsWithoutStock()
    {
        var store = new Store([
            new(1, "Cafe", "7890000000001", "Bebidas", "Fornecedor", "UN", 5, 5),
            new(2, "Cha", null, null, null, null, 0, 0),
            new(3, "Leite", "7890000000003", "Bebidas", "Fornecedor", "L", 6, 5)
        ]);
        var report = Assert.IsType<StockPositionReport>(
            await new StockReportService(store).GetPositionAsync("  Bebida  ", 7, 8, StockPositionFilter.All));

        Assert.Equal(("Bebida", 7, 8, StockPositionFilter.All), store.Filter);
        Assert.Equal(3, report.Products.Count);
        Assert.Equal(2, report.AtOrBelowMinimumCount);
        Assert.Equal(1, report.OutOfStockCount);
        Assert.False(report.Products[0].OutOfStock);
        Assert.True(report.Products[1].AtOrBelowMinimum);
    }

    [Fact]
    public async Task InvalidFiltersDoNotQueryProducts()
    {
        var store = new Store([]);
        var service = new StockReportService(store);

        Assert.Null(await service.GetPositionAsync(null, 0, null, StockPositionFilter.All));
        Assert.Null(await service.GetPositionAsync(null, null, -1, StockPositionFilter.All));
        Assert.Null(await service.GetPositionAsync(null, null, null, (StockPositionFilter)99));
        Assert.Null(store.Filter);

        Assert.Empty((await service.GetPositionAsync("  ", null, null, StockPositionFilter.OutOfStock))!.Products);
        Assert.Equal(((string?)null, (int?)null, (int?)null, StockPositionFilter.OutOfStock), store.Filter);
    }

    [Fact]
    public async Task ProductsByGroupQueriesOnlyTheSelectedGroup()
    {
        var expected = new ProductGroupReportRow("Cafe", "7890000000001", "Fornecedor", 10m, 25m, 12.50m, 0);
        var store = new Store([]) { GroupRows = [expected] };
        var service = new StockReportService(store);

        Assert.Null(await service.GetProductsByGroupAsync(0));
        Assert.Null(store.RequestedGroupId);

        Assert.Equal(expected, Assert.Single((await service.GetProductsByGroupAsync(7))!));
        Assert.Equal(7, store.RequestedGroupId);
    }

    private sealed class Store(IReadOnlyList<StockPositionProduct> products) : IStockReportStore
    {
        public (string? Search, int? GroupId, int? SupplierId, StockPositionFilter Status)? Filter { get; private set; }
        public IReadOnlyList<ProductGroupReportRow> GroupRows { get; init; } = [];
        public int? RequestedGroupId { get; private set; }

        public Task<IReadOnlyList<StockPositionProduct>> ListPositionAsync(string? search, int? groupId, int? supplierId,
            StockPositionFilter status)
        {
            Filter = (search, groupId, supplierId, status);
            return Task.FromResult(products);
        }

        public Task<IReadOnlyList<ProductGroupReportRow>> ListProductsByGroupAsync(int groupId)
        {
            RequestedGroupId = groupId;
            return Task.FromResult(GroupRows);
        }
    }
}
