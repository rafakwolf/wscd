using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Inventory;
using Wscd.Services;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;

namespace Wscd.Web.Pages.Promotions;

public sealed class EditModel(
    IPromotionService promotions,
    ICatalogService<Product> products) : PageModel
{
    [BindProperty(SupportsGet = true), FromRoute]
    public int? Id { get; set; }

    [BindProperty(SupportsGet = true)]
    public string? Search { get; set; }

    public Dictionary<string, string?> ListFilters => new() { ["Search"] = Search };

    [BindProperty]
    public PromotionInput Input { get; set; } = new();

    public IReadOnlyList<Product> Products { get; private set; } = [];
    public Promotion? Current { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        await LoadAsync();
        if (Id is not null && Current is null)
        {
            return NotFound();
        }

        if (Current is not null)
        {
            Input = new PromotionInput
            {
                ProductId = Current.ProductId,
                DiscountPercent = Current.DiscountPercent,
                StartDate = Current.StartDate,
                EndDate = Current.EndDate
            };
        }
        else
        {
            Input.StartDate = BrasiliaClock.Today;
            Input.EndDate = Input.StartDate;
        }

        return Page();
    }

    public async Task<IActionResult> OnPostSaveAsync()
    {
        if (ModelState.IsValid)
        {
            var result = await promotions.SaveAsync(
                Id ?? 0,
                Input.ProductId,
                Input.DiscountPercent,
                Input.StartDate,
                Input.EndDate);
            if (result.Succeeded)
            {
                TempData["StatusMessage"] = "Promoção salva e preço promocional atualizado no produto.";
                return RedirectToPage("./Index", new { Search });
            }

            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
        }

        await LoadAsync();
        return Id is not null && Current is null ? NotFound() : Page();
    }

    private async Task LoadAsync()
    {
        Current = Id is int id ? await promotions.FindAsync(id) : null;
        Products = Current is { } promotion ? [promotion.Product] : await products.ListAsync(null);
    }

    private static string Message(string? errorCode) => errorCode switch
    {
        "InvalidPromotion" => "Informe desconto e período válidos.",
        "InvalidDiscount" => "O desconto informado não gera um preço promocional válido para este produto.",
        "InvalidRegularPrice" => "O produto precisa ter preço de venda maior que zero.",
        "ProductNotFound" => "O produto selecionado não está disponível nesta organização.",
        "PromotionNotFound" => "A promoção não está disponível nesta organização.",
        _ => "O produto já tem uma promoção ou seu preço de venda mudou. Atualize a página e confira os dados."
    };

    public sealed class PromotionInput
    {
        [Range(1, int.MaxValue)]
        public int ProductId { get; set; }

        [Range(typeof(decimal), "0.01", "99.99")]
        public decimal DiscountPercent { get; set; }

        public DateOnly StartDate { get; set; }
        public DateOnly EndDate { get; set; }
    }
}
