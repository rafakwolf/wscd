using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Suppliers;

public sealed class IndexModel : CatalogPageModel<Supplier>
{
    public IndexModel(ICatalogService<Supplier> catalog) : base(catalog)
    {
        Title = "Fornecedores";
        NewLabel = "Novo fornecedor";
    }
}
