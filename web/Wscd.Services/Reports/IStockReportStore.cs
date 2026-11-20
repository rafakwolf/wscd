namespace Wscd.Services.Reports;

public interface IStockReportStore
{
    Task<IReadOnlyList<StockPositionProduct>> ListPositionAsync(string? search, int? groupId, int? supplierId, StockPositionFilter status);
    Task<IReadOnlyList<ProductGroupReportRow>> ListProductsByGroupAsync(int groupId);
    Task<IReadOnlyList<ProductExpirationRow>> ListExpirationsAsync(DateOnly through, int? unitId, int? groupId, int? supplierId);
}

public enum StockPositionFilter { All, AtOrBelowMinimum, OutOfStock }

public sealed record ProductExpirationRow(
    string Name,
    string? Barcode,
    string? SupplierName,
    DateOnly ExpirationDate,
    decimal UnitCost);

public sealed record ProductGroupReportRow(
    string Name,
    string? Barcode,
    string? SupplierName,
    decimal Cost,
    decimal MarginPercent,
    decimal SalePrice,
    int Stock);

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
