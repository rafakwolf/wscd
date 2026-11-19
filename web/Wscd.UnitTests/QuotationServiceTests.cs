using Wscd.Domain.Catalogs;
using Wscd.Domain.Inventory;
using Wscd.Domain.Quotations;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;
using Wscd.Services.Quotations;

namespace Wscd.UnitTests;

public sealed class QuotationServiceTests
{
    [Fact]
    public async Task CompletedQuotationPreservesPriceAndRejectsItemChangesUntilReopened()
    {
        var quotation = new Quotation { Id = 1, Date = new DateOnly(2026, 11, 18) };
        var product = new Product { Id = 2, Name = "Caf\u00e9", SalePrice = 50m };
        var promotion = new Promotion
        {
            ProductId = product.Id,
            PromotionPrice = 10.01m,
            StartDate = quotation.Date,
            EndDate = quotation.Date
        };
        var service = new QuotationService(new Store(quotation), null!, null!, new Products(product),
            new Promotions(promotion), null!);

        Assert.False(await service.SetCompletedAsync(quotation.Id, true));
        Assert.True(await service.AddItemAsync(quotation.Id, product.Id, 1, 50m));
        Assert.False(await service.AddItemAsync(quotation.Id, product.Id, 1, 0m));
        Assert.True(await service.SetCompletedAsync(quotation.Id, true));
        promotion.PromotionPrice = 20m;
        product.SalePrice = 100m;

        var item = Assert.Single(quotation.Items);
        Assert.Equal(10.01m, item.UnitPrice);
        Assert.Equal(5.01m, quotation.Total);
        Assert.False(await service.RemoveItemAsync(quotation.Id, item.Id));
        Assert.True(await service.SetCompletedAsync(quotation.Id, false));
        Assert.True(await service.RemoveItemAsync(quotation.Id, item.Id));
        Assert.Equal(0m, quotation.Total);
    }

    private sealed class Store(Quotation quotation) : IQuotationStore
    {
        public Task<bool> UpdateAsync(int id, Func<Quotation, bool> change) => Task.FromResult(id == quotation.Id && change(quotation));
        public Task<bool> CreateAsync(Quotation quotation) => throw new NotSupportedException();
        public Task<Quotation?> FindAsync(int id) => throw new NotSupportedException();
        public Task<IReadOnlyList<QuotationSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }

    private sealed class Products(Product product) : ICatalogService<Product>
    {
        public Task<Product?> FindAsync(int id) => Task.FromResult(id == product.Id ? product : null);
        public Task<IReadOnlyList<Product>> ListAsync(string? search) => throw new NotSupportedException();
        public Task<bool> SaveAsync(Product entity) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }

    private sealed class Promotions(Promotion promotion) : IPromotionStore
    {
        public Task<Promotion?> FindByProductAsync(int productId) => Task.FromResult(productId == promotion.ProductId ? promotion : null);
        public Task<IReadOnlyList<PromotionSummary>> ListAsync() => throw new NotSupportedException();
        public Task<Promotion?> FindAsync(int id) => throw new NotSupportedException();
        public Task<bool> SaveAsync(Promotion promotion) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }
}
