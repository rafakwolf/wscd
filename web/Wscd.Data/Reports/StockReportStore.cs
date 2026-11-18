using Microsoft.EntityFrameworkCore;
using Wscd.Services.Reports;

namespace Wscd.Data.Reports;

public sealed class StockReportStore(WscdDbContext db) : IStockReportStore
{
    public async Task<IReadOnlyList<StockPositionProduct>> ListPositionAsync(string? search, int? groupId, int? supplierId,
        StockPositionFilter status)
    {
        var products = db.Products.AsNoTracking();
        if (search is not null)
        {
            var term = search.ToLowerInvariant();
            products = products.Where(product => product.Name.ToLower().Contains(term) ||
                (product.Barcode != null && product.Barcode.Contains(term)));
        }
        if (groupId is int group)
        {
            products = products.Where(product => product.ProductGroupId == group);
        }
        if (supplierId is int supplier)
        {
            products = products.Where(product => product.SupplierId == supplier);
        }
        products = status switch
        {
            StockPositionFilter.AtOrBelowMinimum => products.Where(product => product.Stock <= product.MinimumStock),
            StockPositionFilter.OutOfStock => products.Where(product => product.Stock <= 0),
            _ => products
        };

        // shortcut: one printable list; paginate if catalogs outgrow the filters.
        return await products.OrderBy(product => product.Name).ThenBy(product => product.Id)
            .Select(product => new StockPositionProduct(product.Id, product.Name, product.Barcode,
                db.ProductGroups.Where(group => group.Id == product.ProductGroupId).Select(group => group.Name).FirstOrDefault(),
                db.Suppliers.Where(supplier => supplier.Id == product.SupplierId).Select(supplier => supplier.Name).FirstOrDefault(),
                db.Units.Where(unit => unit.Id == product.UnitId).Select(unit => unit.Name).FirstOrDefault(),
                product.Stock, product.MinimumStock))
            .ToListAsync();
    }
}
