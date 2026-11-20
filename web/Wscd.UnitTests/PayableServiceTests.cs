using Wscd.Domain.Catalogs;
using Wscd.Domain.Purchases;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;
using Wscd.Services.Purchases;
using Wscd.Services.Sales;

namespace Wscd.UnitTests;

public sealed class PayableServiceTests
{
    [Fact]
    public async Task ManualTitleStartsOpenAndPaymentLinksToItWithoutAPurchase()
    {
        var organization = new Organization(Guid.NewGuid());
        var store = new Store();
        var service = new PayableService(store, new Suppliers(), organization);
        var issue = new DateOnly(2026, 11, 18);
        var input = new ManualTitleInput { PartyId = 2, IssueDate = issue, DueDate = issue.AddDays(-1), Amount = 15.25m, Description = " Energia " };

        Assert.Null(await service.CreateAsync(input));
        input.DueDate = issue;
        input.Amount = 15.251m;
        Assert.Null(await service.CreateAsync(input));
        input.Amount = 15.25m;
        input.PartyId = 99;
        Assert.Null(await service.CreateAsync(input));
        Assert.Null(store.Account);
        input.PartyId = 2;
        Assert.Equal(1, await service.CreateAsync(input));

        var account = Assert.IsType<AccountPayable>(store.Account);
        Assert.Null(account.PurchaseId);
        Assert.Equal(organization.OrganizationId, account.OrganizationId);
        Assert.Equal("Energia", account.Description);
        Assert.Equal(input.Amount, account.Balance);
        Assert.Null(store.Payment);

        var payment = new SalePaymentInput { Method = PaymentMethod.Pix, CashAccountId = 3, Amount = 5.25m };
        Assert.Equal(TitleSettlement.Conflict, await service.PayAsync(account.Id, payment, Guid.NewGuid()));
        Assert.Equal(TitleSettlement.Recorded, await service.PayAsync(account.Id, payment, account.Revision));
        Assert.Equal(account.Id, store.Payment!.AccountPayableId);
        Assert.Equal(5.25m, store.Payment.Amount);
    }

    private sealed record Organization(Guid? OrganizationId) : ICurrentOrganization;

    private sealed class Suppliers : ICatalogService<Supplier>
    {
        public Task<Supplier?> FindAsync(int id) => Task.FromResult<Supplier?>(id == 2 ? new Supplier { Id = id } : null);
        public Task<IReadOnlyList<Supplier>> ListAsync(string? search) => throw new NotSupportedException();
        public Task<bool> SaveAsync(Supplier entity) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }

    private sealed class Store : IPayableStore
    {
        public AccountPayable? Account { get; private set; }
        public PayablePayment? Payment { get; private set; }
        public Task<bool> CreateAsync(AccountPayable account)
        {
            account.Id = 1;
            Account = account;
            return Task.FromResult(true);
        }

        public Task<AccountPayable?> FindAsync(int id) => Task.FromResult(Account?.Id == id ? Account : null);
        public Task<bool> UpdateManualAsync(AccountPayable account, Guid expectedRevision) => throw new NotSupportedException();
        public Task<bool> DeleteManualAsync(int id, Guid expectedRevision) => throw new NotSupportedException();

        public Task<TitleSettlement> PayAsync(AccountPayable account, PayablePayment payment)
        {
            Payment = payment;
            return Task.FromResult(TitleSettlement.Recorded);
        }

        public Task<TitleSettlement> ReverseAsync(AccountPayable account, PayablePayment payment, SettlementReversal reversal) =>
            throw new NotSupportedException();

        public Task<IReadOnlyList<PayableSummary>> ListAsync(string? supplier, DateOnly? from, DateOnly? to,
            TitleStatus? status, DateOnly today) => throw new NotSupportedException();
    }
}
