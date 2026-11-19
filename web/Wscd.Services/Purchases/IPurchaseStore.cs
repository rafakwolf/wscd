using Wscd.Domain.Purchases;

namespace Wscd.Services.Purchases;

public interface IPurchaseStore
{
    Task<IReadOnlyList<PurchaseSummary>> ListAsync(bool? completed, DateOnly? from, DateOnly? to, string? search);
    Task<Purchase?> FindAsync(int id);
    Task<bool> SaveDraftAsync(Purchase purchase);
    Task<bool> AddItemAsync(int purchaseId, PurchaseItem item, decimal lineTotal);
    Task<bool> RemoveItemAsync(int purchaseId, int itemId, decimal lineTotal);
    Task<bool> CompleteAsync(int id, DateOnly dueDate, DateOnly receivedDate, IReadOnlyList<ProductReceipt> receipts);
    Task<bool> DeleteDraftAsync(int id);
}

public sealed record ProductReceipt(int ProductId, int Quantity, decimal UnitCost, decimal MarginPercent, decimal SalePrice);
