namespace Wscd.Services.Reports;

public interface IStockReportStore
{
    Task<IReadOnlyList<MinimumStockProduct>> ListBelowMinimumBySupplierAsync(int supplierId);
}

public sealed record MinimumStockProduct(
    string Name,
    string? Barcode,
    int Stock,
    int MinimumStock);
