using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Banks;

public sealed class IndexModel : CatalogPageModel<Bank>
{
    public IndexModel(ICatalogService<Bank> catalog) : base(catalog)
    {
        Title = "Bancos";
        NewLabel = "Novo banco";
    }
}
