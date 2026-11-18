using Wscd.Domain.Sales;

namespace Wscd.Services.Sales;

public interface ISaleStore
{
    Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed);
    Task<Sale?> FindAsync(int id);
    Task<bool> CreateAsync(Sale sale, Guid? quotationRevision = null);
    Task<bool> UpdateAsync(int id, Func<Sale, bool> change);
    Task<SaleCheckout> CheckoutAsync(Sale sale, IReadOnlyList<SalePayment> payments, DateTimeOffset completedAt);
}

public sealed record SaleSummary(int Id, DateOnly Date, string CustomerName, decimal Total, bool IsCompleted);

public sealed class SalePaymentInput
{
    public PaymentMethod Method { get; set; }
    public int CashAccountId { get; set; }
    public decimal Amount { get; set; }
}

public enum SaleCheckout { Completed, InvalidSale, InvalidCashAccount, InvalidPayments, PaymentTotalMismatch, InsufficientStock, Conflict }
