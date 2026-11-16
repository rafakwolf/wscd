using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Data.Catalogs;

public sealed class CatalogStore<TEntity>(WscdDbContext db) : ICatalogStore<TEntity>
    where TEntity : class, ICatalogEntity
{
    public async Task<IReadOnlyList<TEntity>> ListAsync(string? search)
    {
        var query = db.Set<TEntity>().AsNoTracking();
        if (!string.IsNullOrWhiteSpace(search))
        {
            query = query.Where(SearchByName(search));
        }

        var items = await query.ToListAsync();
        return items.OrderBy(item => item.Name).ToArray();
    }

    public Task<TEntity?> FindAsync(int id) =>
        db.Set<TEntity>().SingleOrDefaultAsync(EqualsId(id));

    public async Task<bool> SaveAsync(TEntity entity)
    {
        if (entity.Id == 0)
        {
            db.Add(entity);
        }
        else
        {
            var existing = await FindAsync(entity.Id);
            if (existing is null)
            {
                return false;
            }

            db.Entry(existing).CurrentValues.SetValues(entity);
        }

        try
        {
            await db.SaveChangesAsync();
            return true;
        }
        catch (DbUpdateException)
        {
            db.ChangeTracker.Clear();
            return false;
        }
    }

    public async Task<bool> DeleteAsync(int id)
    {
        var entity = await FindAsync(id);
        if (entity is null)
        {
            return false;
        }

        db.Remove(entity);
        try
        {
            await db.SaveChangesAsync();
            return true;
        }
        catch (DbUpdateException)
        {
            db.ChangeTracker.Clear();
            return false;
        }
    }

    private static Expression<Func<TEntity, bool>> SearchByName(string value)
    {
        var entity = Expression.Parameter(typeof(TEntity), "entity");
        var name = Expression.Property(entity, typeof(TEntity).GetProperty(nameof(ICatalogEntity.Name))!);
        var contains = typeof(string).GetMethod(nameof(string.Contains), [typeof(string)])!;
        var body = Expression.Call(name, contains, Expression.Constant(value));
        return Expression.Lambda<Func<TEntity, bool>>(body, entity);
    }

    private static Expression<Func<TEntity, bool>> EqualsId(int id)
    {
        var entity = Expression.Parameter(typeof(TEntity), "entity");
        var property = Expression.Property(entity, typeof(TEntity).GetProperty(nameof(ICatalogEntity.Id))!);
        var body = Expression.Equal(property, Expression.Constant(id));
        return Expression.Lambda<Func<TEntity, bool>>(body, entity);
    }
}
