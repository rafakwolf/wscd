using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.UnitTests;

public sealed class ReceivableServiceTests
{
    [Fact]
    public async Task ReceiptValidatesTheCurrentBalanceAndLinksToTheOriginalSale()
    {
        var account = new AccountReceivable { Id = 1, SaleId = 3, OrganizationId = Guid.NewGuid(), Amount = 20m, Balance = 15.20m };
        var store = new Store(account);
        var service = new ReceivableService(store);
        var payment = new SalePaymentInput { Method = PaymentMethod.Pix, CashAccountId = 7, Amount = 15.21m };

        Assert.Equal(ReceivableSettlement.InvalidPayment, await service.ReceiveAsync(account.Id, payment, 15.20m));
        payment.Amount = 5.201m;
        Assert.Equal(ReceivableSettlement.InvalidPayment, await service.ReceiveAsync(account.Id, payment, 15.20m));
        payment.Amount = 5.20m;
        Assert.Equal(ReceivableSettlement.Conflict, await service.ReceiveAsync(account.Id, payment, 20m));
        Assert.Null(store.Payment);

        Assert.Equal(ReceivableSettlement.Received, await service.ReceiveAsync(account.Id, payment, 15.20m));
        var receipt = Assert.IsType<SalePayment>(store.Payment);
        Assert.Equal((account.OrganizationId, account.SaleId, account.Id, PaymentMethod.Pix, 7, 5.20m),
            (receipt.OrganizationId, receipt.SaleId, receipt.AccountReceivableId!.Value, receipt.Method, receipt.CashAccountId, receipt.Amount));
        Assert.Equal(TimeSpan.Zero, receipt.ReceivedAtUtc.Offset);
    }

    private sealed class Store(AccountReceivable account) : IReceivableStore
    {
        public SalePayment? Payment { get; private set; }

        public Task<AccountReceivable?> FindAsync(int id) => Task.FromResult<AccountReceivable?>(id == account.Id ? account : null);

        public Task<ReceivableSettlement> ReceiveAsync(AccountReceivable account, SalePayment payment)
        {
            Payment = payment;
            return Task.FromResult(ReceivableSettlement.Received);
        }

        public Task<IReadOnlyList<ReceivableSummary>> ListAsync(string? customer, DateOnly? from, DateOnly? to,
            ReceivableStatus? status, DateOnly today) => throw new NotSupportedException();
    }
}
