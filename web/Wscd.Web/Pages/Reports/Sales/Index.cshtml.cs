using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.Sales;

public sealed class IndexModel(PeriodSalesReportService sales, ICatalogService<Seller> sellers) : PageModel
{
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }
    [BindProperty(SupportsGet = true)] public string? Customer { get; set; }
    [BindProperty(SupportsGet = true)] public int? SellerId { get; set; }

    public IReadOnlyList<Seller> Sellers { get; private set; } = [];
    public string? SellerName { get; private set; }
    public PeriodSalesReport? Report { get; private set; }
    public string? Error { get; private set; }

    public async Task OnGetAsync()
    {
        Sellers = await sellers.ListAsync(null);
        var today = CashReportService.Today;
        if (!Request.Query.ContainsKey(nameof(From)))
        {
            From = new DateOnly(today.Year, today.Month, 1);
        }
        if (!Request.Query.ContainsKey(nameof(To)))
        {
            To = today;
        }

        if (!ModelState.IsValid || From is not DateOnly from || To is not DateOnly to || from > to)
        {
            Error = "Informe um período válido, com a data inicial até a data final.";
            return;
        }
        if (SellerId is int sellerId)
        {
            SellerName = Sellers.SingleOrDefault(seller => seller.Id == sellerId)?.Name;
            if (SellerName is null)
            {
                Error = "Selecione um vendedor da organização.";
                return;
            }
        }

        Customer = Customer?.Trim();
        Report = await sales.GetAsync(from, to, Customer, SellerId);
    }
}
