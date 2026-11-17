using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.StockMinimum;

public sealed class IndexModel(
    IStockReportService reports,
    ICatalogService<Supplier> suppliers) : PageModel
{
    [BindProperty(SupportsGet = true)]
    public int? SupplierId { get; set; }

    public IReadOnlyList<Supplier> Suppliers { get; private set; } = [];
    public MinimumStockReport? Report { get; private set; }
    public DateOnly ReportDate { get; } = DateOnly.FromDateTime(DateTime.Today);

    public async Task<IActionResult> OnGetAsync()
    {
        Suppliers = await suppliers.ListAsync(null);
        if (SupplierId is int supplierId)
        {
            Report = await reports.GetMinimumStockBySupplierAsync(supplierId);
            if (Report is null)
            {
                return NotFound();
            }
        }

        return Page();
    }
}
