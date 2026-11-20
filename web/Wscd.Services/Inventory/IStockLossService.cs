namespace Wscd.Services.Inventory;

public interface IStockLossService
{
    Task<IReadOnlyList<StockLossSummary>> ListAsync(DateOnly? from, DateOnly? to);
    Task<StockLossResult> CreateAsync(int productId, int quantity, DateOnly lossDate, string? reason, string? notes);
}

public sealed record StockLossResult(bool Succeeded, string? ErrorCode = null);
