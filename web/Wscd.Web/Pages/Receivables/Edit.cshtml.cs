using System.Globalization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Routing;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Receivables;

public sealed class EditModel(ReceivableService titles, ICatalogService<Customer> parties) : ReceivableFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int Id { get; set; }
    [BindProperty] public ManualTitleInput Input { get; set; } = new();
    [BindProperty] public Guid Revision { get; set; }
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        var account = await titles.FindAsync(Id);
        if (account is null || account.SaleId is not null || account.Payments.Count > 0)
        {
            return NotFound();
        }

        Revision = account.Revision;
        Input = new ManualTitleInput
        {
            PartyId = account.CustomerId,
            Description = account.Description,
            Document = account.Document,
            IssueDate = account.IssueDate,
            DueDate = account.DueDate,
            Amount = account.Amount
        };
        await LoadPartiesAsync();
        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (ModelState.IsValid && await titles.UpdateManualAsync(Id, Input, Revision))
        {
            TempData["StatusMessage"] = "Conta a receber atualizada.";
            return RedirectToPage("./Details", new RouteValueDictionary(ListFilters) { ["id"] = Id });
        }

        Error = "Não foi possível atualizar. Confira os dados ou se o título já recebeu baixas.";
        await LoadPartiesAsync();
        return Page();
    }

    private async Task LoadPartiesAsync() => ViewData["Parties"] = (await parties.ListAsync(null))
        .Select(party => new SelectListItem(party.Name, party.Id.ToString(CultureInfo.InvariantCulture))).ToArray();
}
