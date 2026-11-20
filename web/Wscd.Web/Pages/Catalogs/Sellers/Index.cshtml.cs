using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Sellers;

public sealed class IndexModel : CatalogPageModel<Seller>
{
    public IndexModel(ICatalogService<Seller> catalog) : base(catalog)
    {
        Title = "Vendedores";
        NewLabel = "Novo vendedor";
    }
}
