using Wscd.Domain.Sales;

namespace Wscd.Services.Sales;

public sealed class ReceivableService(IReceivableStore store)
{
    public Task<IReadOnlyList<ReceivableSummary>> ListAsync(string? customer, DateOnly? from, DateOnly? to,
        ReceivableStatus? status, DateOnly today) => store.ListAsync(customer?.Trim(), from, to, status, today);

    public Task<AccountReceivable?> FindAsync(int id) => store.FindAsync(id);

    public async Task<ReceivableSettlement> ReceiveAsync(int id, SalePaymentInput payment, decimal expectedBalance)
    {
        var account = await store.FindAsync(id);
        if (account is null)
        {
            return ReceivableSettlement.NotFound;
        }
        if (account.Balance != expectedBalance)
        {
            return ReceivableSettlement.Conflict;
        }
        if (!payment.IsValid(account.Balance))
        {
            return ReceivableSettlement.InvalidPayment;
        }

        return await store.ReceiveAsync(account, new SalePayment
        {
            OrganizationId = account.OrganizationId,
            SaleId = account.SaleId,
            AccountReceivableId = account.Id,
            CashAccountId = payment.CashAccountId,
            Method = payment.Method,
            Amount = payment.Amount,
            ReceivedAtUtc = DateTimeOffset.UtcNow
        });
    }
}
