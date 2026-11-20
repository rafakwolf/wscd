using Wscd.Domain.Catalogs;
using Wscd.Domain.Inventory;

namespace Wscd.Services.Catalogs;

internal static class ItemPricing
{
    private const decimal MaxLineTotal = 9_999_999_999.99m;

    internal static bool IsValid(int quantity, decimal discountPercent) =>
        quantity > 0 && discountPercent is >= 0 and <= 100;

    internal static (decimal Price, decimal Discount, decimal Total)? Calculate(
        Product product, Promotion? promotion, DateOnly date, int quantity, decimal discountPercent)
    {
        var price = promotion is not null && date >= promotion.StartDate && date <= promotion.EndDate
            ? promotion.PromotionPrice
            : product.SalePrice;
        var discount = decimal.Round(discountPercent, 2, MidpointRounding.AwayFromZero);
        var total = decimal.Round(quantity * price * (100 - discount) / 100, 2, MidpointRounding.AwayFromZero);
        return price < 0 || total > MaxLineTotal ? null : (price, discount, total);
    }
}
