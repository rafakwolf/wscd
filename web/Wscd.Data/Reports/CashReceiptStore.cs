using Microsoft.EntityFrameworkCore;
using Wscd.Services.Reports;

namespace Wscd.Data.Reports;

public sealed class CashReceiptStore(WscdDbContext db) : ICashReceiptStore
{
    public async Task<IReadOnlyList<CashReceipt>> ListAsync(int? cashAccountId, DateTimeOffset? fromUtc, DateTimeOffset? toUtcExclusive)
    {
        var query = db.SalePayments.AsNoTracking().Where(payment => payment.Sale.CompletedAtUtc != null);
        if (cashAccountId is int accountId)
        {
            query = query.Where(payment => payment.CashAccountId == accountId);
        }
        if (fromUtc is DateTimeOffset start)
        {
            query = query.Where(payment => payment.Sale.CompletedAtUtc >= start);
        }
        if (toUtcExclusive is DateTimeOffset end)
        {
            query = query.Where(payment => payment.Sale.CompletedAtUtc < end);
        }

        // shortcut: one query loads the filtered report; paginate if cash volume outgrows the period filter.
        return await query.OrderByDescending(payment => payment.Sale.CompletedAtUtc).ThenByDescending(payment => payment.Id)
            .Select(payment => new CashReceipt(payment.SaleId, payment.Sale.CompletedAtUtc!.Value, payment.CashAccount.Name,
                payment.Sale.Customer.Name, payment.Method, payment.Amount))
            .ToListAsync();
    }
}
