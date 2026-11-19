using Wscd.Domain.Catalogs;
using Wscd.Domain.Inventory;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;

namespace Wscd.Services.Inventory;

public sealed class PromotionService(
    IPromotionStore store,
    ICatalogService<Product> products,
    ICurrentOrganization currentOrganization) : IPromotionService
{
    public Task<IReadOnlyList<PromotionSummary>> ListAsync() => store.ListAsync();

    public Task<Promotion?> FindAsync(int id) => store.FindAsync(id);

    public async Task<PromotionResult> SaveAsync(
        int id,
        int productId,
        decimal discountPercent,
        DateOnly startDate,
        DateOnly endDate)
    {
        if (currentOrganization.OrganizationId is null || productId <= 0 ||
            discountPercent <= 0 || discountPercent >= 100 ||
            startDate == default || endDate < startDate)
        {
            return new PromotionResult(false, "InvalidPromotion");
        }

        if (id > 0)
        {
            var existing = await store.FindAsync(id);
            if (existing is null || existing.ProductId != productId)
            {
                return new PromotionResult(false, "PromotionNotFound");
            }
        }

        var product = await products.FindAsync(productId);
        if (product is null)
        {
            return new PromotionResult(false, "ProductNotFound");
        }
        if (product.SalePrice <= 0)
        {
            return new PromotionResult(false, "InvalidRegularPrice");
        }

        discountPercent = decimal.Round(discountPercent, 2, MidpointRounding.AwayFromZero);
        var promotionPrice = decimal.Round(
            product.SalePrice * (100 - discountPercent) / 100,
            2,
            MidpointRounding.AwayFromZero);
        if (promotionPrice <= 0 || promotionPrice >= product.SalePrice)
        {
            return new PromotionResult(false, "InvalidDiscount");
        }

        var promotion = new Promotion
        {
            Id = id,
            ProductId = productId,
            RegularPrice = product.SalePrice,
            DiscountPercent = discountPercent,
            PromotionPrice = promotionPrice,
            StartDate = startDate,
            EndDate = endDate
        };

        return await store.SaveAsync(promotion)
            ? new PromotionResult(true)
            : new PromotionResult(false, "PromotionConflict");
    }

    public async Task<PromotionResult> DeleteAsync(int id) =>
        await store.DeleteAsync(id)
            ? new PromotionResult(true)
            : new PromotionResult(false, "PromotionNotFound");

    /// <summary>
    /// Recalcula ou remove a promoção de um produto quando o preço regular é alterado.
    /// </summary>
    public static async Task SyncRegularPriceAsync(IPromotionStore? store, int productId, decimal newSalePrice)
    {
        if (store is null || await store.FindByProductAsync(productId) is not { } promotion)
        {
            return;
        }

        if (newSalePrice <= 0)
        {
            await store.DeleteAsync(promotion.Id);
            return;
        }

        var recalculated = decimal.Round(
            newSalePrice * (100 - promotion.DiscountPercent) / 100,
            2,
            MidpointRounding.AwayFromZero);
        if (recalculated <= 0 || recalculated >= newSalePrice)
        {
            await store.DeleteAsync(promotion.Id);
            return;
        }

        promotion.RegularPrice = newSalePrice;
        promotion.PromotionPrice = recalculated;
        await store.SaveAsync(promotion);
    }
}
