using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.TitleSettlements;

public sealed class IndexModel(CashReportService reports, ICatalogService<CashAccount> cashAccounts) : PageModel
{
    [BindProperty(SupportsGet = true)] public string? Party { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }
    [BindProperty(SupportsGet = true)] public int? CashAccountId { get; set; }

    public string Kind { get; private set; } = string.Empty;
    public bool IsPayable => Kind == "a-pagar";
    public string? AccountName { get; private set; }
    public IReadOnlyList<CashAccount> CashAccounts { get; private set; } = [];
    public TitleSettlementReport? Report { get; private set; }
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync([FromRoute] string kind)
    {
        if (kind is not ("a-pagar" or "a-receber"))
        {
            return NotFound();
        }
        Kind = kind;
        CashAccounts = await cashAccounts.ListAsync(null);
        if (!ModelState.IsValid)
        {
            Error = "Informe datas válidas e selecione uma conta caixa da lista.";
            return Page();
        }
        if (CashAccountId is int id)
        {
            AccountName = CashAccounts.FirstOrDefault(account => account.Id == id)?.Name;
            if (AccountName is null)
            {
                Error = "Selecione uma conta caixa da organização.";
                return Page();
            }
        }
        if (!Request.Query.ContainsKey(nameof(From)) && !Request.Query.ContainsKey(nameof(To)))
        {
            var today = CashReportService.Today;
            From = new DateOnly(today.Year, today.Month, 1);
            To = today;
        }

        Party = Party?.Trim();
        Report = await reports.GetSettlementsAsync(IsPayable ? TitleSide.Payable : TitleSide.Receivable, Party, CashAccountId, From, To);
        if (Report is null)
        {
            Error = "A data inicial deve ser anterior ou igual à data final.";
        }
        return Page();
    }
}
