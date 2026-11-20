using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.CashAccounts;

public sealed class EditModel(ICatalogService<CashAccount> catalog) : CatalogEditModel<CashAccount>(catalog)
{
}
