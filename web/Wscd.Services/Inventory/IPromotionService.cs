using Wscd.Domain.Inventory;

namespace Wscd.Services.Inventory;

public interface IPromotionService
{
    Task<IReadOnlyList<PromotionSummary>> ListAsync();
    Task<Promotion?> FindAsync(int id);
    Task<PromotionResult> SaveAsync(int id, int productId, decimal discountPercent, DateOnly startDate, DateOnly endDate);
    Task<PromotionResult> DeleteAsync(int id);
}

public sealed record PromotionResult(bool Succeeded, string? ErrorCode = null);
