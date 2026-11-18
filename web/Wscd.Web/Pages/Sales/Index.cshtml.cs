using Microsoft.AspNetCore.Mvc;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Sales;

public sealed class IndexModel(SaleService sales) : DocumentFiltersModel
{
    public IReadOnlyList<SaleSummary> Sales { get; private set; } = [];
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync(int? id, bool create = false)
    {
        if (!ModelState.IsValid || From > To)
        {
            Error = "Confira o número, as datas e a situação informados.";
            return Page();
        }
        if (id is not null || create)
        {
            return RedirectToPage("./Edit", MaintenanceRoute(id));
        }

        Sales = await sales.ListAsync(Search, From, To, Completed);
        return Page();
    }
}
