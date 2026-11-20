using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.SellerCommissions;

public sealed class IndexModel(SellerCommissionService commissions, ICatalogService<Seller> sellers) : PageModel
{
    [BindProperty(SupportsGet = true)] public int? SellerId { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }

    public IReadOnlyList<Seller> Sellers { get; private set; } = [];
    public SellerCommissionReport? Report { get; private set; }
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

        if (!ModelState.IsValid || !From.HasValue || !To.HasValue || From > To)
        {
            Error = "Informe um vendedor e um período válido, com a data inicial até a data final.";
        }
        else if (SellerId is int sellerId)
        {
            Report = await commissions.GetAsync(sellerId, From.Value, To.Value);
            if (Report is null)
            {
                Error = "Selecione um vendedor da organização.";
            }
        }
        else if (Request.Query.ContainsKey(nameof(SellerId)))
        {
            Error = "Selecione um vendedor.";
        }
    }
}
