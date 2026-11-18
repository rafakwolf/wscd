using Wscd.Domain.Catalogs;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;

namespace Wscd.Services.Sales;

public sealed class ReceivableService(IReceivableStore store, ICatalogService<Customer> customers, ICurrentOrganization organization)
{
    public Task<IReadOnlyList<ReceivableSummary>> ListAsync(string? customer, DateOnly? from, DateOnly? to,
        TitleStatus? status, DateOnly today) => store.ListAsync(customer?.Trim(), from, to, status, today);

    public Task<AccountReceivable?> FindAsync(int id) => store.FindAsync(id);

    public async Task<int?> CreateAsync(ManualTitleInput input)
    {
        if (organization.OrganizationId is not Guid organizationId || !input.IsValid(999_999_999_999.99m) ||
            await customers.FindAsync(input.PartyId) is null)
        {
            return null;
        }

        var account = new AccountReceivable
        {
            OrganizationId = organizationId,
            CustomerId = input.PartyId,
            Description = input.Description!.Trim(),
            Document = string.IsNullOrWhiteSpace(input.Document) ? null : input.Document.Trim(),
            IssueDate = input.IssueDate,
            DueDate = input.DueDate,
            Amount = input.Amount,
            Balance = input.Amount
        };
        return await store.CreateAsync(account) ? account.Id : null;
    }

    public async Task<TitleSettlement> ReceiveAsync(int id, SalePaymentInput payment, Guid expectedRevision)
    {
        var account = await store.FindAsync(id);
        if (account is null)
        {
            return TitleSettlement.NotFound;
        }
        if (account.Revision != expectedRevision)
        {
            return TitleSettlement.Conflict;
        }
        if (!payment.IsValid(account.Balance))
        {
            return TitleSettlement.InvalidPayment;
        }

        return await store.ReceiveAsync(account, new SalePayment
        {
            OrganizationId = account.OrganizationId,
            AccountReceivableId = account.Id,
            CashAccountId = payment.CashAccountId,
            Method = payment.Method,
            Amount = payment.Amount,
            ReceivedAtUtc = DateTimeOffset.UtcNow
        });
    }

    public async Task<TitleSettlement> ReverseAsync(int id, int paymentId, ReversalInput input, string? userId)
    {
        if (input.Build(userId) is not { } reversal)
        {
            return TitleSettlement.InvalidReversal;
        }

        var account = await store.FindAsync(id);
        if (account?.Payments.SingleOrDefault(payment => payment.Id == paymentId) is not { } original)
        {
            return TitleSettlement.NotFound;
        }
        if (original.ReversedAtUtc.HasValue)
        {
            return TitleSettlement.AlreadyReversed;
        }
        if (account.Revision != input.Revision)
        {
            return TitleSettlement.Conflict;
        }

        return await store.ReverseAsync(account, original, reversal);
    }
}
