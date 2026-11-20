using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Cash;

public sealed class IndexModel(CashReportService reports, ICatalogService<CashAccount> cashAccounts) : PageModel
{
    [BindProperty(SupportsGet = true)] public int? CashAccountId { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }
    [BindProperty(SupportsGet = true)] public bool? IsExpense { get; set; }
    [BindProperty(SupportsGet = true)] public string? Search { get; set; }

    public IReadOnlyList<CashAccount> CashAccounts { get; private set; } = [];
    public string? AccountName { get; private set; }
    public CashReport? Report { get; private set; }
    public string? Error { get; private set; }

    public async Task OnGetAsync()
    {
        CashAccounts = await cashAccounts.ListAsync(null);
        if (!ModelState.IsValid)
        {
            Error = "Informe datas válidas e selecione uma conta caixa da lista.";
            return;
        }

        if (CashAccountId is int id)
        {
            var account = CashAccounts.FirstOrDefault(account => account.Id == id);
            if (account is null)
            {
                Error = "Selecione uma conta caixa da lista.";
                return;
            }
            AccountName = account.Name;
        }

        if (!Request.Query.ContainsKey(nameof(From)) && !Request.Query.ContainsKey(nameof(To)))
        {
            var today = CashReportService.Today;
            From = new DateOnly(today.Year, today.Month, 1);
            To = today;
        }

        Search = Search?.Trim();
        Report = await reports.GetAsync(CashAccountId, From, To, IsExpense, Search);
        if (Report is null)
        {
            Error = "A data inicial deve ser anterior ou igual à data final.";
        }
    }
}
