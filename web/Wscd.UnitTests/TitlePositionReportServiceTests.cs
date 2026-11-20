using Wscd.Domain.Purchases;
using Wscd.Domain.Sales;
using Wscd.Services.Purchases;
using Wscd.Services.Reports;
using Wscd.Services.Sales;

namespace Wscd.UnitTests;

public sealed class TitlePositionReportServiceTests
{
    private static readonly DateOnly Today = new(2026, 11, 18);

    [Fact]
    public async Task PayablePositionUsesOutstandingBalancesForEachDueDateBucket()
    {
        var store = new Titles
        {
            Payables = [
                new(1, 10, "Fornecedor", null, Today.AddDays(-1), 80m, 20.30m),
                new(2, null, "Fornecedor", "Manual", Today, 35m, 35m),
                new(3, 11, "Fornecedor", null, Today.AddDays(1), 100m, 70.19m)
            ]
        };
        var from = Today.AddDays(-5);
        var to = Today.AddDays(10);
        var report = Assert.IsType<TitlePositionReport>(
            await Service(store).GetAsync(TitleSide.Payable, " Fornecedor ", from, to, false, Today));

        Assert.Equal((TitleSide.Payable, "Fornecedor", from, to, TitleStatus.Open, Today), store.Filter);
        Assert.Equal(Today, report.Today);
        Assert.Equal(20.30m, report.Overdue);
        Assert.Equal(35m, report.DueToday);
        Assert.Equal(70.19m, report.Upcoming);
        Assert.Equal(125.49m, report.TotalBalance);
        Assert.Equal(80m, report.Rows[0].Amount);
    }

    [Fact]
    public async Task ReceivablePositionRequestsOnlyOverdueTitlesAndExcludesCancelledSales()
    {
        var store = new Titles
        {
            Receivables = [
                new(1, 15, "Cliente", null, Today.AddDays(-1), 125m, 50m, false),
                new(2, 16, "Cliente", null, Today.AddDays(-1), 500m, 0m, true)
            ]
        };
        var service = Service(store);
        Assert.Null(await service.GetAsync(TitleSide.Receivable, null, Today, Today.AddDays(-1), false, Today));
        Assert.Null(store.Filter);

        var report = Assert.IsType<TitlePositionReport>(
            await service.GetAsync(TitleSide.Receivable, "Cliente", null, null, true, Today));

        Assert.Equal((TitleSide.Receivable, "Cliente", (DateOnly?)null, (DateOnly?)null, TitleStatus.Overdue, Today), store.Filter);
        Assert.Equal(15, Assert.Single(report.Rows).SourceId);
        Assert.Equal(50m, report.TotalBalance);
        Assert.Equal(0m, report.DueToday);
    }

    private static TitlePositionReportService Service(Titles store) =>
        new(new PayableService(store, null!, null!), new ReceivableService(store, null!, null!));

    private sealed class Titles : IPayableStore, IReceivableStore
    {
        public IReadOnlyList<PayableSummary> Payables { get; init; } = [];
        public IReadOnlyList<ReceivableSummary> Receivables { get; init; } = [];
        public (TitleSide Side, string? Party, DateOnly? From, DateOnly? To, TitleStatus? Status, DateOnly Today)? Filter { get; private set; }

        Task<IReadOnlyList<PayableSummary>> IPayableStore.ListAsync(string? supplier, DateOnly? from, DateOnly? to,
            TitleStatus? status, DateOnly today)
        {
            Filter = (TitleSide.Payable, supplier, from, to, status, today);
            return Task.FromResult(Payables);
        }

        Task<IReadOnlyList<ReceivableSummary>> IReceivableStore.ListAsync(string? customer, DateOnly? from, DateOnly? to,
            TitleStatus? status, DateOnly today)
        {
            Filter = (TitleSide.Receivable, customer, from, to, status, today);
            return Task.FromResult(Receivables);
        }

        Task<AccountPayable?> IPayableStore.FindAsync(int id) => throw new NotSupportedException();
        Task<AccountReceivable?> IReceivableStore.FindAsync(int id) => throw new NotSupportedException();
        public Task<bool> CreateAsync(AccountPayable account) => throw new NotSupportedException();
        public Task<bool> CreateAsync(AccountReceivable account) => throw new NotSupportedException();
        public Task<bool> UpdateManualAsync(AccountPayable account, Guid expectedRevision) => throw new NotSupportedException();
        Task<bool> IPayableStore.DeleteManualAsync(int id, Guid expectedRevision) => throw new NotSupportedException();
        public Task<bool> UpdateManualAsync(AccountReceivable account, Guid expectedRevision) => throw new NotSupportedException();
        Task<bool> IReceivableStore.DeleteManualAsync(int id, Guid expectedRevision) => throw new NotSupportedException();
        public Task<TitleSettlement> PayAsync(AccountPayable account, PayablePayment payment) => throw new NotSupportedException();
        public Task<TitleSettlement> ReceiveAsync(AccountReceivable account, SalePayment payment) => throw new NotSupportedException();
        public Task<TitleSettlement> ReverseAsync(AccountPayable account, PayablePayment payment, SettlementReversal reversal) => throw new NotSupportedException();
        public Task<TitleSettlement> ReverseAsync(AccountReceivable account, SalePayment payment, SettlementReversal reversal) => throw new NotSupportedException();
    }
}
