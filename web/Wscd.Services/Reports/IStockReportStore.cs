namespace Wscd.Services.Reports;

public interface IStockReportStore
{
    Task<IReadOnlyList<StockPositionProduct>> ListPositionAsync(string? search, int? groupId, int? supplierId, StockPositionFilter status);
}

public enum StockPositionFilter { All, AtOrBelowMinimum, OutOfStock }

public sealed record StockPositionProduct(
    int Id,
    string Name,
    string? Barcode,
    string? GroupName,
    string? SupplierName,
    string? UnitName,
    int Stock,
    int MinimumStock)
{
    public bool AtOrBelowMinimum => Stock <= MinimumStock;
    public bool OutOfStock => Stock <= 0;
}
