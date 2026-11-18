using Microsoft.AspNetCore.Mvc;
using Wscd.Services.Quotations;

namespace Wscd.Web.Pages.Quotations;

public sealed class IndexModel(QuotationService quotations) : DocumentFiltersModel
{
    public IReadOnlyList<QuotationSummary> Quotations { get; private set; } = [];
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

        Quotations = await quotations.ListAsync(Search, From, To, Completed);
        return Page();
    }
}
