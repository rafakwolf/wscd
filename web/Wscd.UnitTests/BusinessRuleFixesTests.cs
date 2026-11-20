using Wscd.Domain.Catalogs;
using Wscd.Domain.Inventory;
using Wscd.Domain.Purchases;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;
using Wscd.Services.Organizations;
using Wscd.Services.Purchases;

namespace Wscd.UnitTests;

public sealed class BusinessRuleFixesTests
{
    [Fact]
    public async Task CatalogProductEditPreservesManualSalePriceAndRecalculatesPromotion()
    {
        var orgId = Guid.NewGuid();
        var product = new Product { Id = 5, OrganizationId = orgId, Name = "Café", Cost = 10m, MarginPercent = 0m, SalePrice = 25m };
        var promo = new Promotion
        {
            Id = 9,
            OrganizationId = orgId,
            ProductId = 5,
            RegularPrice = 25m,
            DiscountPercent = 20m,
            PromotionPrice = 20m,
            StartDate = new DateOnly(2026, 11, 1),
            EndDate = new DateOnly(2026, 11, 30)
        };
        var productStore = new InMemoryProductStore(product);
        var promoStore = new InMemoryPromotionStore(promo, product);
        var service = new CatalogService<Product>(productStore, new Org(orgId), promoStore);

        // Changing cost on edit must NOT overwrite SalePrice sent by caller, and must sync promotion.
        var edited = new Product { Id = 5, Name = "Café", Cost = 12m, MarginPercent = 0m, SalePrice = 15m };
        Assert.True(await service.SaveAsync(edited));
        Assert.Equal(15m, product.SalePrice);
        Assert.Equal(15m, promo.RegularPrice);
        Assert.Equal(12m, promo.PromotionPrice);

        // Negative values or blank name must be rejected.
        Assert.False(await service.SaveAsync(new Product { Id = 5, Name = "   ", Cost = 10m, SalePrice = 15m }));
        Assert.False(await service.SaveAsync(new Product { Id = 5, Name = "Café", Cost = -1m, SalePrice = 15m }));
        Assert.False(await service.SaveAsync(new Product { Id = 5, Name = "Café", Cost = 10m, SalePrice = -5m }));
    }

    [Fact]
    public async Task PurchaseCompletionRejectsZeroTotalPreservesManualPriceAndSyncsPromotion()
    {
        var orgId = Guid.NewGuid();
        var product = new Product { Id = 1, OrganizationId = orgId, Name = "Arroz", Cost = 10m, MarginPercent = 0m, SalePrice = 25m };
        var promo = new Promotion
        {
            Id = 2,
            OrganizationId = orgId,
            ProductId = 1,
            RegularPrice = 25m,
            DiscountPercent = 10m,
            PromotionPrice = 22.50m,
            StartDate = new DateOnly(2026, 11, 1),
            EndDate = new DateOnly(2026, 11, 30)
        };
        var purchase = new Purchase
        {
            Id = 3,
            OrganizationId = orgId,
            SupplierId = 4,
            PurchaseDate = new DateOnly(2026, 11, 18),
            DueDate = new DateOnly(2026, 11, 20),
            Total = 0m,
            Items = [new PurchaseItem { Id = 1, ProductId = 1, Quantity = 2, UnitCost = 0m }]
        };
        var purchaseStore = new InMemoryPurchaseStore(purchase, product);
        var promoStore = new InMemoryPromotionStore(promo, product);
        var service = new PurchaseService(
            purchaseStore,
            new Suppliers(),
            new InMemoryProductCatalog(product),
            new Org(orgId),
            promoStore);

        // Total == 0 must be rejected.
        var zeroResult = await service.CompleteAsync(purchase.Id);
        Assert.False(zeroResult.Succeeded);
        Assert.Equal("PurchaseIncomplete", zeroResult.ErrorCode);

        // Total > 0 with MarginPercent == 0 preserves manual SalePrice (25m).
        purchase.Items[0].UnitCost = 12m;
        purchase.Total = 24m;
        var okResult = await service.CompleteAsync(purchase.Id);
        Assert.True(okResult.Succeeded);
        Assert.Equal(25m, Assert.Single(purchaseStore.CompletedReceipts!).SalePrice);

        // MarginPercent > 0 recalculates SalePrice and updates Promotion.
        purchase.IsCompleted = false;
        product.MarginPercent = 50m;
        purchase.Items[0].UnitCost = 20m;
        purchase.Total = 40m;
        Assert.True((await service.CompleteAsync(purchase.Id)).Succeeded);
        Assert.Equal(30m, Assert.Single(purchaseStore.CompletedReceipts!).SalePrice);
        Assert.Equal(30m, promo.RegularPrice);
        Assert.Equal(27m, promo.PromotionPrice);
    }

