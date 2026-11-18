using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Services.Inventory;

namespace Wscd.Web.Pages.Promotions;

public sealed class IndexModel(IPromotionService promotions) : PageModel
{
    [BindProperty(SupportsGet = true)] public string? Search { get; set; }

    public IReadOnlyList<PromotionSummary> Items { get; private set; } = [];
    public string? StatusMessage { get; private set; }

    public async Task<IActionResult> OnGetAsync(int? id, bool create = false)
    {
        if (id is not null || create)
        {
            return RedirectToPage("./Edit", new { id, Search });
        }

        var items = await promotions.ListAsync();
        Items = string.IsNullOrWhiteSpace(Search)
            ? items
            : items.Where(item => item.ProductName.Contains(Search.Trim(), StringComparison.CurrentCultureIgnoreCase)).ToArray();
        StatusMessage = TempData["StatusMessage"] as string;
        ViewData["ErrorMessage"] = TempData["ErrorMessage"] as string;
        return Page();
    }

    public async Task<IActionResult> OnPostDeleteAsync(int promotionId)
    {
        var result = await promotions.DeleteAsync(promotionId);
        TempData[result.Succeeded ? "StatusMessage" : "ErrorMessage"] = result.Succeeded
            ? "Promoção removida e preço promocional limpo no produto."
            : "A promoção não está disponível nesta organização.";
        return RedirectToPage(new { Search });
    }

    public static string StatusLabel(DateOnly startDate, DateOnly endDate)
    {
        // shortcut: expired promotions stay until manually removed; add scheduled cleanup if automatic expiry is needed.
        var today = DateOnly.FromDateTime(DateTime.Today);
        return endDate < today ? "Expirada" : startDate > today ? "Agendada" : "Em vigor";
    }
}
