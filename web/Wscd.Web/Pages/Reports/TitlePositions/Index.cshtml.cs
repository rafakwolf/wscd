using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.TitlePositions;

public sealed class IndexModel(TitlePositionReportService reports) : PageModel
{
    [BindProperty(SupportsGet = true)] public string? Party { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }
    [BindProperty(SupportsGet = true)] public bool OnlyOverdue { get; set; }

    public string Kind { get; private set; } = string.Empty;
    public bool IsPayable => Kind == "a-pagar";
    public TitlePositionReport? Report { get; private set; }
    public string? Error { get; private set; }

    public async Task<IActionResult> OnGetAsync([FromRoute] string kind)
    {
        if (kind is not ("a-pagar" or "a-receber"))
        {
            return NotFound();
        }
        Kind = kind;
        if (!ModelState.IsValid)
        {
            Error = "Confira as datas de vencimento e a opção de atraso.";
            return Page();
        }

        Party = Party?.Trim();
        Report = await reports.GetAsync(IsPayable ? TitleSide.Payable : TitleSide.Receivable,
            Party, From, To, OnlyOverdue, CashReportService.Today);
        if (Report is null)
        {
            Error = "A data inicial deve ser anterior ou igual à data final.";
        }
        return Page();
    }
}
