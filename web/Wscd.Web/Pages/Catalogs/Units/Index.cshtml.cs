using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Units;

public sealed class IndexModel : CatalogPageModel<Unit>
{
    public IndexModel(ICatalogService<Unit> catalog) : base(catalog)
    {
        Title = "Unidades";
        NewLabel = "Nova unidade";
    }
}
