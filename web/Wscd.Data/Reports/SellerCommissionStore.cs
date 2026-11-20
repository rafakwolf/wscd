using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Sales;
using Wscd.Services.Reports;

namespace Wscd.Data.Reports;

public sealed class SellerCommissionStore(WscdDbContext db) : ISellerCommissionStore
{
    public async Task<IReadOnlyList<SellerCommissionLine>> ListAsync(int sellerId, DateOnly from, DateOnly to)
    {
        // shortcut: load the selected seller's lines, aggregate in the query if periods become large.
        var sales = db.Sales.AsNoTracking().Where(sale => sale.SellerId == sellerId &&
            sale.Date >= from && sale.Date <= to && sale.CompletedAtUtc != null && sale.CancelledAtUtc == null);

        return await (from item in sales.SelectMany(sale => sale.Items)
                      join product in db.Products.AsNoTracking()
                          on new { item.OrganizationId, Id = item.ProductId } equals new { product.OrganizationId, product.Id }
                      select new SellerCommissionLine(item.ProductId, product.Name, item.Quantity, item.Total,
                          item.CommissionPercent,
                          db.Set<SaleReturnItem>().Where(line => line.SaleItemId == item.Id).Sum(line => line.Quantity),
                          db.Set<SaleReturnItem>().Where(line => line.SaleItemId == item.Id).Sum(line => line.Amount)))
            .ToListAsync();
    }
}
