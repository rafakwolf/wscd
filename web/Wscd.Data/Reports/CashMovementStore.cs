using Microsoft.EntityFrameworkCore;
using Wscd.Services.Reports;

namespace Wscd.Data.Reports;

public sealed class CashMovementStore(WscdDbContext db) : ICashMovementStore
{
    public async Task<IReadOnlyList<CashMovement>> ListAsync(int? cashAccountId, DateTimeOffset? fromUtc, DateTimeOffset? toUtcExclusive)
    {
        var receipts = db.SalePayments.AsNoTracking().Where(payment => payment.Receivable != null || payment.Sale!.CompletedAtUtc != null);
        var expenses = db.PayablePayments.AsNoTracking();
        if (cashAccountId is int accountId)
        {
            receipts = receipts.Where(payment => payment.CashAccountId == accountId);
            expenses = expenses.Where(payment => payment.CashAccountId == accountId);
        }
        // shortcut: load both filtered streams; page them together if volume outgrows the period filter.
        var entries = await receipts.Where(payment =>
                ((fromUtc == null || payment.ReceivedAtUtc >= fromUtc) && (toUtcExclusive == null || payment.ReceivedAtUtc < toUtcExclusive)) ||
                (payment.ReversedAtUtc != null && (fromUtc == null || payment.ReversedAtUtc >= fromUtc) &&
                    (toUtcExclusive == null || payment.ReversedAtUtc < toUtcExclusive)))
            .OrderByDescending(payment => payment.Id)
            .Select(payment => new
            {
                Original = new CashMovement(payment.Receivable != null ? payment.Receivable.SaleId : payment.SaleId,
                    payment.ReceivedAtUtc, payment.CashAccount.Name,
                    payment.Receivable != null ? payment.Receivable.Customer.Name : payment.Sale!.Customer.Name,
                    payment.Method, payment.Amount, payment.AccountReceivableId, null),
                payment.ReversedAtUtc
            })
            .ToListAsync();
        var exits = await expenses.Where(payment =>
                ((fromUtc == null || payment.PaidAtUtc >= fromUtc) && (toUtcExclusive == null || payment.PaidAtUtc < toUtcExclusive)) ||
                (payment.ReversedAtUtc != null && (fromUtc == null || payment.ReversedAtUtc >= fromUtc) &&
                    (toUtcExclusive == null || payment.ReversedAtUtc < toUtcExclusive)))
            .OrderByDescending(payment => payment.Id)
            .Select(payment => new
            {
                Original = new CashMovement(null, payment.PaidAtUtc, payment.CashAccount.Name,
                    payment.Payable.Supplier.Name, payment.Method, payment.Amount, null, payment.AccountPayableId),
                payment.ReversedAtUtc
            })
            .ToListAsync();

        bool InPeriod(DateTimeOffset time) => (fromUtc is null || time >= fromUtc) && (toUtcExclusive is null || time < toUtcExclusive);
        var movements = new List<CashMovement>();
        foreach (var item in entries.Concat(exits))
        {
            if (InPeriod(item.Original.OccurredAt))
            {
                movements.Add(item.Original);
            }
            if (item.ReversedAtUtc is DateTimeOffset reversedAt && InPeriod(reversedAt))
            {
                movements.Add(item.Original with { OccurredAt = reversedAt, IsReversal = true });
            }
        }
        return movements;
    }
}
