using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Inventory;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;

namespace Wscd.Web.Pages.Promotions;

public sealed class IndexModel(
    IPromotionService promotions,
    ICatalogService<Product> products) : PageModel
{
    [BindProperty(SupportsGet = true)]
    public int? Id { get; set; }

    [BindProperty(SupportsGet = true)]
    public bool Create { get; set; }

    [BindProperty]
    public PromotionInput Input { get; set; } = new();

    public IReadOnlyList<PromotionSummary> Items { get; private set; } = [];
    public IReadOnlyList<Product> Products { get; private set; } = [];
    public Promotion? Current { get; private set; }
    public string? StatusMessage { get; private set; }

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
        else if (Create)
        {
            Input.StartDate = DateOnly.FromDateTime(DateTime.Today);
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
                return RedirectToPage();
            }

            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
        }

        await LoadAsync();
        return Page();
    }

    public async Task<IActionResult> OnPostDeleteAsync(int promotionId)
    {
        var result = await promotions.DeleteAsync(promotionId);
        TempData[result.Succeeded ? "StatusMessage" : "ErrorMessage"] = result.Succeeded
            ? "Promoção removida e preço promocional limpo no produto."
            : Message(result.ErrorCode);
        return RedirectToPage();
    }

    public static string StatusLabel(DateOnly startDate, DateOnly endDate)
    {
        // shortcut: expired promotions stay until manually removed; add scheduled cleanup if automatic expiry is needed.
        var today = DateOnly.FromDateTime(DateTime.Today);
        return endDate < today ? "Expirada" : startDate > today ? "Agendada" : "Em vigor";
    }

    private async Task LoadAsync()
    {
        Items = await promotions.ListAsync();
        StatusMessage = TempData["StatusMessage"] as string;
        ViewData["ErrorMessage"] = TempData["ErrorMessage"] as string;
        if (Id is int id)
        {
            Current = await promotions.FindAsync(id);
        }
        if (Id is not null || Create)
        {
            Products = await products.ListAsync(null);
        }
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
