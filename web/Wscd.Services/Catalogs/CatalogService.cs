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
                if (customer.Id == 0 && customer.RegistrationDate == default)
                {
                    customer.RegistrationDate = DateOnly.FromDateTime(DateTime.Today);
                }
                break;
            case Supplier supplier:
                supplier.TaxNumber = NullIfBlank(supplier.TaxNumber);
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
