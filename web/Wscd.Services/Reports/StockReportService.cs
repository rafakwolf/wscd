using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Services.Reports;

public sealed class StockReportService(
    IStockReportStore store,
    ICatalogService<Supplier> suppliers) : IStockReportService
{
    public async Task<MinimumStockReport?> GetMinimumStockBySupplierAsync(int supplierId)
    {
        var supplier = await suppliers.FindAsync(supplierId);
        if (supplier is null)
        {
            return null;
        }

        return new MinimumStockReport(
            supplier.Name,
            await store.ListBelowMinimumBySupplierAsync(supplierId));
    }
}
