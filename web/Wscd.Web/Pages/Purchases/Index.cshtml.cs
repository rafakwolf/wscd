using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Purchases;
using Wscd.Services.Catalogs;
using Wscd.Services.Purchases;

namespace Wscd.Web.Pages.Purchases;

public sealed class IndexModel(
    IPurchaseService purchases,
    ICatalogService<Supplier> suppliers,
    ICatalogService<Product> products) : PageModel
{
    [BindProperty(SupportsGet = true)]
    public int? Id { get; set; }

    [BindProperty(SupportsGet = true)]
    public bool Create { get; set; }

    [BindProperty(SupportsGet = true)]
    public bool? Completed { get; set; }

    [BindProperty(SupportsGet = true)]
    public DateOnly? From { get; set; }

    [BindProperty(SupportsGet = true)]
    public DateOnly? To { get; set; }

    [BindProperty(SupportsGet = true)]
    public string? Search { get; set; }

    [BindProperty]
    public PurchaseHeaderInput Header { get; set; } = new();

    [BindProperty]
    public PurchaseLineInput Line { get; set; } = new();

    public IReadOnlyList<PurchaseSummary> Items { get; private set; } = [];
    public IReadOnlyList<Supplier> Suppliers { get; private set; } = [];
    public IReadOnlyList<Product> Products { get; private set; } = [];
    public Purchase? Current { get; private set; }
    public string? StatusMessage { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        await LoadAsync();
        if ((Id is not null || Create) && Current is null && Id is not null)
        {
            return NotFound();
        }
        if (Create)
        {
            Header.PurchaseDate = DateOnly.FromDateTime(DateTime.Today);
        }

        return Page();
    }

    public async Task<IActionResult> OnPostSaveAsync()
    {
        if (!ModelState.IsValid)
        {
            await LoadAsync(populateHeader: false);
            return Page();
        }

        var result = await purchases.SaveDraftAsync(Id ?? 0, Header.SupplierId, Header.PurchaseDate, Header.DueDate, Header.Notes);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
            await LoadAsync(populateHeader: false);
            return Page();
        }

        TempData["StatusMessage"] = "Rascunho salvo.";
        return RedirectToPage(new { id = result.PurchaseId, Completed, From, To, Search });
    }

    public async Task<IActionResult> OnPostAddItemAsync()
    {
        if (Id is null)
        {
            return BadRequest();
        }

        var result = await purchases.AddItemAsync(Id.Value, Line.ProductId, Line.Quantity, Line.UnitCost);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
            await LoadAsync();
            return Page();
        }

        TempData["StatusMessage"] = "Produto adicionado à compra.";
        return RedirectToPage(new { id = Id, Completed, From, To, Search });
    }

    public async Task<IActionResult> OnPostRemoveItemAsync(int itemId)
    {
        if (Id is null)
        {
            return BadRequest();
        }

        var result = await purchases.RemoveItemAsync(Id.Value, itemId);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
            await LoadAsync();
            return Page();
        }

        TempData["StatusMessage"] = "Produto removido da compra.";
        return RedirectToPage(new { id = Id, Completed, From, To, Search });
    }

    public async Task<IActionResult> OnPostCompleteAsync()
    {
        if (Id is null)
        {
            return BadRequest();
        }

        var result = await purchases.CompleteAsync(Id.Value);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
            await LoadAsync();
            return Page();
        }

        TempData["StatusMessage"] = "Compra concluída: estoque atualizado e conta a pagar criada.";
        return RedirectToPage(new { id = Id, Completed, From, To, Search });
    }

    private async Task LoadAsync(bool populateHeader = true)
    {
        Items = await purchases.ListAsync(Completed, From, To, Search);
        StatusMessage = TempData["StatusMessage"] as string;
        if (Id is int id)
        {
            Current = await purchases.FindAsync(id);
            if (Current is not null && populateHeader)
            {
                Header = new PurchaseHeaderInput
                {
                    SupplierId = Current.SupplierId,
                    PurchaseDate = Current.PurchaseDate,
                    DueDate = Current.DueDate,
                    Notes = Current.Notes
                };
            }
        }

        if (Id is not null || Create)
        {
            Suppliers = await suppliers.ListAsync(null);
            Products = await products.ListAsync(null);
        }
    }

    private static string Message(string? errorCode) => errorCode switch
    {
        "InvalidPurchase" => "Informe um fornecedor e datas válidas.",
        "InvalidItem" => "Escolha um produto e informe quantidade e custo válidos. Cada produto pode aparecer uma vez.",
        "PurchaseIncomplete" => "Adicione pelo menos um produto e informe a data de vencimento para concluir.",
        _ => "Não foi possível alterar esta compra. Atualize a página e confira a situação e os dados informados."
    };

    public sealed class PurchaseHeaderInput
    {
        public int SupplierId { get; set; }
        public DateOnly PurchaseDate { get; set; }
        public DateOnly? DueDate { get; set; }
        public string? Notes { get; set; }
    }

    public sealed class PurchaseLineInput
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitCost { get; set; }
    }
}
