namespace Wscd.Services.Reports;

public sealed class PeriodSalesReportService(IPeriodSalesReportStore store)
{
    public async Task<PeriodSalesReport?> GetAsync(DateOnly from, DateOnly to, string? customer, int? sellerId)
    {
        if (from > to || sellerId is <= 0)
        {
            return null;
        }

        return new PeriodSalesReport(await store.ListAsync(from, to,
            string.IsNullOrWhiteSpace(customer) ? null : customer.Trim(), sellerId));
    }
}

public sealed record PeriodSalesReport(IReadOnlyList<PeriodSaleRow> Rows)
{
    public decimal ItemDiscounts => Rows.Sum(row => row.ItemDiscounts);
    public decimal OriginalTotal => Rows.Sum(row => row.OriginalTotal);
    public decimal ReturnedAmount => Rows.Sum(row => row.ReturnedAmount);
    public decimal NetTotal => OriginalTotal - ReturnedAmount;
}
