using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Sellers;

public sealed class EditModel(ICatalogService<Seller> catalog) : CatalogEditModel<Seller>(catalog)
{
}
