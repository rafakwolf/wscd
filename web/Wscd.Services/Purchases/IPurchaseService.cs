using Wscd.Domain.Purchases;

namespace Wscd.Services.Purchases;

public interface IPurchaseService
{
    Task<IReadOnlyList<PurchaseSummary>> ListAsync(bool? completed, DateOnly? from, DateOnly? to, string? search);
    Task<Purchase?> FindAsync(int id);
    Task<PurchaseOperationResult> SaveDraftAsync(int id, int supplierId, DateOnly purchaseDate, DateOnly? dueDate, string? notes);
    Task<PurchaseOperationResult> AddItemAsync(int purchaseId, int productId, int quantity, decimal unitCost);
    Task<PurchaseOperationResult> RemoveItemAsync(int purchaseId, int itemId);
    Task<PurchaseOperationResult> CompleteAsync(int id);
    Task<PurchaseOperationResult> DeleteDraftAsync(int id);
}

public sealed record PurchaseSummary(int Id, DateOnly PurchaseDate, string SupplierName, decimal Total, bool IsCompleted);

public sealed record PurchaseOperationResult(bool Succeeded, string? ErrorCode = null, int? PurchaseId = null);
