using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;

namespace Wscd.Web.Pages.Inventory.Losses;

public sealed class CreateModel(
    IStockLossService losses,
    ICatalogService<Product> products) : PageModel
{
    [BindProperty(SupportsGet = true)]
    public DateOnly? From { get; set; }

    [BindProperty(SupportsGet = true)]
    public DateOnly? To { get; set; }

    [BindProperty]
    [Range(1, int.MaxValue)]
    public int ProductId { get; set; }

    [BindProperty]
    [Range(1, int.MaxValue)]
    public int Quantity { get; set; }

    [BindProperty]
    public DateOnly LossDate { get; set; }

    [BindProperty]
    [Required]
    public string Reason { get; set; } = string.Empty;

    [BindProperty]
    public string? Notes { get; set; }

    public IReadOnlyList<Product> Products { get; private set; } = [];

    public async Task<IActionResult> OnGetAsync()
    {
        await LoadAsync();
        LossDate = DateOnly.FromDateTime(DateTime.Today);

        return Page();
    }

    public async Task<IActionResult> OnPostCreateAsync()
    {
        if (ModelState.IsValid)
        {
            var result = await losses.CreateAsync(ProductId, Quantity, LossDate, Reason, Notes);
            if (result.Succeeded)
            {
                TempData["StatusMessage"] = "Perda registrada e estoque atualizado.";
                return RedirectToPage("./Index", ListFilters);
            }

            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
        }

        await LoadAsync();
        return Page();
    }

    public Dictionary<string, string?> ListFilters => new()
    {
        ["From"] = From?.ToString("yyyy-MM-dd"),
        ["To"] = To?.ToString("yyyy-MM-dd")
    };

    private async Task LoadAsync() => Products = await products.ListAsync(null);

    private static string Message(string? errorCode) => errorCode switch
    {
        "InvalidLoss" => "Informe um produto, quantidade, data e motivo válidos.",
        "ProductNotFound" => "O produto selecionado não está disponível nesta organização.",
        "InsufficientStock" => "A quantidade da perda não pode ser maior que o estoque disponível.",
        _ => "O estoque mudou enquanto a perda era registrada. Atualize a página e confira a quantidade disponível."
    };
}
