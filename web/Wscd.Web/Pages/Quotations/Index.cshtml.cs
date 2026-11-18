using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Quotations;
using Wscd.Services.Catalogs;
using Wscd.Services.Quotations;

namespace Wscd.Web.Pages.Quotations;

public sealed class IndexModel(
    QuotationService quotations,
    ICatalogService<Customer> customers,
    ICatalogService<Seller> sellers,
    ICatalogService<Product> products) : PageModel
{
    [BindProperty(SupportsGet = true)] public int? Id { get; set; }
    [BindProperty(SupportsGet = true)] public bool Create { get; set; }
    [BindProperty(SupportsGet = true)] public string? Search { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }
    [BindProperty(SupportsGet = true)] public bool? Completed { get; set; }
    [BindProperty] public HeaderInput Header { get; set; } = new();
    [BindProperty] public ItemInput Line { get; set; } = new();

    public Quotation? Current { get; private set; }
    public IReadOnlyList<QuotationSummary> Quotations { get; private set; } = [];
    public IReadOnlyList<Customer> Customers { get; private set; } = [];
    public IReadOnlyList<Seller> Sellers { get; private set; } = [];
    public IReadOnlyList<Product> Products { get; private set; } = [];
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        if (!ModelState.IsValid || (From is DateOnly from && To is DateOnly to && from > to))
        {
            Error = "Confira o número, as datas e a situação informados.";
        }

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

        Create = Id is null;
        Error = "Não foi possível salvar. Confira o cliente, o vendedor ativo, a data e a situação do orçamento.";
        await LoadAsync(keepHeader: true);
        return Page();
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
        id => quotations.SetCompletedAsync(id, false), "Orçamento reaberto.", "Só é possível reabrir um orçamento concluído.");

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
        return RedirectToPage(new { id, Search, From, To, Completed });
    }

    private async Task LoadAsync(bool keepHeader = false)
    {
        Quotations = await quotations.ListAsync(Search, From, To, Completed);
        Current = Id is int id ? await quotations.FindAsync(id) : null;
        if (Current?.IsCompleted == true || (!Create && Current is null))
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
