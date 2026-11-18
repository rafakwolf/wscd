using Wscd.Domain.Sales;

namespace Wscd.Services.Sales;

public interface ISaleStore
{
    Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, SaleStatus? status);
    Task<Sale?> FindAsync(int id);
    Task<bool> CreateAsync(Sale sale, Guid? quotationRevision = null);
    Task<bool> UpdateAsync(int id, Func<Sale, bool> change);
    Task<SaleCheckout> CheckoutAsync(Sale sale, IReadOnlyList<SalePayment> payments, AccountReceivable? receivable, DateTimeOffset completedAt);
    Task<SaleCancellation> CancelAsync(Sale sale, SettlementReversal cancellation);
}

public sealed record SaleSummary(int Id, DateOnly Date, string CustomerName, decimal Total, SaleStatus Status);

public enum SaleStatus { Draft, Completed, Cancelled }
public enum SaleCancellation { Cancelled, NotFound, InvalidSale, InvalidReason, Conflict }

public sealed class SalePaymentInput
{
    public PaymentMethod Method { get; set; }
    public int CashAccountId { get; set; }
    public decimal Amount { get; set; }

    internal bool IsValid(decimal maxAmount) => Enum.IsDefined(Method) && CashAccountId > 0 &&
        Amount > 0 && Amount <= maxAmount && decimal.Round(Amount, 2) == Amount;
}

public enum SaleCheckout { Completed, InvalidSale, InvalidCashAccount, InvalidPayments, PaymentTotalMismatch, InvalidDueDate, InsufficientStock, Conflict }
