using Microsoft.EntityFrameworkCore;
using Wscd.Domain.Quotations;
using Wscd.Services.Quotations;

namespace Wscd.Data.Quotations;

public sealed class QuotationStore(WscdDbContext db) : IQuotationStore
{
    public async Task<IReadOnlyList<QuotationSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed)
    {
        var query = db.Quotations.AsNoTracking();
        if (!string.IsNullOrEmpty(search))
        {
            var lowerSearch = search.ToLowerInvariant();
            query = query.Where(quotation => quotation.Customer.Name.ToLower().Contains(lowerSearch));
        }
        if (from is DateOnly start)
        {
            query = query.Where(quotation => quotation.Date >= start);
        }
        if (to is DateOnly end)
        {
            query = query.Where(quotation => quotation.Date <= end);
        }
        if (completed is bool isCompleted)
        {
            query = query.Where(quotation => quotation.IsCompleted == isCompleted);
        }

        return await query.OrderByDescending(quotation => quotation.Date).ThenByDescending(quotation => quotation.Id)
            .Select(quotation => new QuotationSummary(quotation.Id, quotation.Date, quotation.Customer.Name,
                quotation.Items.Sum(item => item.Total), quotation.IsCompleted, quotation.Sale != null))
            .ToListAsync();
    }

    public Task<Quotation?> FindAsync(int id) => db.Quotations.AsNoTracking()
        .Include(quotation => quotation.Customer)
        .Include(quotation => quotation.Seller)
        .Include(quotation => quotation.Sale)
        .Include(quotation => quotation.Items.OrderBy(item => item.Id))
        .SingleOrDefaultAsync(quotation => quotation.Id == id);

    public Task<bool> CreateAsync(Quotation quotation)
    {
        db.Quotations.Add(quotation);
        return SaveAsync(quotation);
    }

    public async Task<bool> UpdateAsync(int id, Func<Quotation, bool> change)
    {
        var quotation = await db.Quotations.Include(quotation => quotation.Items).Include(quotation => quotation.Sale)
            .SingleOrDefaultAsync(quotation => quotation.Id == id);
        return quotation is not null && change(quotation) && await SaveAsync(quotation);
    }

    private async Task<bool> SaveAsync(Quotation quotation)
    {
        // Even item-only changes must participate in the header's concurrency check.
        quotation.Revision = Guid.NewGuid();
        try
        {
            await db.SaveChangesAsync();
            return true;
        }
        catch (DbUpdateException exception) when (exception is DbUpdateConcurrencyException ||
            exception.InnerException is Npgsql.PostgresException { SqlState: Npgsql.PostgresErrorCodes.ForeignKeyViolation or Npgsql.PostgresErrorCodes.UniqueViolation })
        {
            db.ChangeTracker.Clear();
            return false;
        }
    }
}
