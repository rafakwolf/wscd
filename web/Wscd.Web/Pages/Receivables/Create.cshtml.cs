using System.Globalization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Routing;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Receivables;

public sealed class CreateModel(ReceivableService titles, ICatalogService<Customer> parties) : ReceivableFiltersModel
{
    [BindProperty] public ManualTitleInput Input { get; set; } = new();
    public string? Error { get; private set; }

    public async Task OnGetAsync()
    {
        Input.IssueDate = Today;
        Input.DueDate = Today;
        await LoadPartiesAsync();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (ModelState.IsValid && await titles.CreateAsync(Input) is int id)
        {
            TempData["StatusMessage"] = "Conta a receber criada.";
            return RedirectToPage("./Details", new RouteValueDictionary(ListFilters) { ["id"] = id });
        }

        Error = "Informe um cliente da organização, descrição e valor positivo com até duas casas decimais. O vencimento deve ser igual ou posterior à emissão.";
        await LoadPartiesAsync();
        return Page();
    }

    private async Task LoadPartiesAsync() => ViewData["Parties"] = (await parties.ListAsync(null))
        .Select(party => new SelectListItem(party.Name, party.Id.ToString(CultureInfo.InvariantCulture))).ToArray();
}
