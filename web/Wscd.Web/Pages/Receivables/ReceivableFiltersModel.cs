using System.Globalization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Services.Reports;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Receivables;

public abstract class ReceivableFiltersModel : PageModel
{
    [BindProperty(SupportsGet = true)] public string? Customer { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }
    [BindProperty(SupportsGet = true)] public TitleStatus? Status { get; set; }

    public DateOnly Today { get; } = CashReportService.Today;
    public Dictionary<string, string?> ListFilters => new()
    {
        ["Customer"] = Customer,
        ["From"] = From?.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture),
        ["To"] = To?.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture),
        ["Status"] = Status?.ToString()
    };

    public string StatusLabel(DateOnly dueDate, decimal balance) =>
        balance == 0 ? "Quitada" : dueDate < Today ? "Vencida" : "Em aberto";
}
