using Microsoft.EntityFrameworkCore;
using Wscd.Services.Reports;

namespace Wscd.Data.Reports;

public sealed class CashReceiptStore(WscdDbContext db) : ICashReceiptStore
{
    public async Task<IReadOnlyList<CashReceipt>> ListAsync(int? cashAccountId, DateTimeOffset? fromUtc, DateTimeOffset? toUtcExclusive)
    {
        var query = db.Sales.AsNoTracking().Where(sale => sale.CompletedAtUtc != null && sale.Payment != null);
        if (cashAccountId is int accountId)
        {
            query = query.Where(sale => sale.Payment!.CashAccountId == accountId);
        }
        if (fromUtc is DateTimeOffset start)
        {
            query = query.Where(sale => sale.CompletedAtUtc >= start);
        }
        if (toUtcExclusive is DateTimeOffset end)
        {
            query = query.Where(sale => sale.CompletedAtUtc < end);
        }

        // shortcut: one query loads the filtered report; paginate if cash volume outgrows the period filter.
        return await query.OrderByDescending(sale => sale.CompletedAtUtc).ThenByDescending(sale => sale.Id)
            .Select(sale => new CashReceipt(sale.Id, sale.CompletedAtUtc!.Value, sale.Payment!.CashAccount.Name,
                sale.Customer.Name, sale.Payment.Amount))
            .ToListAsync();
    }
}
