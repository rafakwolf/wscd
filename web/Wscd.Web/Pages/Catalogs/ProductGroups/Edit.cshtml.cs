using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.ProductGroups;

public sealed class EditModel(ICatalogService<ProductGroup> catalog) : CatalogEditModel<ProductGroup>(catalog)
{
}
