namespace Wscd.Services.Reports;

public interface IStockReportService
{
    Task<StockPositionReport?> GetPositionAsync(string? search, int? groupId, int? supplierId, StockPositionFilter status);
    Task<IReadOnlyList<ProductGroupReportRow>?> GetProductsByGroupAsync(int groupId);
}

public sealed record StockPositionReport(IReadOnlyList<StockPositionProduct> Products)
{
    public int AtOrBelowMinimumCount => Products.Count(product => product.AtOrBelowMinimum);
    public int OutOfStockCount => Products.Count(product => product.OutOfStock);
}
