using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Reports.PriceList;

public sealed class IndexModel(ICatalogService<Product> catalog) : PageModel
{
    [BindProperty(SupportsGet = true)] public bool ByPrice { get; set; }

    public IReadOnlyList<Product> Products { get; private set; } = [];
    public DateOnly ReportDate => BrasiliaClock.Today;

    public async Task OnGetAsync()
    {
        if (!ModelState.IsValid)
        {
            return;
        }

        var products = await catalog.ListAsync(null);
        Products = ByPrice ? products.OrderBy(product => product.SalePrice).ToArray() : products;
    }
}
