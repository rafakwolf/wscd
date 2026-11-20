using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Services.Inventory;

namespace Wscd.Web.Pages.Inventory.Losses;

public sealed class IndexModel(IStockLossService losses) : PageModel
{
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }

    public IReadOnlyList<StockLossSummary> Items { get; private set; } = [];
    public string? StatusMessage { get; private set; }
    public Dictionary<string, string?> ListFilters => new()
    {
        ["From"] = From?.ToString("yyyy-MM-dd"),
        ["To"] = To?.ToString("yyyy-MM-dd")
    };

    public async Task<IActionResult> OnGetAsync(bool create = false)
    {
        if (create)
        {
            return RedirectToPage("./Create", ListFilters);
        }

        Items = await losses.ListAsync(From, To);
        StatusMessage = TempData["StatusMessage"] as string;
        return Page();
    }

    public static string ReasonLabel(string reason) => reason switch
    {
        "D" => "Danificado",
        "V" => "Vencido",
        "F" => "Furto",
        "P" => "Perda de peso",
        "O" => "Outro",
        _ => reason
    };
}
