using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Receivables;

public sealed class ReverseModel(ReceivableService titles) : ReceivableFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int Id { get; set; }
    [BindProperty(SupportsGet = true), FromRoute] public int PaymentId { get; set; }
    [BindProperty] public ReversalInput Input { get; set; } = new();
    public SettlementReversalView? Review { get; private set; }

    public async Task<IActionResult> OnGetAsync() => await LoadAsync(prefill: true) ? Page() : NotFound();

    public async Task<IActionResult> OnPostAsync()
    {
        var result = ModelState.IsValid
            ? await titles.ReverseAsync(Id, PaymentId, Input, User.FindFirstValue(ClaimTypes.NameIdentifier))
            : TitleSettlement.InvalidReversal;
        if (result == TitleSettlement.Recorded)
        {
            TempData["StatusMessage"] = "Estorno registrado no Caixa e saldo do título recomposto.";
            return RedirectToPage("./Details", new RouteValueDictionary(ListFilters) { ["id"] = Id });
        }

        var error = result switch
        {
            TitleSettlement.AlreadyReversed => "Esta baixa já foi estornada.",
            TitleSettlement.Conflict => "O título mudou. Volte ao título e confira o saldo antes de tentar novamente.",
            _ => "Informe um motivo válido, de até 240 caracteres."
        };
        return await LoadAsync(error: error) ? Page() : NotFound();
    }

    private async Task<bool> LoadAsync(bool prefill = false, string? error = null)
    {
        var title = await titles.FindAsync(Id);
        if (title?.Payments.SingleOrDefault(payment => payment.Id == PaymentId) is not { } original)
        {
            return false;
        }

        if (prefill)
        {
            Input.Revision = title.Revision;
        }
        Review = new SettlementReversalView(Id, PaymentId, original.Amount, original.CashAccount.Name,
            original.Method, false, original.ReversedAtUtc.HasValue, error, Input, ListFilters);
        return true;
    }
}
