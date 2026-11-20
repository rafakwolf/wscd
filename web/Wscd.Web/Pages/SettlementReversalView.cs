using Wscd.Domain.Sales;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages;

public sealed record SettlementReversalView(int Id, int PaymentId, decimal Amount, string CashAccountName,
    PaymentMethod Method, bool IsPayable, bool IsReversed, string? Error, ReversalInput Input, Dictionary<string, string?> ListFilters);
