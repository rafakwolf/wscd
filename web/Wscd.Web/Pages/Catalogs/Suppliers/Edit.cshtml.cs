using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Suppliers;

public sealed class EditModel(ICatalogService<Supplier> catalog) : CatalogEditModel<Supplier>(catalog)
{
}
