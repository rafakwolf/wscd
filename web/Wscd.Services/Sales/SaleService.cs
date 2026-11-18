using Wscd.Domain.Catalogs;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;
using Wscd.Services.Organizations;
using Wscd.Services.Quotations;

namespace Wscd.Services.Sales;

public sealed class SaleService(
    ISaleStore store,
    IQuotationStore quotations,
    ICatalogService<Customer> customers,
    ICatalogService<Seller> sellers,
    ICatalogService<Product> products,
    IPromotionStore promotions,
    ICurrentOrganization currentOrganization)
{
    public Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed) =>
        store.ListAsync(search?.Trim(), from, to, completed);

    public Task<Sale?> FindAsync(int id) => store.FindAsync(id);

    public async Task<int?> SaveAsync(int id, int customerId, int sellerId, DateOnly date, string? notes)
    {
        if (currentOrganization.OrganizationId is not Guid organizationId || id < 0 || date == default ||
            await customers.FindAsync(customerId) is null || await sellers.FindAsync(sellerId) is not { IsActive: true })
        {
            return null;
        }

        bool SetHeader(Sale sale)
        {
            if (!CanChange(sale))
            {
                return false;
            }

            sale.CustomerId = customerId;
            sale.SellerId = sellerId;
            sale.Date = date;
            sale.Notes = string.IsNullOrWhiteSpace(notes) ? null : notes.Trim();
            return true;
        }

        if (id != 0)
        {
            return await store.UpdateAsync(id, SetHeader) ? id : null;
        }

        var draft = new Sale { OrganizationId = organizationId };
        SetHeader(draft);
        return await store.CreateAsync(draft) ? draft.Id : null;
    }

    public async Task<int?> ConvertQuotationAsync(int quotationId, DateOnly date)
    {
        var quotation = await quotations.FindAsync(quotationId);
        if (quotation is not { IsCompleted: true, Items.Count: > 0 } || date == default)
        {
            return null;
        }
        if (quotation.Sale is { } existing)
        {
            return existing.Id;
        }

        var sale = new Sale
        {
            OrganizationId = quotation.OrganizationId,
            CustomerId = quotation.CustomerId,
            SellerId = quotation.SellerId,
            QuotationId = quotation.Id,
            Notes = quotation.Notes,
            Date = date
        };
        sale.Items.AddRange(quotation.Items.Select(item => new SaleItem
        {
            OrganizationId = quotation.OrganizationId,
            ProductId = item.ProductId,
            ProductName = item.ProductName,
            Quantity = item.Quantity,
            UnitPrice = item.UnitPrice,
            DiscountPercent = item.DiscountPercent,
            Total = item.Total
        }));

        return await store.CreateAsync(sale, quotation.Revision)
            ? sale.Id
            : (await quotations.FindAsync(quotationId))?.Sale?.Id;
    }

    public async Task<bool> AddItemAsync(int id, int productId, int quantity, decimal discountPercent)
    {
        if (!ItemPricing.IsValid(quantity, discountPercent) || await products.FindAsync(productId) is not { } product)
        {
            return false;
        }

        var promotion = await promotions.FindByProductAsync(productId);
        return await store.UpdateAsync(id, sale =>
        {
            if (!CanChange(sale) || sale.Items.Any(item => item.ProductId == productId) ||
                ItemPricing.Calculate(product, promotion, sale.Date, quantity, discountPercent) is not { } pricing)
            {
                return false;
            }

            sale.Items.Add(new SaleItem
            {
                OrganizationId = sale.OrganizationId,
                ProductId = productId,
                ProductName = product.Name,
                Quantity = quantity,
                UnitPrice = pricing.Price,
                DiscountPercent = pricing.Discount,
                Total = pricing.Total
            });
            return true;
        });
    }

    public Task<bool> RemoveItemAsync(int id, int itemId) => store.UpdateAsync(id, sale =>
        CanChange(sale) && sale.Items.SingleOrDefault(item => item.Id == itemId) is { } item && sale.Items.Remove(item));

    public async Task<SaleCheckout> CheckoutAsync(int id, int cashAccountId, Guid expectedRevision)
    {
        if (await store.FindAsync(id) is not { IsCompleted: false, Items.Count: > 0 } sale ||
            sale.Total is <= 0 or > 999_999_999_999.99m)
        {
            return SaleCheckout.InvalidSale;
        }
        if (sale.Revision != expectedRevision)
        {
            return SaleCheckout.Conflict;
        }

        var payment = new SalePayment
        {
            OrganizationId = sale.OrganizationId,
            SaleId = sale.Id,
            CashAccountId = cashAccountId,
            Amount = sale.Total
        };
        return await store.CheckoutAsync(sale, payment, DateTimeOffset.UtcNow);
    }

    private static bool CanChange(Sale sale) => !sale.IsCompleted && sale.QuotationId is null;
}
