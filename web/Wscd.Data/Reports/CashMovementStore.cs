using Microsoft.EntityFrameworkCore;
using Wscd.Services.Reports;

namespace Wscd.Data.Reports;

public sealed class CashMovementStore(WscdDbContext db) : ICashMovementStore
{
    public async Task<IReadOnlyList<CashMovement>> ListAsync(int? cashAccountId, DateTimeOffset? fromUtc, DateTimeOffset? toUtcExclusive,
        TitleSide? side = null, string? party = null)
    {
        var receipts = db.SalePayments.AsNoTracking().Where(payment => payment.Receivable != null || payment.Sale!.CompletedAtUtc != null);
        var expenses = db.PayablePayments.AsNoTracking();
        if (side == TitleSide.Receivable)
        {
            receipts = receipts.Where(payment => payment.AccountReceivableId != null);
            if (party is not null)
            {
                var search = party.ToLowerInvariant();
                receipts = receipts.Where(payment => payment.Receivable!.Customer.Name.ToLower().Contains(search));
            }
        }
        else if (side == TitleSide.Payable && party is not null)
        {
            var search = party.ToLowerInvariant();
            expenses = expenses.Where(payment => payment.Payable.Supplier.Name.ToLower().Contains(search));
        }
        if (cashAccountId is int accountId)
        {
            receipts = receipts.Where(payment => payment.CashAccountId == accountId);
            expenses = expenses.Where(payment => payment.CashAccountId == accountId);
        }
        // shortcut: load both filtered streams; page them together if volume outgrows the period filter.
        var entries = side == TitleSide.Payable ? [] : await receipts.Select(payment => new
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
        var exits = side == TitleSide.Receivable ? [] : await expenses.Where(payment =>
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
        if (side is not null)
        {
            return movements;
        }
        var refunds = await db.SaleReturns.AsNoTracking().Where(item => item.RefundAmount > 0
                && (cashAccountId == null || item.CashAccountId == cashAccountId)
                && (fromUtc == null || item.ReturnedAtUtc >= fromUtc)
                && (toUtcExclusive == null || item.ReturnedAtUtc < toUtcExclusive))
            .OrderByDescending(item => item.Id)
            .Select(item => new CashMovement(item.SaleId, item.ReturnedAtUtc, item.CashAccount!.Name, item.Sale.Customer.Name,
                item.RefundMethod!.Value, item.RefundAmount, null, null) { IsSaleReturn = true })
            .ToListAsync();
        movements.AddRange(refunds);
        return movements;
    }
}
