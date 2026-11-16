using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.ProductGroups;

public sealed class IndexModel : CatalogPageModel<ProductGroup>
{
    public IndexModel(ICatalogService<ProductGroup> catalog) : base(catalog) => Title = "Grupos de produtos";
}
