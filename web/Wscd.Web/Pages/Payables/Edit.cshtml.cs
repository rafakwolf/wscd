using System.Globalization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Routing;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Purchases;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Payables;

public sealed class EditModel(PayableService titles, ICatalogService<Supplier> parties) : PayableFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int Id { get; set; }
    [BindProperty] public ManualTitleInput Input { get; set; } = new();
    [BindProperty] public Guid Revision { get; set; }
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        var account = await titles.FindAsync(Id);
        if (account is null || account.PurchaseId is not null || account.Payments.Count > 0)
        {
            return NotFound();
        }

        Revision = account.Revision;
        Input = new ManualTitleInput
        {
            PartyId = account.SupplierId,
            Description = account.Description,
            Document = account.Document,
            IssueDate = account.CreatedDate,
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
            TempData["StatusMessage"] = "Conta a pagar atualizada.";
            return RedirectToPage("./Details", new RouteValueDictionary(ListFilters) { ["id"] = Id });
        }

        Error = "Não foi possível atualizar. Confira os dados ou se o título já recebeu baixas.";
        await LoadPartiesAsync();
        return Page();
    }

    private async Task LoadPartiesAsync() => ViewData["Parties"] = (await parties.ListAsync(null))
        .Select(party => new SelectListItem(party.Name, party.Id.ToString(CultureInfo.InvariantCulture))).ToArray();
}
