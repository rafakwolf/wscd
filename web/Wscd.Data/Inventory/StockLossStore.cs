using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Inventory;
using Wscd.Services.Inventory;

namespace Wscd.Data.Inventory;

public sealed class StockLossStore(WscdDbContext db) : IStockLossStore
{
    public async Task<IReadOnlyList<StockLossSummary>> ListAsync(DateOnly? from, DateOnly? to)
    {
        var query = db.StockLosses.AsNoTracking();
        if (from is DateOnly start)
        {
            query = query.Where(loss => loss.LossDate >= start);
        }
        if (to is DateOnly end)
        {
            query = query.Where(loss => loss.LossDate <= end);
        }

        return await query
            .OrderByDescending(loss => loss.LossDate)
            .ThenByDescending(loss => loss.Id)
            .Select(loss => new StockLossSummary(
                loss.Id,
                loss.LossDate,
                loss.Product.Name,
                loss.Quantity,
                loss.UnitCost,
                loss.Reason,
                loss.Notes))
            .ToListAsync();
    }

    public async Task<bool> CreateAsync(StockLoss loss)
    {
        if (db.CurrentOrganizationId is not Guid organizationId)
        {
            return false;
        }

        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            var updated = await db.Products
                .Where(product => product.Id == loss.ProductId &&
                    product.Stock >= loss.Quantity &&
                    product.Cost == loss.UnitCost)
                .ExecuteUpdateAsync(update => update
                    .SetProperty(product => product.Stock, product => product.Stock - loss.Quantity));
            if (updated != 1)
            {
                return false;
            }

            loss.OrganizationId = organizationId;
            db.StockLosses.Add(loss);
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
}
