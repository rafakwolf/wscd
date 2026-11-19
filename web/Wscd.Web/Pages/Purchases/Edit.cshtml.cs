using Microsoft.AspNetCore.Mvc;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Purchases;
using Wscd.Services;
using Wscd.Services.Catalogs;
using Wscd.Services.Purchases;

namespace Wscd.Web.Pages.Purchases;

public sealed class EditModel(
    IPurchaseService purchases,
    ICatalogService<Supplier> suppliers,
    ICatalogService<Product> products) : DocumentFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int? Id { get; set; }

    [BindProperty]
    public PurchaseHeaderInput Header { get; set; } = new();

    [BindProperty]
    public PurchaseLineInput Line { get; set; } = new();

    public IReadOnlyList<Supplier> Suppliers { get; private set; } = [];
    public IReadOnlyList<Product> Products { get; private set; } = [];
    public Purchase? Current { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        Header.PurchaseDate = BrasiliaClock.Today;
        Line.Quantity = 1;
        await LoadAsync();
        return Id is not null && Current is null ? NotFound() : Page();
    }

    public async Task<IActionResult> OnPostSaveAsync()
    {
        if (!ModelState.IsValid)
        {
            await LoadAsync(populateHeader: false);
            return Id is not null && Current is null ? NotFound() : Page();
        }

        var result = await purchases.SaveDraftAsync(Id ?? 0, Header.SupplierId, Header.PurchaseDate, Header.DueDate, Header.Notes);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
            await LoadAsync(populateHeader: false);
            return Id is not null && Current is null ? NotFound() : Page();
        }

        TempData["StatusMessage"] = "Rascunho salvo.";
        return RedirectToPage("./Edit", MaintenanceRoute(result.PurchaseId));
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
            return Id is not null && Current is null ? NotFound() : Page();
        }

        TempData["StatusMessage"] = "Produto adicionado à compra.";
        return RedirectToPage("./Edit", MaintenanceRoute(Id));
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
            return Id is not null && Current is null ? NotFound() : Page();
        }

        TempData["StatusMessage"] = "Produto removido da compra.";
        return RedirectToPage("./Edit", MaintenanceRoute(Id));
    }

    public async Task<IActionResult> OnPostCompleteAsync()
    {
        if (Id is null)
        {
            return BadRequest();
        }

        if (Header.SupplierId > 0 && Header.PurchaseDate != default)
        {
            var saved = await purchases.SaveDraftAsync(Id.Value, Header.SupplierId, Header.PurchaseDate, Header.DueDate, Header.Notes);
            if (!saved.Succeeded)
            {
                ModelState.AddModelError(string.Empty, Message(saved.ErrorCode));
                await LoadAsync(populateHeader: false);
                return Id is not null && Current is null ? NotFound() : Page();
            }
        }

        var result = await purchases.CompleteAsync(Id.Value);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, Message(result.ErrorCode));
            await LoadAsync(populateHeader: Header.SupplierId <= 0);
            return Id is not null && Current is null ? NotFound() : Page();
        }

        TempData["StatusMessage"] = "Compra concluída: estoque atualizado e conta a pagar criada.";
        return RedirectToPage("./Edit", MaintenanceRoute(Id));
    }

    private async Task LoadAsync(bool populateHeader = true)
    {
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

        if (Current?.IsCompleted != true)
        {
            Suppliers = await suppliers.ListAsync(null);
        }
        else
        {
            Suppliers = [Current.Supplier];
        }
        if (Current is { IsCompleted: false })
        {
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
