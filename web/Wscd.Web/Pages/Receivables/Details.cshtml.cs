using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Receivables;

public sealed class DetailsModel(ReceivableService receivables, ICatalogService<CashAccount> cashAccounts) : ReceivableFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int Id { get; set; }
    [BindProperty] public SalePaymentInput Payment { get; set; } = new();

    public AccountReceivable? Account { get; private set; }
    public IReadOnlyList<CashAccount> CashAccounts { get; private set; } = [];
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        await LoadAsync();
        if (Account is null)
        {
            return NotFound();
        }

        Payment = new SalePaymentInput { Method = PaymentMethod.Cash, Amount = Account.Balance };
        return Page();
    }

    public async Task<IActionResult> OnPostReceiveAsync(Guid? expectedRevision)
    {
        var result = ModelState.IsValid && expectedRevision.HasValue
            ? await receivables.ReceiveAsync(Id, Payment, expectedRevision.Value)
            : TitleSettlement.InvalidPayment;
        if (result == TitleSettlement.Recorded)
        {
            TempData["StatusMessage"] = "Recebimento registrado no Caixa e saldo atualizado.";
            return RedirectToPage("./Details", new RouteValueDictionary(ListFilters) { ["id"] = Id });
        }

        Error = result switch
        {
            TitleSettlement.InvalidCashAccount => "Selecione uma conta caixa ativa da organização.",
            TitleSettlement.Conflict => "O saldo mudou. Confira o valor atualizado antes de registrar outro recebimento.",
            _ => "Informe o meio, a conta caixa e um valor positivo de até duas casas decimais, sem ultrapassar o saldo."
        };
        await LoadAsync();
        return Account is null ? NotFound() : Page();
    }

    private async Task LoadAsync()
    {
        Account = await receivables.FindAsync(Id);
        if (Account is { Balance: > 0 })
        {
            CashAccounts = (await cashAccounts.ListAsync(null)).Where(account => !account.IsInactive).ToArray();
        }
    }
}
