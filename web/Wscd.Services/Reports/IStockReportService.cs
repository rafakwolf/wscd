namespace Wscd.Services.Reports;

public interface IStockReportService
{
    Task<StockPositionReport?> GetPositionAsync(string? search, int? groupId, int? supplierId, StockPositionFilter status);
}

public sealed record StockPositionReport(IReadOnlyList<StockPositionProduct> Products)
{
    public int AtOrBelowMinimumCount => Products.Count(product => product.AtOrBelowMinimum);
    public int OutOfStockCount => Products.Count(product => product.OutOfStock);
}
