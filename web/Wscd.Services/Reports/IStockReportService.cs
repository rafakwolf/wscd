namespace Wscd.Services.Reports;

public interface IStockReportService
{
    Task<MinimumStockReport?> GetMinimumStockBySupplierAsync(int supplierId);
}

public sealed record MinimumStockReport(
    string SupplierName,
    IReadOnlyList<MinimumStockProduct> Products);
