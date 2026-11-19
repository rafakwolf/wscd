using Wscd.Domain.Quotations;

namespace Wscd.Services.Quotations;

public interface IQuotationStore
{
    Task<IReadOnlyList<QuotationSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed);
    Task<Quotation?> FindAsync(int id);
    Task<bool> CreateAsync(Quotation quotation);
    Task<bool> UpdateAsync(int id, Func<Quotation, bool> change);
    Task<bool> DeleteAsync(int id);
}

public sealed record QuotationSummary(int Id, DateOnly Date, string CustomerName, decimal Total, bool IsCompleted, bool IsConverted, bool IsCancelledSale = false);
