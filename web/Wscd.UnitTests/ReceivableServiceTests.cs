using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.UnitTests;

public sealed class ReceivableServiceTests
{
    [Fact]
    public async Task ReceiptValidatesTheCurrentBalanceAndLinksToTheTitle()
    {
        var account = new AccountReceivable { Id = 1, SaleId = 3, OrganizationId = Guid.NewGuid(), Amount = 20m, Balance = 15.20m, Revision = Guid.NewGuid() };
        var store = new Store(account);
        var service = new ReceivableService(store, null!, null!);
        var payment = new SalePaymentInput { Method = PaymentMethod.Pix, CashAccountId = 7, Amount = 15.21m };

        Assert.Equal(TitleSettlement.InvalidPayment, await service.ReceiveAsync(account.Id, payment, account.Revision));
        payment.Amount = 5.201m;
        Assert.Equal(TitleSettlement.InvalidPayment, await service.ReceiveAsync(account.Id, payment, account.Revision));
        payment.Amount = 5.20m;
        var staleRevision = account.Revision;
        account.Revision = Guid.NewGuid();
        Assert.Equal(TitleSettlement.Conflict, await service.ReceiveAsync(account.Id, payment, staleRevision));
        Assert.Null(store.Payment);

        Assert.Equal(TitleSettlement.Recorded, await service.ReceiveAsync(account.Id, payment, account.Revision));
        var receipt = Assert.IsType<SalePayment>(store.Payment);
        Assert.Equal((account.OrganizationId, account.Id, PaymentMethod.Pix, 7, 5.20m),
            (receipt.OrganizationId, receipt.AccountReceivableId!.Value, receipt.Method, receipt.CashAccountId, receipt.Amount));
        Assert.Null(receipt.SaleId);
        Assert.Equal(TimeSpan.Zero, receipt.ReceivedAtUtc.Offset);
    }

    [Fact]
    public async Task ReversalRequiresReasonAndCurrentTitleAndCannotBeRepeated()
    {
        var title = new AccountReceivable { Id = 1, Revision = Guid.NewGuid() };
        var payment = new SalePayment { Id = 2, AccountReceivableId = title.Id, Amount = 5m };
        title.Payments.Add(payment);
        var store = new Store(title);
        var service = new ReceivableService(store, null!, null!);
        var input = new ReversalInput { Revision = title.Revision, Reason = " " };

        Assert.Equal(TitleSettlement.InvalidReversal, await service.ReverseAsync(title.Id, payment.Id, input, "operator"));
        input.Reason = " Registro duplicado ";
        Assert.Equal(TitleSettlement.InvalidReversal, await service.ReverseAsync(title.Id, payment.Id, input, null));
        Assert.Equal(TitleSettlement.NotFound, await service.ReverseAsync(title.Id, 99, input, "operator"));
        title.Revision = Guid.NewGuid();
        Assert.Equal(TitleSettlement.Conflict, await service.ReverseAsync(title.Id, payment.Id, input, "operator"));
        Assert.Null(store.Reversal);

        input.Revision = title.Revision;
        Assert.Equal(TitleSettlement.Recorded, await service.ReverseAsync(title.Id, payment.Id, input, "operator"));
        var reversal = Assert.IsType<SettlementReversal>(store.Reversal);
        Assert.Equal(("Registro duplicado", "operator", TimeSpan.Zero), (reversal.Reason, reversal.UserId, reversal.AtUtc.Offset));
        payment.ReversedAtUtc = reversal.AtUtc;
        Assert.Equal(TitleSettlement.AlreadyReversed, await service.ReverseAsync(title.Id, payment.Id, input, "operator"));
    }

    [Fact]
    public async Task CancelledSalePreventsReceivingOrReversingTheTitle()
    {
        var title = new AccountReceivable
        {
            Id = 1,
            Balance = 10m,
            Revision = Guid.NewGuid(),
            Sale = new Sale { CancelledAtUtc = DateTimeOffset.UtcNow }
        };
        title.Payments.Add(new SalePayment { Id = 2, Amount = 5m });
        var store = new Store(title);
        var service = new ReceivableService(store, null!, null!);

        Assert.Equal(TitleSettlement.CancelledTitle, await service.ReceiveAsync(title.Id,
            new SalePaymentInput { Amount = 5m, CashAccountId = 3, Method = PaymentMethod.Pix }, title.Revision));
        Assert.Equal(TitleSettlement.CancelledTitle, await service.ReverseAsync(title.Id, 2,
            new ReversalInput { Revision = title.Revision, Reason = "Duplicado" }, "operator"));
        Assert.Null(store.Payment);
        Assert.Null(store.Reversal);
    }

    [Fact]
    public async Task ARefundCanPreventReversalOfAReceiptThatExceedsNetCash()
    {
        var sale = new Sale();
        sale.Payments.Add(new SalePayment { Amount = 3m });
        var saleReturn = new SaleReturn { RefundAmount = 4m };
        sale.Returns.Add(saleReturn);
        var title = new AccountReceivable { Id = 1, Sale = sale, Revision = Guid.NewGuid() };
        title.Payments.Add(new SalePayment { Id = 2, Amount = 5m });
        var store = new Store(title);
        var service = new ReceivableService(store, null!, null!);
        var input = new ReversalInput { Revision = title.Revision, Reason = "Corrigir recebimento" };

        Assert.Equal(TitleSettlement.RefundedSale, await service.ReverseAsync(1, 2, input, "user"));
        Assert.Null(store.Reversal);
        saleReturn.RefundAmount = 3m;
        Assert.Equal(TitleSettlement.Recorded, await service.ReverseAsync(1, 2, input, "user"));
    }

    private sealed class Store(AccountReceivable account) : IReceivableStore
    {
        public SalePayment? Payment { get; private set; }
        public SettlementReversal? Reversal { get; private set; }

        public Task<AccountReceivable?> FindAsync(int id) => Task.FromResult<AccountReceivable?>(id == account.Id ? account : null);
        public Task<bool> CreateAsync(AccountReceivable account) => throw new NotSupportedException();
        public Task<bool> UpdateManualAsync(AccountReceivable account, Guid expectedRevision) => throw new NotSupportedException();
        public Task<bool> DeleteManualAsync(int id, Guid expectedRevision) => throw new NotSupportedException();

        public Task<TitleSettlement> ReceiveAsync(AccountReceivable account, SalePayment payment)
        {
            Payment = payment;
            return Task.FromResult(TitleSettlement.Recorded);
        }

        public Task<TitleSettlement> ReverseAsync(AccountReceivable account, SalePayment payment, SettlementReversal reversal)
        {
            Reversal = reversal;
            return Task.FromResult(TitleSettlement.Recorded);
        }

        public Task<IReadOnlyList<ReceivableSummary>> ListAsync(string? customer, DateOnly? from, DateOnly? to,
            TitleStatus? status, DateOnly today) => throw new NotSupportedException();
    }
}
