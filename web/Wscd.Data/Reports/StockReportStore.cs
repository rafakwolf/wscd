using Microsoft.EntityFrameworkCore;
using Wscd.Services.Reports;

namespace Wscd.Data.Reports;

public sealed class StockReportStore(WscdDbContext db) : IStockReportStore
{
    public async Task<IReadOnlyList<MinimumStockProduct>> ListBelowMinimumBySupplierAsync(int supplierId) =>
        await db.Products.AsNoTracking()
            .Where(product => product.SupplierId == supplierId && product.Stock <= product.MinimumStock)
            .OrderBy(product => product.Name)
            .Select(product => new MinimumStockProduct(
                product.Name,
                product.Barcode,
                product.Stock,
                product.MinimumStock))
            .ToListAsync();
}
