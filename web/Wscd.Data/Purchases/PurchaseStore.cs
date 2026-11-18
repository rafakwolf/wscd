using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Purchases;
using Wscd.Services.Purchases;

namespace Wscd.Data.Purchases;

public sealed class PurchaseStore(WscdDbContext db) : IPurchaseStore
{
    public async Task<IReadOnlyList<PurchaseSummary>> ListAsync(
        bool? completed,
        DateOnly? from,
        DateOnly? to,
        string? search)
    {
        var query = db.Purchases.AsNoTracking();
        if (completed is bool isCompleted)
        {
            query = query.Where(purchase => purchase.IsCompleted == isCompleted);
        }
        if (from is DateOnly start)
        {
            query = query.Where(purchase => purchase.PurchaseDate >= start);
        }
        if (to is DateOnly end)
        {
            query = query.Where(purchase => purchase.PurchaseDate <= end);
        }
        if (!string.IsNullOrWhiteSpace(search))
        {
            query = query.Where(purchase => purchase.Supplier.Name.Contains(search));
        }

        return await query
            .OrderByDescending(purchase => purchase.PurchaseDate)
            .ThenByDescending(purchase => purchase.Id)
            .Select(purchase => new PurchaseSummary(
                purchase.Id,
                purchase.PurchaseDate,
                purchase.Supplier.Name,
                purchase.Total,
                purchase.IsCompleted))
            .ToListAsync();
    }

    public Task<Purchase?> FindAsync(int id) =>
        db.Purchases.AsNoTracking()
            .Include(purchase => purchase.Supplier)
            .Include(purchase => purchase.Items)
                .ThenInclude(item => item.Product)
            .SingleOrDefaultAsync(purchase => purchase.Id == id);

    public async Task<bool> SaveDraftAsync(Purchase purchase)
    {
        try
        {
            if (purchase.Id == 0)
            {
                db.Purchases.Add(purchase);
            }
            else
            {
                var updated = await db.Purchases
                    .Where(item => item.Id == purchase.Id && !item.IsCompleted)
                    .ExecuteUpdateAsync(update => update
                        .SetProperty(item => item.SupplierId, purchase.SupplierId)
                        .SetProperty(item => item.PurchaseDate, purchase.PurchaseDate)
                        .SetProperty(item => item.DueDate, purchase.DueDate)
                        .SetProperty(item => item.Notes, purchase.Notes));
                return updated == 1;
            }

            await db.SaveChangesAsync();
            return true;
        }
        catch (DbUpdateException)
        {
            db.ChangeTracker.Clear();
            return false;
        }
    }

    public async Task<bool> AddItemAsync(int purchaseId, PurchaseItem item, decimal lineTotal)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            var purchase = await db.Purchases
                .Where(purchase => purchase.Id == purchaseId && !purchase.IsCompleted)
                .Select(purchase => new { purchase.Id, purchase.OrganizationId })
                .SingleOrDefaultAsync();
            if (purchase is null)
            {
                return false;
            }

            var updated = await db.Purchases
                .Where(purchase => purchase.Id == purchaseId && !purchase.IsCompleted)
                .ExecuteUpdateAsync(update => update.SetProperty(purchase => purchase.Total, purchase => purchase.Total + lineTotal));
            if (updated != 1)
            {
                await transaction.RollbackAsync();
                return false;
            }

            item.OrganizationId = purchase.OrganizationId;
            item.PurchaseId = purchase.Id;
            db.PurchaseItems.Add(item);
            await db.SaveChangesAsync();

            await transaction.CommitAsync();
            return true;
        }
        catch (DbUpdateException)
        {
            await transaction.RollbackAsync();
            db.ChangeTracker.Clear();
            return false;
        }
    }

    public async Task<bool> RemoveItemAsync(int purchaseId, int itemId, decimal lineTotal)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            var deleted = await db.PurchaseItems
                .Where(item => item.Id == itemId && item.PurchaseId == purchaseId)
                .ExecuteDeleteAsync();
            if (deleted != 1)
            {
                return false;
            }

            var updated = await db.Purchases
                .Where(purchase => purchase.Id == purchaseId && !purchase.IsCompleted)
                .ExecuteUpdateAsync(update => update.SetProperty(purchase => purchase.Total, purchase => purchase.Total - lineTotal));
            if (updated != 1)
            {
                await transaction.RollbackAsync();
                return false;
            }

            await transaction.CommitAsync();
            return true;
        }
        catch (DbUpdateException)
        {
            await transaction.RollbackAsync();
            db.ChangeTracker.Clear();
            return false;
        }
    }

    public async Task<bool> CompleteAsync(int id, DateOnly dueDate, IReadOnlyList<ProductReceipt> receipts)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            var receivedDate = DateOnly.FromDateTime(DateTime.Today);
            var completed = await db.Purchases
                .Where(item => item.Id == id && !item.IsCompleted && item.DueDate == dueDate)
                .ExecuteUpdateAsync(update => update
                    .SetProperty(item => item.IsCompleted, true)
                    .SetProperty(item => item.CompletedDate, receivedDate));
            if (completed != 1)
            {
                return false;
            }

            var purchase = await db.Purchases.AsNoTracking()
                .Include(item => item.Items)
                .SingleAsync(item => item.Id == id);
            if (purchase.Items.Count == 0 || purchase.Total < 0 || !ReceiptsMatch(purchase.Items, receipts))
            {
                await transaction.RollbackAsync();
                return false;
            }

            foreach (var receipt in receipts)
            {
                var updated = await db.Products
                    .Where(product => product.Id == receipt.ProductId && product.MarginPercent == receipt.MarginPercent)
                    .ExecuteUpdateAsync(update => update
                        .SetProperty(product => product.Stock, product => product.Stock + receipt.Quantity)
                        .SetProperty(product => product.Cost, receipt.UnitCost)
                        .SetProperty(product => product.SalePrice, receipt.SalePrice)
                        .SetProperty(product => product.SupplierId, purchase.SupplierId)
                        .SetProperty(product => product.QuantityReceived, receipt.Quantity)
                        .SetProperty(product => product.ReceivedDate, receivedDate));
                if (updated != 1)
                {
                    await transaction.RollbackAsync();
                    db.ChangeTracker.Clear();
                    return false;
                }
            }

            db.AccountsPayable.Add(new AccountPayable
            {
                OrganizationId = purchase.OrganizationId,
                PurchaseId = purchase.Id,
                SupplierId = purchase.SupplierId,
                CreatedDate = receivedDate,
                DueDate = dueDate,
                Amount = purchase.Total,
                Balance = purchase.Total
            });

            await db.SaveChangesAsync();
            await transaction.CommitAsync();
            return true;
        }
        catch (DbUpdateException)
        {
            await transaction.RollbackAsync();
            db.ChangeTracker.Clear();
            return false;
        }
    }

    private static bool ReceiptsMatch(IReadOnlyList<PurchaseItem> items, IReadOnlyList<ProductReceipt> receipts) =>
        items.Count == receipts.Count && items.All(item => receipts.Any(receipt =>
            receipt.ProductId == item.ProductId && receipt.Quantity == item.Quantity && receipt.UnitCost == item.UnitCost));
}
