using Wscd.Domain.Catalogs;
using Wscd.Domain.Purchases;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;

namespace Wscd.Services.Purchases;

public sealed class PurchaseService(
    IPurchaseStore store,
    ICatalogService<Supplier> suppliers,
    ICatalogService<Product> products,
    ICurrentOrganization currentOrganization) : IPurchaseService
{
    public Task<IReadOnlyList<PurchaseSummary>> ListAsync(bool? completed, DateOnly? from, DateOnly? to, string? search) =>
        store.ListAsync(completed, from, to, search?.Trim());

    public Task<Purchase?> FindAsync(int id) => store.FindAsync(id);

    public async Task<PurchaseOperationResult> SaveDraftAsync(
        int id,
        int supplierId,
        DateOnly purchaseDate,
        DateOnly? dueDate,
        string? notes)
    {
        if (currentOrganization.OrganizationId is not Guid organizationId ||
            await suppliers.FindAsync(supplierId) is null || purchaseDate == default ||
            (dueDate is DateOnly due && due < purchaseDate))
        {
            return new PurchaseOperationResult(false, "InvalidPurchase");
        }

        var purchase = new Purchase
        {
            Id = id,
            OrganizationId = organizationId,
            SupplierId = supplierId,
            PurchaseDate = purchaseDate,
            DueDate = dueDate,
            Notes = NullIfBlank(notes)
        };

        return await store.SaveDraftAsync(purchase)
            ? new PurchaseOperationResult(true, PurchaseId: purchase.Id)
            : new PurchaseOperationResult(false, "PurchaseNotDraft");
    }

    public async Task<PurchaseOperationResult> AddItemAsync(int purchaseId, int productId, int quantity, decimal unitCost)
    {
        if (quantity <= 0 || unitCost < 0)
        {
            return new PurchaseOperationResult(false, "InvalidItem");
        }

        unitCost = decimal.Round(unitCost, 2, MidpointRounding.AwayFromZero);
        var purchase = await store.FindAsync(purchaseId);
        if (purchase is null || purchase.IsCompleted)
        {
            return new PurchaseOperationResult(false, "PurchaseNotDraft");
        }
        if (unitCost > 9_999_999_999.99m ||
            await products.FindAsync(productId) is null || purchase.Items.Any(item => item.ProductId == productId))
        {
            return new PurchaseOperationResult(false, "InvalidItem");
        }

        var item = new PurchaseItem { ProductId = productId, Quantity = quantity, UnitCost = unitCost };
        return await store.AddItemAsync(purchaseId, item, LineTotal(item))
            ? new PurchaseOperationResult(true)
            : new PurchaseOperationResult(false, "PurchaseNotDraft");
    }

    public async Task<PurchaseOperationResult> RemoveItemAsync(int purchaseId, int itemId)
    {
        var purchase = await store.FindAsync(purchaseId);
        var item = purchase?.Items.SingleOrDefault(line => line.Id == itemId);
        if (purchase is null || purchase.IsCompleted || item is null)
        {
            return new PurchaseOperationResult(false, "PurchaseNotDraft");
        }

        return await store.RemoveItemAsync(purchaseId, itemId, LineTotal(item))
            ? new PurchaseOperationResult(true)
            : new PurchaseOperationResult(false, "PurchaseNotDraft");
    }

    public async Task<PurchaseOperationResult> CompleteAsync(int id)
    {
        var purchase = await store.FindAsync(id);
        if (purchase is null || purchase.IsCompleted)
        {
            return new PurchaseOperationResult(false, "PurchaseNotDraft");
        }
        if (purchase.Items.Count == 0 || purchase.Total < 0 || purchase.DueDate is not DateOnly dueDate)
        {
            return new PurchaseOperationResult(false, "PurchaseIncomplete");
        }

        var receipts = new List<ProductReceipt>(purchase.Items.Count);
        foreach (var item in purchase.Items)
        {
            var product = await products.FindAsync(item.ProductId);
            if (product is null || item.Quantity <= 0 || item.UnitCost < 0)
            {
                return new PurchaseOperationResult(false, "InvalidItem");
            }

            var salePrice = decimal.Round(
                item.UnitCost + item.UnitCost * product.MarginPercent / 100,
                2,
                MidpointRounding.AwayFromZero);
            receipts.Add(new ProductReceipt(item.ProductId, item.Quantity, item.UnitCost, product.MarginPercent, salePrice));
        }

        return await store.CompleteAsync(id, dueDate, receipts)
            ? new PurchaseOperationResult(true)
            : new PurchaseOperationResult(false, "PurchaseNotDraft");
    }

    private static decimal LineTotal(PurchaseItem item) =>
        decimal.Round(item.Quantity * item.UnitCost, 2, MidpointRounding.AwayFromZero);

    private static string? NullIfBlank(string? value) =>
        string.IsNullOrWhiteSpace(value) ? null : value.Trim();
}
