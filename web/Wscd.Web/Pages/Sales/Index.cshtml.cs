using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Sales;

public sealed class IndexModel(
    SaleService sales,
    ICatalogService<Customer> customers,
    ICatalogService<Seller> sellers,
    ICatalogService<Product> products,
    ICatalogService<CashAccount> cashAccounts) : PageModel
{
    [BindProperty(SupportsGet = true)] public int? Id { get; set; }
    [BindProperty(SupportsGet = true)] public bool Create { get; set; }
    [BindProperty(SupportsGet = true)] public string? Search { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }
    [BindProperty(SupportsGet = true)] public bool? Completed { get; set; }
    [BindProperty] public HeaderInput Header { get; set; } = new();
    [BindProperty] public ItemInput Line { get; set; } = new();

    public Sale? Current { get; private set; }
    public bool CanEdit => Current is { IsCompleted: false, QuotationId: null };
    public IReadOnlyList<SaleSummary> Sales { get; private set; } = [];
    public IReadOnlyList<Customer> Customers { get; private set; } = [];
    public IReadOnlyList<Seller> Sellers { get; private set; } = [];
    public IReadOnlyList<Product> Products { get; private set; } = [];
    public IReadOnlyList<CashAccount> CashAccounts { get; private set; } = [];
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
        if (ModelState.IsValid && await sales.SaveAsync(Id ?? 0, Header.CustomerId, Header.SellerId, Header.Date, Header.Notes) is int id)
        {
            return Saved(id, "Rascunho salvo.");
        }

        Create = Id is null;
        return await ShowErrorAsync("Não foi possível salvar. Confira o cliente, o vendedor ativo, a data e a situação da venda.", keepHeader: true);
    }

    public Task<IActionResult> OnPostAddItemAsync() => ChangeItemsAsync(
        id => sales.AddItemAsync(id, Line.ProductId, Line.Quantity, Line.DiscountPercent),
        "Produto adicionado.", "Escolha um produto ainda não incluído, com quantidade positiva e desconto de 0 a 100%.");

    public Task<IActionResult> OnPostRemoveItemAsync(int itemId) => ChangeItemsAsync(
        id => sales.RemoveItemAsync(id, itemId), "Produto removido.", "Não foi possível remover o produto desta venda.");

    public async Task<IActionResult> OnPostCheckoutAsync(int cashAccountId, Guid revision)
    {
        if (Id is not int id)
        {
            return NotFound();
        }
        if (!ModelState.IsValid)
        {
            return await ShowErrorAsync("Confira a conta caixa e atualize a página antes de tentar novamente.");
        }

        var result = await sales.CheckoutAsync(id, cashAccountId, revision);
        return result == SaleCheckout.Completed
            ? Saved(id, "Venda concluída. Estoque baixado e recebimento registrado na conta caixa.")
            : await ShowErrorAsync(result switch
            {
                SaleCheckout.InsufficientStock => "Estoque insuficiente para pelo menos um produto. A venda não foi concluída e nenhum recebimento foi lançado.",
                SaleCheckout.InvalidCashAccount => "Selecione uma conta caixa ativa da organização.",
                SaleCheckout.InvalidSale => "A venda precisa estar em rascunho, incluir produtos e ter um total positivo dentro do limite permitido.",
                _ => "A venda mudou desde a última consulta. Confira o total atualizado e tente novamente."
            });
    }

    private async Task<IActionResult> ChangeItemsAsync(Func<int, Task<bool>> change, string message, string error)
    {
        if (Id is not int id)
        {
            return NotFound();
        }
        return ModelState.IsValid && await change(id)
            ? Saved(id, message)
            : await ShowErrorAsync($"{error} Confira também a situação da venda.");
    }

    private IActionResult Saved(int id, string message)
    {
        TempData["StatusMessage"] = message;
        return RedirectToPage(new { id, Search, From, To, Completed });
    }

    private async Task<IActionResult> ShowErrorAsync(string message, bool keepHeader = false)
    {
        Error = message;
        await LoadAsync(keepHeader);
        return Id is not null && Current is null ? NotFound() : Page();
    }

    private async Task LoadAsync(bool keepHeader = false)
    {
        Sales = await sales.ListAsync(Search, From, To, Completed);
        Current = Id is int id ? await sales.FindAsync(id) : null;
        if (Current is { IsCompleted: false })
        {
            CashAccounts = (await cashAccounts.ListAsync(null)).Where(account => !account.IsInactive).ToArray();
        }
        if (!CanEdit && !(Create && Id is null))
        {
            return;
        }

        Customers = await customers.ListAsync(null);
        Sellers = (await sellers.ListAsync(null)).Where(seller => seller.IsActive).ToArray();
        if (Current is { } sale)
        {
            Products = await products.ListAsync(null);
            if (!keepHeader)
            {
                Header = new HeaderInput { CustomerId = sale.CustomerId, SellerId = sale.SellerId, Date = sale.Date, Notes = sale.Notes };
            }
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
