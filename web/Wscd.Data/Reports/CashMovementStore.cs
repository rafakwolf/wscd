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
        var entries = await receipts.Select(payment => new
            {
                Payment = payment,
                CancelledAtUtc = payment.Receivable != null ? payment.Receivable.Sale!.CancelledAtUtc : payment.Sale!.CancelledAtUtc
            })
            .Select(entry => new
            {
                entry.Payment,
                ReversedAtUtc = entry.Payment.ReversedAtUtc ?? entry.CancelledAtUtc,
                IsSaleCancellation = entry.Payment.ReversedAtUtc == null && entry.CancelledAtUtc != null
            })
            .Where(entry =>
                ((fromUtc == null || entry.Payment.ReceivedAtUtc >= fromUtc) && (toUtcExclusive == null || entry.Payment.ReceivedAtUtc < toUtcExclusive)) ||
                (entry.ReversedAtUtc != null && (fromUtc == null || entry.ReversedAtUtc >= fromUtc) &&
                    (toUtcExclusive == null || entry.ReversedAtUtc < toUtcExclusive)))
            .OrderByDescending(entry => entry.Payment.Id)
            .Select(entry => new
            {
                Original = new CashMovement(entry.Payment.Receivable != null ? entry.Payment.Receivable.SaleId : entry.Payment.SaleId,
                    entry.Payment.ReceivedAtUtc, entry.Payment.CashAccount.Name,
                    entry.Payment.Receivable != null ? entry.Payment.Receivable.Customer.Name : entry.Payment.Sale!.Customer.Name,
                    entry.Payment.Method, entry.Payment.Amount, entry.Payment.AccountReceivableId, null),
                entry.ReversedAtUtc,
                entry.IsSaleCancellation
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
                payment.ReversedAtUtc,
                IsSaleCancellation = false
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
                movements.Add(item.Original with { OccurredAt = reversedAt, IsReversal = true, IsSaleCancellation = item.IsSaleCancellation });
            }
        }
        return movements;
    }
}
