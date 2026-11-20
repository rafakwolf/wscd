using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.StockPosition;

public sealed class IndexModel(IStockReportService reports, ICatalogService<ProductGroup> groups,
    ICatalogService<Supplier> suppliers) : PageModel
{
    [BindProperty(SupportsGet = true)] public string? Search { get; set; }
    [BindProperty(SupportsGet = true)] public int? GroupId { get; set; }
    [BindProperty(SupportsGet = true)] public int? SupplierId { get; set; }
    [BindProperty(SupportsGet = true)] public StockPositionFilter Status { get; set; }

    public IReadOnlyList<ProductGroup> Groups { get; private set; } = [];
    public IReadOnlyList<Supplier> Suppliers { get; private set; } = [];
    public string? GroupName { get; private set; }
    public string? SupplierName { get; private set; }
    public StockPositionReport? Report { get; private set; }
    public string? Error { get; private set; }
    public DateOnly ReportDate => CashReportService.Today;

    public async Task OnGetAsync()
    {
        Groups = await groups.ListAsync(null);
        Suppliers = await suppliers.ListAsync(null);
        GroupName = Groups.FirstOrDefault(group => group.Id == GroupId)?.Name;
        SupplierName = Suppliers.FirstOrDefault(supplier => supplier.Id == SupplierId)?.Name;
        if (!ModelState.IsValid || (GroupId.HasValue && GroupName is null) || (SupplierId.HasValue && SupplierName is null))
        {
            Error = "Confira a situação e selecione um grupo ou fornecedor da organização.";
            return;
        }

        Search = Search?.Trim();
        Report = await reports.GetPositionAsync(Search, GroupId, SupplierId, Status);
        if (Report is null)
        {
            Error = "Selecione uma situação de estoque válida.";
        }
    }
}
