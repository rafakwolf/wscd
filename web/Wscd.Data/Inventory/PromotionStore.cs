using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Inventory;
using Wscd.Services;
using Wscd.Services.Inventory;

namespace Wscd.Data.Inventory;

public sealed class PromotionStore(WscdDbContext db) : IPromotionStore
{
    public async Task<IReadOnlyList<PromotionSummary>> ListAsync() => await db.Promotions
        .AsNoTracking()
        .OrderBy(promotion => promotion.EndDate)
        .ThenBy(promotion => promotion.Id)
        .Select(promotion => new PromotionSummary(
            promotion.Id,
            promotion.Product.Name,
            promotion.RegularPrice,
            promotion.DiscountPercent,
            promotion.PromotionPrice,
            promotion.StartDate,
            promotion.EndDate))
        .ToListAsync();

    public Task<Promotion?> FindAsync(int id) => db.Promotions.AsNoTracking()
        .Include(promotion => promotion.Product)
        .SingleOrDefaultAsync(promotion => promotion.Id == id);

    public Task<Promotion?> FindByProductAsync(int productId) => db.Promotions.AsNoTracking()
        .SingleOrDefaultAsync(promotion => promotion.ProductId == productId);

    public async Task<bool> SaveAsync(Promotion promotion)
    {
        if (db.CurrentOrganizationId is not Guid organizationId)
        {
            return false;
        }

        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            var today = BrasiliaClock.Today;
            decimal? activePrice = promotion.StartDate <= today && promotion.EndDate >= today
                ? promotion.PromotionPrice
                : null;
            var updated = await db.Products
                .Where(product => product.Id == promotion.ProductId && product.SalePrice == promotion.RegularPrice)
                .ExecuteUpdateAsync(update => update
                    .SetProperty(product => product.PromotionPrice, activePrice));
            if (updated != 1)
            {
                return false;
            }

            if (promotion.Id == 0)
            {
                promotion.OrganizationId = organizationId;
                db.Promotions.Add(promotion);
            }
            else
            {
                var existing = await db.Promotions
                    .SingleOrDefaultAsync(item => item.Id == promotion.Id && item.ProductId == promotion.ProductId);
                if (existing is null)
                {
                    await transaction.RollbackAsync();
                    return false;
                }

                existing.RegularPrice = promotion.RegularPrice;
                existing.DiscountPercent = promotion.DiscountPercent;
                existing.PromotionPrice = promotion.PromotionPrice;
                existing.StartDate = promotion.StartDate;
                existing.EndDate = promotion.EndDate;
            }

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

    public async Task<bool> DeleteAsync(int id)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            var promotion = await db.Promotions.SingleOrDefaultAsync(item => item.Id == id);
            if (promotion is null)
            {
                return false;
            }

            await db.Products
                .Where(product => product.Id == promotion.ProductId)
                .ExecuteUpdateAsync(update => update.SetProperty(product => product.PromotionPrice, (decimal?)null));
            db.Promotions.Remove(promotion);
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
