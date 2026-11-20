using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.ProductExpirations;

public sealed class IndexModel(IStockReportService reports, ICatalogService<Unit> units,
    ICatalogService<ProductGroup> groups, ICatalogService<Supplier> suppliers) : PageModel
{
    [BindProperty(SupportsGet = true)] public DateOnly? Through { get; set; }
    [BindProperty(SupportsGet = true)] public int? UnitId { get; set; }
    [BindProperty(SupportsGet = true)] public int? GroupId { get; set; }
    [BindProperty(SupportsGet = true)] public int? SupplierId { get; set; }

    public IReadOnlyList<Unit> Units { get; private set; } = [];
    public IReadOnlyList<ProductGroup> Groups { get; private set; } = [];
    public IReadOnlyList<Supplier> Suppliers { get; private set; } = [];
    public string? UnitName { get; private set; }
    public string? GroupName { get; private set; }
    public string? SupplierName { get; private set; }
    public ProductExpirationReport? Report { get; private set; }
    public string? Error { get; private set; }

    public async Task OnGetAsync()
    {
        if (!Request.Query.ContainsKey(nameof(Through)))
        {
            Through = BrasiliaClock.Today;
        }

        Units = await units.ListAsync(null);
        Groups = await groups.ListAsync(null);
        Suppliers = await suppliers.ListAsync(null);
        UnitName = Units.FirstOrDefault(unit => unit.Id == UnitId)?.Name;
        GroupName = Groups.FirstOrDefault(group => group.Id == GroupId)?.Name;
        SupplierName = Suppliers.FirstOrDefault(supplier => supplier.Id == SupplierId)?.Name;

        if (!ModelState.IsValid || Through is not DateOnly through)
        {
            Error = "Informe uma data-limite válida e confira os filtros.";
            return;
        }

        if ((UnitId.HasValue && UnitName is null) || (GroupId.HasValue && GroupName is null) ||
            (SupplierId.HasValue && SupplierName is null))
        {
            Error = "Selecione unidade, grupo e fornecedor da organização.";
            return;
        }

        Report = await reports.GetExpirationsAsync(through, UnitId, GroupId, SupplierId);
    }
}
