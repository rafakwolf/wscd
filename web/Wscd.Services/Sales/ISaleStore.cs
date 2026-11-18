using Wscd.Domain.Sales;

namespace Wscd.Services.Sales;

public interface ISaleStore
{
    Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed);
    Task<Sale?> FindAsync(int id);
    Task<bool> CreateAsync(Sale sale, Guid? quotationRevision = null);
    Task<bool> UpdateAsync(int id, Func<Sale, bool> change);
    Task<SaleCheckout> CheckoutAsync(Sale sale, SalePayment payment, DateTimeOffset completedAt);
}

public sealed record SaleSummary(int Id, DateOnly Date, string CustomerName, decimal Total, bool IsCompleted);

public enum SaleCheckout { Completed, InvalidSale, InvalidCashAccount, InsufficientStock, Conflict }
