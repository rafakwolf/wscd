using Microsoft.EntityFrameworkCore;
using Wscd.Services.Reports;

namespace Wscd.Data.Reports;

public sealed class PeriodSalesReportStore(WscdDbContext db) : IPeriodSalesReportStore
{
    public async Task<IReadOnlyList<PeriodSaleRow>> ListAsync(DateOnly from, DateOnly to, string? customer, int? sellerId)
    {
        var sales = db.Sales.AsNoTracking().Where(sale =>
            sale.Date >= from && sale.Date <= to && sale.CompletedAtUtc != null && sale.CancelledAtUtc == null);
        if (customer is not null)
        {
            var search = customer.ToLowerInvariant();
            sales = sales.Where(sale => sale.Customer.Name.ToLower().Contains(search));
        }
        if (sellerId is int selectedSeller)
        {
            sales = sales.Where(sale => sale.SellerId == selectedSeller);
        }

        // shortcut: one printable list for the selected period; paginate if volumes outgrow this report.
        return await sales.OrderBy(sale => sale.Date).ThenBy(sale => sale.Id)
            .Select(sale => new PeriodSaleRow(sale.Id, sale.Date, sale.Customer.Name, sale.Seller.Name,
                sale.Items.Sum(item => item.Quantity * item.UnitPrice - item.Total),
                sale.Items.Sum(item => item.Total),
                sale.Returns.Sum(saleReturn => saleReturn.ReceivableReduction + saleReturn.RefundAmount)))
            .ToListAsync();
    }
}
