using Wscd.Domain.Catalogs;

namespace Wscd.Services.Catalogs;

public interface ICatalogStore<TEntity> where TEntity : class, ICatalogEntity
{
    Task<IReadOnlyList<TEntity>> ListAsync(string? search);
    Task<TEntity?> FindAsync(int id);
    Task<bool> SaveAsync(TEntity entity);
    Task<bool> DeleteAsync(int id);
}
