using Wscd.Domain.Catalogs;
using Wscd.Domain.Quotations;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;
using Wscd.Services.Organizations;

namespace Wscd.Services.Quotations;

public sealed class QuotationService(
    IQuotationStore store,
    ICatalogService<Customer> customers,
    ICatalogService<Seller> sellers,
    ICatalogService<Product> products,
    IPromotionStore promotions,
    ICurrentOrganization currentOrganization)
{
    public Task<IReadOnlyList<QuotationSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed) =>
        store.ListAsync(search?.Trim(), from, to, completed);

    public Task<Quotation?> FindAsync(int id) => store.FindAsync(id);

    public async Task<int?> SaveAsync(int id, int customerId, int sellerId, DateOnly date, string? notes)
    {
        if (currentOrganization.OrganizationId is not Guid organizationId || id < 0 || date == default ||
            await customers.FindAsync(customerId) is null || await sellers.FindAsync(sellerId) is not { IsActive: true })
        {
            return null;
        }

        bool SetHeader(Quotation quotation)
        {
            if (quotation.IsCompleted)
            {
                return false;
            }

            quotation.CustomerId = customerId;
            quotation.SellerId = sellerId;
            quotation.Date = date;
            quotation.Notes = string.IsNullOrWhiteSpace(notes) ? null : notes.Trim();
            return true;
        }

        if (id != 0)
        {
            return await store.UpdateAsync(id, SetHeader) ? id : null;
        }

        var draft = new Quotation { OrganizationId = organizationId };
        SetHeader(draft);
        return await store.CreateAsync(draft) ? draft.Id : null;
    }

    public async Task<bool> AddItemAsync(int id, int productId, int quantity, decimal discountPercent)
    {
        if (!ItemPricing.IsValid(quantity, discountPercent) || await products.FindAsync(productId) is not { } product)
        {
            return false;
        }

        var promotion = await promotions.FindByProductAsync(productId);
        return await store.UpdateAsync(id, quotation =>
        {
            if (quotation.IsCompleted || quotation.Items.Any(item => item.ProductId == productId))
            {
                return false;
            }

            if (ItemPricing.Calculate(product, promotion, quotation.Date, quantity, discountPercent) is not { } pricing)
            {
                return false;
            }

            quotation.Items.Add(new QuotationItem
            {
                OrganizationId = quotation.OrganizationId,
                ProductId = product.Id,
                ProductName = product.Name,
                Quantity = quantity,
                UnitPrice = pricing.Price,
                DiscountPercent = pricing.Discount,
                Total = pricing.Total
            });
            return true;
        });
    }

    public Task<bool> RemoveItemAsync(int id, int itemId) => store.UpdateAsync(id, quotation =>
        !quotation.IsCompleted && quotation.Items.SingleOrDefault(item => item.Id == itemId) is { } item &&
        quotation.Items.Remove(item));

    public Task<bool> SetCompletedAsync(int id, bool completed) => store.UpdateAsync(id, quotation =>
    {
        if (quotation.Sale is not null || quotation.IsCompleted == completed || (completed && quotation.Items.Count == 0))
        {
            return false;
        }

        quotation.IsCompleted = completed;
        return true;
    });
}
