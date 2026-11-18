using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.StockMinimum;

public sealed class IndexModel : PageModel
{
    public IActionResult OnGet(int? supplierId) => RedirectToPage("/Reports/StockPosition/Index",
        new { SupplierId = supplierId, Status = StockPositionFilter.AtOrBelowMinimum });
}
