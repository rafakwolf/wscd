using Wscd.Services.Purchases;
using Wscd.Services.Sales;

namespace Wscd.Services.Reports;

public sealed class TitlePositionReportService(PayableService payables, ReceivableService receivables)
{
    public async Task<TitlePositionReport?> GetAsync(TitlePositionSide side, string? party, DateOnly? from,
        DateOnly? to, bool onlyOverdue, DateOnly today)
    {
        if (from > to)
        {
            return null;
        }

        var status = onlyOverdue ? TitleStatus.Overdue : TitleStatus.Open;
        var rows = side switch
        {
            TitlePositionSide.Payable => (await payables.ListAsync(party, from, to, status, today))
                .Select(account => new TitlePositionRow(account.Id, account.SupplierName, account.PurchaseId,
                    account.Description, account.DueDate, account.Amount, account.Balance)),
            TitlePositionSide.Receivable => (await receivables.ListAsync(party, from, to, status, today))
                .Where(account => !account.IsCancelled)
                .Select(account => new TitlePositionRow(account.Id, account.CustomerName, account.SaleId,
                    account.Description, account.DueDate, account.Amount, account.Balance)),
            _ => throw new ArgumentOutOfRangeException(nameof(side))
        };

        return new TitlePositionReport(today, rows.ToArray());
    }
}

public enum TitlePositionSide { Payable, Receivable }

public sealed record TitlePositionRow(int Id, string PartyName, int? SourceId, string? Description,
    DateOnly DueDate, decimal Amount, decimal Balance);

public sealed record TitlePositionReport(DateOnly Today, IReadOnlyList<TitlePositionRow> Rows)
{
    public decimal Overdue => Rows.Where(row => row.DueDate < Today).Sum(row => row.Balance);
    public decimal DueToday => Rows.Where(row => row.DueDate == Today).Sum(row => row.Balance);
    public decimal Upcoming => Rows.Where(row => row.DueDate > Today).Sum(row => row.Balance);
    public decimal TotalBalance => Rows.Sum(row => row.Balance);
}
