using Microsoft.AspNetCore.Mvc;
using Wscd.Services.Purchases;

namespace Wscd.Web.Pages.Purchases;

public sealed class IndexModel(IPurchaseService purchases) : DocumentFiltersModel
{
    public IReadOnlyList<PurchaseSummary> Items { get; private set; } = [];
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

        Items = await purchases.ListAsync(Completed, From, To, Search);
        return Page();
    }

    public async Task<IActionResult> OnPostDeleteAsync(int id)
    {
        var result = await purchases.DeleteDraftAsync(id);
        TempData[result.Succeeded ? "StatusMessage" : "ErrorMessage"] = result.Succeeded
            ? "Rascunho de compra excluído."
            : "Não foi possível excluir esta compra.";
        return RedirectToPage("./Index", ListFilters);
    }
}
