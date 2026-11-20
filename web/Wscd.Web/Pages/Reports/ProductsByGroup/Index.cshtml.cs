using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services;
using Wscd.Services.Catalogs;
using Wscd.Services.Reports;

namespace Wscd.Web.Pages.Reports.ProductsByGroup;

public sealed class IndexModel(IStockReportService reports, ICatalogService<ProductGroup> groups) : PageModel
{
    [BindProperty(SupportsGet = true)] public int? GroupId { get; set; }

    public IReadOnlyList<ProductGroup> Groups { get; private set; } = [];
    public IReadOnlyList<ProductGroupReportRow>? Products { get; private set; }
    public string? GroupName { get; private set; }
    public string? Error { get; private set; }
    public DateOnly ReportDate => BrasiliaClock.Today;

    public async Task OnGetAsync()
    {
        Groups = await groups.ListAsync(null);
        if (GroupId is int groupId && ModelState.IsValid && Groups.FirstOrDefault(group => group.Id == groupId) is { } group)
        {
            GroupName = group.Name;
            Products = await reports.GetProductsByGroupAsync(groupId);
        }
        else if (Request.Query.ContainsKey(nameof(GroupId)))
        {
            Error = "Selecione um grupo de produtos da organização.";
        }
    }
}
