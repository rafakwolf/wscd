using Wscd.Domain.Catalogs;
using Wscd.Services.Inventory;
using Wscd.Services.Organizations;

namespace Wscd.Services.Catalogs;

public sealed class CatalogService<TEntity>(
    ICatalogStore<TEntity> store,
    ICurrentOrganization currentOrganization,
    IPromotionStore? promotions = null) : ICatalogService<TEntity>
    where TEntity : class, ICatalogEntity
{
    public Task<IReadOnlyList<TEntity>> ListAsync(string? search) => store.ListAsync(search?.Trim());

    public Task<TEntity?> FindAsync(int id) => store.FindAsync(id);

    public async Task<bool> SaveAsync(TEntity entity)
    {
        if (currentOrganization.OrganizationId is not Guid organizationId)
        {
            return false;
        }

        entity.OrganizationId = organizationId;
        entity.Name = entity.Name?.Trim() ?? string.Empty;
        if (string.IsNullOrWhiteSpace(entity.Name))
        {
            return false;
        }

        decimal? previousSalePrice = null;
        switch (entity)
        {
            case Product product:
                if (product.Cost < 0 || product.MarginPercent < 0 || product.SalePrice < 0 ||
                    product.Weight is < 0 || product.Stock < 0 || product.MinimumStock < 0 || product.QuantityReceived < 0)
                {
                    return false;
                }
                product.Barcode = NullIfBlank(product.Barcode);
                var previousProduct = product.Id == 0 ? null : await store.FindAsync(product.Id) as Product;
                previousSalePrice = previousProduct?.SalePrice;
                product.PromotionPrice = previousProduct?.PromotionPrice;
                if (previousProduct is null && product.SalePrice == 0)
                {
                    product.SalePrice = decimal.Round(
                        product.Cost + product.Cost * product.MarginPercent / 100,
                        2,
                        MidpointRounding.AwayFromZero);
                }
                break;
            case Customer customer:
                if (customer.Type is not ("F" or "J") || customer.CreditLimit < 0 || customer.Salary is < 0)
                {
                    return false;
                }
                customer.TaxNumber = NullIfBlank(customer.TaxNumber);
                customer.StateRegistrationOrIdentity = NullIfBlank(customer.StateRegistrationOrIdentity);
                var previousCustomer = customer.Id == 0 ? null : await store.FindAsync(customer.Id) as Customer;
                customer.City = NullIfBlank(customer.City);
                if (customer.City is not null && !CityCatalog.Contains(customer.City) &&
                    !string.Equals(customer.City, previousCustomer?.City?.Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    return false;
                }
                if (customer.Id == 0 && customer.RegistrationDate == default)
                {
                    customer.RegistrationDate = BrasiliaClock.Today;
                }
                break;
            case Supplier supplier:
                if (supplier.Type is not ("F" or "J"))
                {
                    return false;
                }
                supplier.TaxNumber = NullIfBlank(supplier.TaxNumber);
                var previousSupplier = supplier.Id == 0 ? null : await store.FindAsync(supplier.Id) as Supplier;
                supplier.City = NullIfBlank(supplier.City);
                if (supplier.City is not null && !CityCatalog.Contains(supplier.City) &&
                    !string.Equals(supplier.City, previousSupplier?.City?.Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    return false;
                }
                if (supplier.Id == 0 && supplier.RegistrationDate is null)
                {
                    supplier.RegistrationDate = BrasiliaClock.Today;
                }
                break;
        }

        if (!await store.SaveAsync(entity))
        {
            return false;
        }

        if (entity is Product savedProduct && previousSalePrice is decimal oldPrice && oldPrice != savedProduct.SalePrice)
        {
            await PromotionService.SyncRegularPriceAsync(promotions, savedProduct.Id, savedProduct.SalePrice);
        }

        return true;
    }

    public Task<bool> DeleteAsync(int id) => store.DeleteAsync(id);

    private static string? NullIfBlank(string? value) =>
        string.IsNullOrWhiteSpace(value) ? null : value.Trim();
}
