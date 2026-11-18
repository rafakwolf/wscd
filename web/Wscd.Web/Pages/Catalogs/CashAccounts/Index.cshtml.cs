using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.CashAccounts;

public sealed class IndexModel : CatalogPageModel<CashAccount>
{
    public IndexModel(ICatalogService<CashAccount> catalog) : base(catalog)
    {
        Title = "Contas caixa";
        NewLabel = "Nova conta caixa";
        CanDelete = false;
    }
}
