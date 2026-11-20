using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Sales;

public sealed class ReturnModel(SaleService sales, ICatalogService<CashAccount> cashAccounts) : SaleFiltersModel
{
    [BindProperty(SupportsGet = true), FromRoute] public int Id { get; set; }
    [BindProperty] public SaleReturnInput Input { get; set; } = new();
    public Sale? Current { get; private set; }
    public SaleReturn? Preview { get; private set; }
    public IReadOnlyList<CashAccount> CashAccounts { get; private set; } = [];
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
        Input.ReceivableRevision = Current.Receivable?.Revision;
        return Page();
    }

    public Task<IActionResult> OnPostReviewAsync() => HandleAsync(confirm: false);
    public Task<IActionResult> OnPostConfirmAsync() => HandleAsync(confirm: true);

    private async Task<IActionResult> HandleAsync(bool confirm)
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        SaleReturnReview review;
        if (!ModelState.IsValid)
        {
            review = confirm
                ? await sales.ReviewReturnAsync(Id, Input, userId)
                : new SaleReturnReview(SaleReturnResult.InvalidItems, await sales.FindAsync(Id));
            if (confirm && review.Result == SaleReturnResult.Ready)
            {
                review = review with { Result = SaleReturnResult.InvalidRefund };
            }
        }
        else
        {
            review = confirm
                ? await sales.RegisterReturnAsync(Id, Input, userId)
                : await sales.ReviewReturnAsync(Id, Input, userId);
        }
        if (review.Result == SaleReturnResult.Recorded)
        {
            TempData["StatusMessage"] = "Devolução registrada.";
            return RedirectToPage("./Edit", MaintenanceRoute(Id));
        }

        Current = review.Sale;
        if (Current is null)
        {
            return NotFound();
        }
        NeedsReview = review.Result == SaleReturnResult.Conflict;
        if (review.Result is SaleReturnResult.Ready or SaleReturnResult.InvalidRefund)
        {
            Preview = review.Return;
            if (Preview is { RefundAmount: > 0 })
            {
                CashAccounts = (await cashAccounts.ListAsync(null)).Where(account => !account.IsInactive).ToArray();
            }
        }
        Error = review.Result switch
        {
            SaleReturnResult.Ready => null,
            SaleReturnResult.InvalidReason => "Informe um motivo válido, de até 240 caracteres.",
            SaleReturnResult.InvalidItems => "Escolha pelo menos um item e confira as quantidades ainda disponíveis para devolução.",
            SaleReturnResult.InvalidRefund => "Selecione o meio da devolução e uma conta caixa ativa da organização.",
            SaleReturnResult.Conflict => "Não foi possível registrar. Volte à venda e confira os itens, o estoque e os recebimentos antes de tentar novamente.",
            _ => "Somente vendas concluídas e não canceladas podem receber devoluções."
        };
        return Page();
    }
}
