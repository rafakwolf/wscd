namespace Wscd.Services.Reports;

public sealed class StockReportService(IStockReportStore store) : IStockReportService
{
    public async Task<StockPositionReport?> GetPositionAsync(string? search, int? groupId, int? supplierId, StockPositionFilter status)
    {
        if (groupId is <= 0 || supplierId is <= 0 || !Enum.IsDefined(status))
        {
            return null;
        }

        return new StockPositionReport(await store.ListPositionAsync(
            string.IsNullOrWhiteSpace(search) ? null : search.Trim(), groupId, supplierId, status));
    }

    public async Task<IReadOnlyList<ProductGroupReportRow>?> GetProductsByGroupAsync(int groupId) =>
        groupId > 0 ? await store.ListProductsByGroupAsync(groupId) : null;

    public async Task<ProductExpirationReport?> GetExpirationsAsync(DateOnly through, int? unitId, int? groupId, int? supplierId)
    {
        if (unitId is <= 0 || groupId is <= 0 || supplierId is <= 0)
        {
            return null;
        }

        return new ProductExpirationReport(await store.ListExpirationsAsync(through, unitId, groupId, supplierId));
    }
}
