namespace Wscd.Services.Reports;

public interface ISellerCommissionStore
{
    Task<IReadOnlyList<SellerCommissionLine>> ListAsync(int sellerId, DateOnly from, DateOnly to);
}

public sealed record SellerCommissionLine(int ProductId, string ProductName, int Quantity, decimal Total,
    decimal CommissionPercent, int ReturnedQuantity, decimal ReturnedAmount);
