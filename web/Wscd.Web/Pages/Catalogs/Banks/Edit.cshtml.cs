using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Banks;

public sealed class EditModel(ICatalogService<Bank> catalog) : CatalogEditModel<Bank>(catalog)
{
}
