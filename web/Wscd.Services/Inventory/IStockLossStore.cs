using Wscd.Domain.Inventory;

namespace Wscd.Services.Inventory;

public interface IStockLossStore
{
    Task<IReadOnlyList<StockLossSummary>> ListAsync(DateOnly? from, DateOnly? to);
    Task<bool> CreateAsync(StockLoss loss);
}

public sealed record StockLossSummary(
    int Id,
    DateOnly LossDate,
    string ProductName,
    int Quantity,
    decimal UnitCost,
    string Reason,
    string? Notes);
