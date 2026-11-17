using Wscd.Domain.Catalogs;
using Wscd.Services.Organizations;

namespace Wscd.Services.Catalogs;

public sealed class CatalogService<TEntity>(
    ICatalogStore<TEntity> store,
    ICurrentOrganization currentOrganization) : ICatalogService<TEntity>
    where TEntity : class, ICatalogEntity
{
    public Task<IReadOnlyList<TEntity>> ListAsync(string? search) => store.ListAsync(search?.Trim());

    public Task<TEntity?> FindAsync(int id) => store.FindAsync(id);

    public async Task<bool> SaveAsync(TEntity entity)
    {
        entity.OrganizationId = currentOrganization.OrganizationId
            ?? throw new InvalidOperationException("A organização atual não foi identificada.");

        switch (entity)
        {
            case Product product:
                product.Barcode = NullIfBlank(product.Barcode);
                var previousProduct = product.Id == 0 ? null : await store.FindAsync(product.Id) as Product;
                product.PromotionPrice = previousProduct?.PromotionPrice;
                if ((previousProduct is null && product.SalePrice == 0) ||
                    (previousProduct is not null && (previousProduct.Cost != product.Cost || previousProduct.MarginPercent != product.MarginPercent)))
                {
                    product.SalePrice = decimal.Round(
                        product.Cost + product.Cost * product.MarginPercent / 100,
                        2,
                        MidpointRounding.AwayFromZero);
                }
                break;
            case Customer customer:
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
                    customer.RegistrationDate = DateOnly.FromDateTime(DateTime.Today);
                }
                break;
            case Supplier supplier:
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
                    supplier.RegistrationDate = DateOnly.FromDateTime(DateTime.Today);
                }
                break;
        }

        return await store.SaveAsync(entity);
    }

    public Task<bool> DeleteAsync(int id) => store.DeleteAsync(id);

    private static string? NullIfBlank(string? value) =>
        string.IsNullOrWhiteSpace(value) ? null : value.Trim();
}
