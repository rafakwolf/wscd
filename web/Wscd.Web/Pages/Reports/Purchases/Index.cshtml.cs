using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Services.Purchases;

namespace Wscd.Web.Pages.Reports.Purchases;

public sealed class IndexModel(IPurchaseService purchases) : PageModel
{
    [BindProperty(SupportsGet = true)]
    public DateOnly? From { get; set; }

    [BindProperty(SupportsGet = true)]
    public DateOnly? To { get; set; }

    [BindProperty(SupportsGet = true)]
    public string? Supplier { get; set; }

    public IReadOnlyList<PurchaseSummary> Items { get; private set; } = [];
    public decimal Total { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        if (From is DateOnly from && To is DateOnly to && from > to)
        {
            ModelState.AddModelError(string.Empty, "A data inicial deve ser anterior ou igual à data final.");
            return Page();
        }

        Items = await purchases.ListAsync(true, From, To, Supplier);
        Total = Items.Sum(purchase => purchase.Total);
        return Page();
    }
}
