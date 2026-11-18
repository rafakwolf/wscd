using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Customers;

public sealed class EditModel(ICatalogService<Customer> catalog) : CatalogEditModel<Customer>(catalog)
{
}
