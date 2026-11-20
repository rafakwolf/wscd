using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Services.Reports;

public sealed class SellerCommissionService(ISellerCommissionStore store, ICatalogService<Seller> sellers)
{
    public async Task<SellerCommissionReport?> GetAsync(int sellerId, DateOnly from, DateOnly to)
    {
        if (sellerId <= 0 || from > to || await sellers.FindAsync(sellerId) is not { } seller)
        {
            return null;
        }

        var lines = await store.ListAsync(sellerId, from, to);
        var rows = lines.Where(line => line.Quantity > line.ReturnedQuantity)
            .GroupBy(line => (line.ProductId, line.ProductName))
            .Select(group => new SellerCommissionRow(group.Key.ProductName,
                group.Sum(line => (long)line.Quantity - line.ReturnedQuantity),
                group.Sum(line => line.Total - line.ReturnedAmount),
                group.Sum(line => decimal.Round((line.Total - line.ReturnedAmount) * line.CommissionPercent / 100,
                    2, MidpointRounding.AwayFromZero))))
            .OrderBy(row => row.ProductName)
            .ToArray();

        return new SellerCommissionReport(seller.Name, from, to, rows);
    }
}

public sealed record SellerCommissionRow(string ProductName, long Quantity, decimal NetSales, decimal Commission);

public sealed record SellerCommissionReport(string SellerName, DateOnly From, DateOnly To, IReadOnlyList<SellerCommissionRow> Rows)
{
    public decimal NetSales => Rows.Sum(row => row.NetSales);
    public decimal Commission => Rows.Sum(row => row.Commission);
}