    private sealed record Org(Guid? OrganizationId) : ICurrentOrganization;

    private sealed class InMemoryProductStore(Product stored) : ICatalogStore<Product>
    {
        public Task<IReadOnlyList<Product>> ListAsync(string? search) => throw new NotSupportedException();
        public Task<Product?> FindAsync(int id) => Task.FromResult<Product?>(id == stored.Id ? stored : null);
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
        public Task<bool> SaveAsync(Product entity)
        {
            stored.Name = entity.Name;
            stored.Cost = entity.Cost;
            stored.MarginPercent = entity.MarginPercent;
            stored.SalePrice = entity.SalePrice;
            return Task.FromResult(true);
        }
    }

    private sealed class InMemoryProductCatalog(Product product) : ICatalogService<Product>
    {
        public Task<IReadOnlyList<Product>> ListAsync(string? search) => throw new NotSupportedException();
        public Task<Product?> FindAsync(int id) => Task.FromResult<Product?>(id == product.Id ? product : null);
        public Task<bool> SaveAsync(Product entity) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }

    private sealed class Suppliers : ICatalogService<Supplier>
    {
        public Task<IReadOnlyList<Supplier>> ListAsync(string? search) => throw new NotSupportedException();
        public Task<Supplier?> FindAsync(int id) => Task.FromResult<Supplier?>(new Supplier { Id = id, Name = "Fornecedor" });
        public Task<bool> SaveAsync(Supplier entity) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }

    private sealed class InMemoryPromotionStore(Promotion? promo, Product product) : IPromotionStore
    {
        private Promotion? current = promo;
        public Task<IReadOnlyList<PromotionSummary>> ListAsync() => throw new NotSupportedException();
        public Task<Promotion?> FindAsync(int id) => Task.FromResult(current?.Id == id ? current : null);
        public Task<Promotion?> FindByProductAsync(int productId) => Task.FromResult(current?.ProductId == productId ? current : null);
        public Task<bool> SaveAsync(Promotion promotion)
        {
            if (product.SalePrice != promotion.RegularPrice) return Task.FromResult(false);
            current = promotion;
            return Task.FromResult(true);
        }
        public Task<bool> DeleteAsync(int id)
        {
            if (current?.Id == id) current = null;
            return Task.FromResult(true);
        }
    }

    private sealed class InMemoryPurchaseStore(Purchase purchase, Product product) : IPurchaseStore
    {
        public IReadOnlyList<ProductReceipt>? CompletedReceipts { get; private set; }
        public Task<IReadOnlyList<PurchaseSummary>> ListAsync(bool? completed, DateOnly? from, DateOnly? to, string? search) => throw new NotSupportedException();
        public Task<Purchase?> FindAsync(int id) => Task.FromResult<Purchase?>(id == purchase.Id ? purchase : null);
        public Task<bool> SaveDraftAsync(Purchase p) => throw new NotSupportedException();
        public Task<bool> AddItemAsync(int purchaseId, PurchaseItem item, decimal lineTotal) => throw new NotSupportedException();
        public Task<bool> RemoveItemAsync(int purchaseId, int itemId, decimal lineTotal) => throw new NotSupportedException();
        public Task<bool> DeleteDraftAsync(int id) => throw new NotSupportedException();
        public Task<bool> CompleteAsync(int id, DateOnly dueDate, DateOnly receivedDate, IReadOnlyList<ProductReceipt> receipts)
        {
            CompletedReceipts = receipts;
            purchase.IsCompleted = true;
            product.SalePrice = receipts.Single().SalePrice;
            return Task.FromResult(true);
        }
    }
}
