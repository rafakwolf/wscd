using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Units;

public sealed class EditModel(ICatalogService<Unit> catalog) : CatalogEditModel<Unit>(catalog)
{
}
