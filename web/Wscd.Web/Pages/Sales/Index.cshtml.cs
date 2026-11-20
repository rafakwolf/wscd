using Microsoft.AspNetCore.Mvc;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Sales;

public sealed class IndexModel(SaleService sales) : SaleFiltersModel
{
    public IReadOnlyList<SaleSummary> Sales { get; private set; } = [];
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync(int? id, bool create = false)
    {
        if (!ModelState.IsValid || From > To || (Status.HasValue && !Enum.IsDefined(Status.Value)))
        {
            Error = "Confira o número, as datas e a situação informados.";
            return Page();
        }
        if (id is not null || create)
        {
            return RedirectToPage("./Edit", MaintenanceRoute(id));
        }

        Sales = await sales.ListAsync(Search, From, To, Status ?? (Completed switch
        {
            true => SaleStatus.Completed,
            false => SaleStatus.Draft,
            _ => null
        }));
        return Page();
    }

    public async Task<IActionResult> OnPostDeleteAsync(int id)
    {
        var deleted = await sales.DeleteDraftAsync(id);
        TempData[deleted ? "StatusMessage" : "ErrorMessage"] = deleted
            ? "Rascunho de venda excluído."
            : "Não foi possível excluir esta venda.";
        return RedirectToPage("./Index", ListFilters);
    }
}
