using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.UnitTests;

public sealed class SellerCommissionServiceTests
{
    [Fact]
    public async Task ReportDeductsReturnsAndRoundsEachItemBeforeGroupingByProduct()
    {
        var from = new DateOnly(2026, 11, 1);
        var to = from.AddDays(9);
        var store = new Store([
            new(5, "Cafe", 3, 12m, 7.50m, 1, 4.01m),
            new(5, "Cafe", 1, 1m, 0.50m, 0, 0m),
            new(5, "Cafe", 1, 9m, 90m, 1, 9m),
            new(6, "Bolo", 1, 4.01m, 0m, 0, 0m)
        ]);
        var service = new SellerCommissionService(store, new Sellers());

        Assert.Null(await service.GetAsync(7, to, from));
        Assert.Null(await service.GetAsync(8, from, to));
        Assert.Null(store.Filter);
        var report = Assert.IsType<SellerCommissionReport>(await service.GetAsync(7, from, to));

        Assert.Equal((7, from, to), store.Filter);
        Assert.Equal("Vendedor de teste", report.SellerName);
        Assert.Equal(new SellerCommissionRow("Bolo", 1, 4.01m, 0m), report.Rows[0]);
        Assert.Equal(new SellerCommissionRow("Cafe", 3, 8.99m, 0.61m), report.Rows[1]);
        Assert.Equal(13m, report.NetSales);
        Assert.Equal(0.61m, report.Commission);
    }

    private sealed class Store(IReadOnlyList<SellerCommissionLine> lines) : ISellerCommissionStore
    {
        public (int SellerId, DateOnly From, DateOnly To)? Filter { get; private set; }

        public Task<IReadOnlyList<SellerCommissionLine>> ListAsync(int sellerId, DateOnly from, DateOnly to)
        {
            Filter = (sellerId, from, to);
            return Task.FromResult(lines);
        }
    }

    private sealed class Sellers : ICatalogService<Seller>
    {
        public Task<Seller?> FindAsync(int id) => Task.FromResult(id == 7
            ? new Seller { Id = id, Name = "Vendedor de teste", IsActive = false }
            : null);

        public Task<IReadOnlyList<Seller>> ListAsync(string? search) => throw new NotSupportedException();
        public Task<bool> SaveAsync(Seller entity) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }
}
