using Wscd.Domain.Catalogs;
using Wscd.Domain.Inventory;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;

namespace Wscd.Services.Inventory;

public sealed class StockLossService(
    IStockLossStore store,
    ICatalogService<Product> products,
    ICurrentOrganization currentOrganization) : IStockLossService
{
    private static readonly HashSet<string> Reasons = new(StringComparer.Ordinal) { "D", "V", "F", "P", "O" };

    public Task<IReadOnlyList<StockLossSummary>> ListAsync(DateOnly? from, DateOnly? to) => store.ListAsync(from, to);

    public async Task<StockLossResult> CreateAsync(
        int productId,
        int quantity,
        DateOnly lossDate,
        string? reason,
        string? notes)
    {
        if (currentOrganization.OrganizationId is null || productId <= 0 || quantity <= 0 ||
            lossDate == default || !Reasons.Contains(reason ?? string.Empty))
        {
            return new StockLossResult(false, "InvalidLoss");
        }

        var product = await products.FindAsync(productId);
        if (product is null)
        {
            return new StockLossResult(false, "ProductNotFound");
        }
        if (product.Cost < 0)
        {
            return new StockLossResult(false, "InvalidLoss");
        }
        if (product.Stock < quantity)
        {
            return new StockLossResult(false, "InsufficientStock");
        }

        var loss = new StockLoss
        {
            ProductId = productId,
            Quantity = quantity,
            UnitCost = product.Cost,
            LossDate = lossDate,
            Reason = reason!,
            Notes = string.IsNullOrWhiteSpace(notes) ? null : notes.Trim()
        };

        return await store.CreateAsync(loss)
            ? new StockLossResult(true)
            : new StockLossResult(false, "StockChanged");
    }
}
