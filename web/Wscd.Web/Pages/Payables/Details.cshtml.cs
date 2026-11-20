using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Purchases;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Purchases;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Payables;

public sealed class DetailsModel(PayableService payables, ICatalogService<CashAccount> cashAccounts) : PayableFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int Id { get; set; }
    [BindProperty] public SalePaymentInput Payment { get; set; } = new();

    public AccountPayable? Account { get; private set; }
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

    public async Task<IActionResult> OnPostPayAsync(Guid? expectedRevision)
    {
        var result = ModelState.IsValid && expectedRevision.HasValue
            ? await payables.PayAsync(Id, Payment, expectedRevision.Value)
            : TitleSettlement.InvalidPayment;
        if (result == TitleSettlement.Recorded)
        {
            TempData["StatusMessage"] = "Pagamento registrado no Caixa e saldo atualizado.";
            return RedirectToPage("./Details", new RouteValueDictionary(ListFilters) { ["id"] = Id });
        }

        Error = result switch
        {
            TitleSettlement.InvalidCashAccount => "Selecione uma conta caixa ativa da organização.",
            TitleSettlement.Conflict => "O saldo mudou. Confira o valor atualizado antes de registrar outro pagamento.",
            _ => "Informe o meio, a conta caixa e um valor positivo de até duas casas decimais, sem ultrapassar o saldo."
        };
        await LoadAsync();
        return Account is null ? NotFound() : Page();
    }

    public async Task<IActionResult> OnPostDeleteAsync(Guid? expectedRevision)
    {
        if (expectedRevision.HasValue && await payables.DeleteManualAsync(Id, expectedRevision.Value))
        {
            TempData["StatusMessage"] = "Conta a pagar excluída.";
            return RedirectToPage("./Index", ListFilters);
        }

        Error = "Não foi possível excluir este título.";
        await LoadAsync();
        return Account is null ? NotFound() : Page();
    }

    private async Task LoadAsync()
    {
        Account = await payables.FindAsync(Id);
        if (Account is { Balance: > 0 })
        {
            CashAccounts = (await cashAccounts.ListAsync(null)).Where(account => !account.IsInactive).ToArray();
        }
    }
}
