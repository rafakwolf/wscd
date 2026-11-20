using Microsoft.AspNetCore.Mvc;
using Wscd.Data.Identity;
using Wscd.Domain.Catalogs;
using Wscd.Services;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;

namespace Wscd.Web.Pages.Catalogs.Products;

public sealed class EditModel : CatalogEditModel<Product>
{
    private readonly ICatalogService<Product> catalog;
    private readonly ICatalogService<ProductGroup> groups;
    private readonly ICatalogService<Unit> units;
    private readonly ICatalogService<Supplier> suppliers;
    private readonly IPromotionStore promotions;

    public EditModel(
        ICatalogService<Product> catalog,
        ICatalogService<ProductGroup> groups,
        ICatalogService<Unit> units,
        ICatalogService<Supplier> suppliers,
        IPromotionStore promotions) : base(catalog)
    {
        this.catalog = catalog;
        this.groups = groups;
        this.units = units;
        this.suppliers = suppliers;
        this.promotions = promotions;
    }

    public IReadOnlyList<ProductGroup> Groups { get; private set; } = [];
    public IReadOnlyList<Unit> Units { get; private set; } = [];
    public IReadOnlyList<Supplier> Suppliers { get; private set; } = [];
    public bool CanEditStock => Id is null || User.IsInRole(ApplicationRoles.Administrator);

    public override async Task<IActionResult> OnPostSaveAsync([FromRoute] int? id)
    {
        if (id is int existingId && !User.IsInRole(ApplicationRoles.Administrator) &&
            await catalog.FindAsync(existingId) is { } existing)
        {
            Input.Stock = existing.Stock;
        }

        return await base.OnPostSaveAsync(id);
    }

    protected override async Task LoadOptionsAsync()
    {
        Groups = await groups.ListAsync(null);
        Units = await units.ListAsync(null);
        Suppliers = await suppliers.ListAsync(null);
        if (Id is int productId)
        {
            var today = BrasiliaClock.Today;
            var promo = await promotions.FindByProductAsync(productId);
            Input.PromotionPrice = promo is not null && promo.StartDate <= today && promo.EndDate >= today
                ? promo.PromotionPrice
                : null;
        }
    }
}
