using Wscd.Domain.Inventory;

namespace Wscd.Services.Inventory;

public interface IPromotionStore
{
    Task<IReadOnlyList<PromotionSummary>> ListAsync();
    Task<Promotion?> FindAsync(int id);
    Task<bool> SaveAsync(Promotion promotion);
    Task<bool> DeleteAsync(int id);
}

public sealed record PromotionSummary(
    int Id,
    string ProductName,
    decimal RegularPrice,
    decimal DiscountPercent,
    decimal PromotionPrice,
    DateOnly StartDate,
    DateOnly EndDate);
