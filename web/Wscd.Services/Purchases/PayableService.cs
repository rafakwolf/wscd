using Wscd.Domain.Catalogs;
using Wscd.Domain.Purchases;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;
using Wscd.Services.Sales;

namespace Wscd.Services.Purchases;

public sealed class PayableService(IPayableStore store, ICatalogService<Supplier> suppliers, ICurrentOrganization organization)
{
    public Task<IReadOnlyList<PayableSummary>> ListAsync(string? supplier, DateOnly? from, DateOnly? to,
        TitleStatus? status, DateOnly today) => store.ListAsync(supplier?.Trim(), from, to, status, today);

    public Task<AccountPayable?> FindAsync(int id) => store.FindAsync(id);

    public async Task<int?> CreateAsync(ManualTitleInput input)
    {
        if (organization.OrganizationId is not Guid organizationId || !input.IsValid(9_999_999_999.99m) ||
            await suppliers.FindAsync(input.PartyId) is null)
        {
            return null;
        }

        var account = new AccountPayable
        {
            OrganizationId = organizationId,
            SupplierId = input.PartyId,
            Description = input.Description!.Trim(),
            Document = string.IsNullOrWhiteSpace(input.Document) ? null : input.Document.Trim(),
            CreatedDate = input.IssueDate,
            DueDate = input.DueDate,
            Amount = input.Amount,
            Balance = input.Amount
        };
        return await store.CreateAsync(account) ? account.Id : null;
    }

    public async Task<bool> UpdateManualAsync(int id, ManualTitleInput input, Guid expectedRevision)
    {
        if (!input.IsValid(9_999_999_999.99m) || await suppliers.FindAsync(input.PartyId) is null)
        {
            return false;
        }

        return await store.UpdateManualAsync(new AccountPayable
        {
            Id = id,
            SupplierId = input.PartyId,
            Description = input.Description!.Trim(),
            Document = string.IsNullOrWhiteSpace(input.Document) ? null : input.Document.Trim(),
            CreatedDate = input.IssueDate,
            DueDate = input.DueDate,
            Amount = input.Amount,
            Balance = input.Amount
        }, expectedRevision);
    }

    public Task<bool> DeleteManualAsync(int id, Guid expectedRevision) => store.DeleteManualAsync(id, expectedRevision);

    public async Task<TitleSettlement> PayAsync(int id, SalePaymentInput payment, Guid expectedRevision)
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

        return await store.PayAsync(account, new PayablePayment
        {
            OrganizationId = account.OrganizationId,
            AccountPayableId = account.Id,
            CashAccountId = payment.CashAccountId,
            Method = payment.Method,
            Amount = payment.Amount,
            PaidAtUtc = DateTimeOffset.UtcNow
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
