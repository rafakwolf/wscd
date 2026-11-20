using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Customers;

public sealed class IndexModel : CatalogPageModel<Customer>
{
    public IndexModel(ICatalogService<Customer> catalog) : base(catalog)
    {
        Title = "Clientes";
        NewLabel = "Novo cliente";
    }
}
