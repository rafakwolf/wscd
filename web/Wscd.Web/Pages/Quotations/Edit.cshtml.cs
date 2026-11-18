using Microsoft.AspNetCore.Mvc;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Quotations;
using Wscd.Services.Catalogs;
using Wscd.Services.Quotations;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Quotations;

public sealed class EditModel(
    QuotationService quotations,
    SaleService sales,
    ICatalogService<Customer> customers,
    ICatalogService<Seller> sellers,
    ICatalogService<Product> products) : DocumentFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int? Id { get; set; }

    [BindProperty] public HeaderInput Header { get; set; } = new();
    [BindProperty] public ItemInput Line { get; set; } = new();

    public Quotation? Current { get; private set; }
    public IReadOnlyList<Customer> Customers { get; private set; } = [];
    public IReadOnlyList<Seller> Sellers { get; private set; } = [];
    public IReadOnlyList<Product> Products { get; private set; } = [];
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        Header.Date = DateOnly.FromDateTime(DateTime.Today);
        Line.Quantity = 1;
        await LoadAsync();
        return Id is not null && Current is null ? NotFound() : Page();
    }

    public async Task<IActionResult> OnPostSaveAsync()
    {
        if (ModelState.IsValid && await quotations.SaveAsync(Id ?? 0, Header.CustomerId, Header.SellerId,
                Header.Date, Header.Notes) is int id)
        {
            return Saved(id, "Rascunho salvo.");
        }

        Error = "Não foi possível salvar. Confira o cliente, o vendedor ativo, a data e a situação do orçamento.";
        await LoadAsync(keepHeader: true);
        return Id is not null && Current is null ? NotFound() : Page();
    }

    public Task<IActionResult> OnPostAddItemAsync() => ChangeAsync(
        id => quotations.AddItemAsync(id, Line.ProductId, Line.Quantity, Line.DiscountPercent),
        "Produto adicionado.", "Selecione um produto ainda não incluído, informe uma quantidade positiva e desconto de 0 a 100%. Confira o total e a situação do orçamento.");

    public Task<IActionResult> OnPostRemoveItemAsync(int itemId) => ChangeAsync(
        id => quotations.RemoveItemAsync(id, itemId), "Produto removido.", "Não foi possível remover o produto deste orçamento.");

    public Task<IActionResult> OnPostCompleteAsync() => ChangeAsync(
        id => quotations.SetCompletedAsync(id, true), "Orçamento concluído. Nenhum movimento de estoque ou financeiro foi lançado.",
        "Para concluir, o orçamento deve estar em rascunho e ter ao menos um produto.");

    public Task<IActionResult> OnPostReopenAsync() => ChangeAsync(
        id => quotations.SetCompletedAsync(id, false), "Orçamento reaberto.", "Só é possível reabrir um orçamento concluído que ainda não foi convertido.");

    public async Task<IActionResult> OnPostConvertAsync()
    {
        if (Id is not int id)
        {
            return NotFound();
        }
        if (ModelState.IsValid && await sales.ConvertQuotationAsync(id, DateOnly.FromDateTime(DateTime.Today)) is int saleId)
        {
            TempData["StatusMessage"] = "Venda aberta com os itens e preços do orçamento. Estoque e caixa só mudam na conclusão.";
            return RedirectToPage("/Sales/Edit", new { id = saleId });
        }

        Error = "Não foi possível converter. Confira se o orçamento está concluído e tente novamente.";
        await LoadAsync();
        return Current is null ? NotFound() : Page();
    }

    private async Task<IActionResult> ChangeAsync(Func<int, Task<bool>> change, string message, string error)
    {
        if (Id is not int id)
        {
            return NotFound();
        }
        if (ModelState.IsValid && await change(id))
        {
            return Saved(id, message);
        }

        Error = $"{error} Se o registro mudou, tente novamente.";
        await LoadAsync();
        return Current is null ? NotFound() : Page();
    }

    private IActionResult Saved(int id, string message)
    {
        TempData["StatusMessage"] = message;
        return RedirectToPage("./Edit", MaintenanceRoute(id));
    }

    private async Task LoadAsync(bool keepHeader = false)
    {
        Current = Id is int id ? await quotations.FindAsync(id) : null;
        if (Current?.IsCompleted == true)
        {
            return;
        }

        Customers = await customers.ListAsync(null);
        Sellers = (await sellers.ListAsync(null)).Where(seller => seller.IsActive).ToArray();
        if (Current is not null)
        {
            Products = await products.ListAsync(null);
        }

        if (!keepHeader && Current is { } quotation)
        {
            Header = new HeaderInput
            {
                Date = quotation.Date,
                CustomerId = quotation.CustomerId,
                SellerId = quotation.SellerId,
                Notes = quotation.Notes
            };
        }
    }

    public sealed class HeaderInput
    {
        public int CustomerId { get; set; }
        public int SellerId { get; set; }
        public DateOnly Date { get; set; }
        public string? Notes { get; set; }
    }

    public sealed class ItemInput
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal DiscountPercent { get; set; }
    }
}
