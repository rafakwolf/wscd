using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Sales;

public sealed class CancelModel(SaleService sales) : SaleFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int Id { get; set; }
    [BindProperty] public ReversalInput Input { get; set; } = new();
    [BindProperty] public Guid? ReceivableRevision { get; set; }
    public Sale? Current { get; private set; }
    public string? Error { get; private set; }
    public bool NeedsReview { get; private set; }

    public async Task<IActionResult> OnGetAsync()
    {
        Current = await sales.FindAsync(Id);
        if (Current is null)
        {
            return NotFound();
        }
        Input.Revision = Current.Revision;
        ReceivableRevision = Current.Receivable?.Revision;
        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        var result = ModelState.IsValid
            ? await sales.CancelAsync(Id, Input, ReceivableRevision, User.FindFirstValue(ClaimTypes.NameIdentifier))
            : SaleCancellation.Conflict;
        if (result == SaleCancellation.Cancelled)
        {
            TempData["StatusMessage"] = "Venda cancelada. Estoque recomposto e lançamentos financeiros atualizados.";
            return RedirectToPage("./Edit", MaintenanceRoute(Id));
        }

        Current = await sales.FindAsync(Id);
        if (Current is null)
        {
            return NotFound();
        }
        NeedsReview = result == SaleCancellation.Conflict;
        Error = result switch
        {
            SaleCancellation.InvalidReason => "Informe um motivo válido, de até 240 caracteres.",
            SaleCancellation.Conflict => "Não foi possível cancelar. Volte à venda e confira os recebimentos e o estoque antes de tentar novamente.",
            SaleCancellation.HasReturns => "O cancelamento integral não está disponível após uma devolução.",
            _ => "Somente vendas concluídas e ainda não canceladas podem ser canceladas."
        };
        return Page();
    }
}
