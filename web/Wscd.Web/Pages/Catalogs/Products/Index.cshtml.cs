using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Products;

public sealed class IndexModel : CatalogPageModel<Product>
{
    public IndexModel(ICatalogService<Product> catalog) : base(catalog)
    {
        Title = "Produtos";
        NewLabel = "Novo produto";
    }
}
