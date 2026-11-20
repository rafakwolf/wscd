namespace Wscd.Services.Reports;

public interface IStockReportService
{
    Task<StockPositionReport?> GetPositionAsync(string? search, int? groupId, int? supplierId, StockPositionFilter status);
    Task<IReadOnlyList<ProductGroupReportRow>?> GetProductsByGroupAsync(int groupId);
    Task<ProductExpirationReport?> GetExpirationsAsync(DateOnly through, int? unitId, int? groupId, int? supplierId);
}

public sealed record ProductExpirationReport(IReadOnlyList<ProductExpirationRow> Products)
{
    public decimal TotalUnitCost => Products.Sum(product => product.UnitCost);
}

public sealed record StockPositionReport(IReadOnlyList<StockPositionProduct> Products)
{
    public int AtOrBelowMinimumCount => Products.Count(product => product.AtOrBelowMinimum);
    public int OutOfStockCount => Products.Count(product => product.OutOfStock);
}
