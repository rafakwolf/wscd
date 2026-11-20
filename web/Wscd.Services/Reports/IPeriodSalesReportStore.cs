namespace Wscd.Services.Reports;

public interface IPeriodSalesReportStore
{
    Task<IReadOnlyList<PeriodSaleRow>> ListAsync(DateOnly from, DateOnly to, string? customer, int? sellerId);
}

public sealed record PeriodSaleRow(int SaleId, DateOnly Date, string CustomerName, string SellerName,
    decimal ItemDiscounts, decimal OriginalTotal, decimal ReturnedAmount)
{
    public decimal NetTotal => OriginalTotal - ReturnedAmount;
}
