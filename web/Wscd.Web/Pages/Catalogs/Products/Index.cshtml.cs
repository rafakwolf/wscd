using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Products;

public sealed class IndexModel : CatalogPageModel<Product>
{
    private readonly ICatalogService<ProductGroup> groups;
    private readonly ICatalogService<Unit> units;
    private readonly ICatalogService<Supplier> suppliers;

    public IndexModel(
        ICatalogService<Product> catalog,
        ICatalogService<ProductGroup> groups,
        ICatalogService<Unit> units,
        ICatalogService<Supplier> suppliers) : base(catalog)
    {
        this.groups = groups;
        this.units = units;
        this.suppliers = suppliers;
        Title = "Produtos";
    }

    public IReadOnlyList<ProductGroup> Groups { get; private set; } = [];
    public IReadOnlyList<Unit> Units { get; private set; } = [];
    public IReadOnlyList<Supplier> Suppliers { get; private set; } = [];

    protected override async Task LoadAdditionalDataAsync()
    {
        Groups = await groups.ListAsync(null);
        Units = await units.ListAsync(null);
        Suppliers = await suppliers.ListAsync(null);
    }

}
