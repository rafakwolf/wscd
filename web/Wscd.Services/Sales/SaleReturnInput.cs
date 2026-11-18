using Wscd.Domain.Sales;

namespace Wscd.Services.Sales;

public sealed class SaleReturnInput : ReversalInput
{
    public Guid? ReceivableRevision { get; set; }
    public List<SaleReturnLineInput> Lines { get; set; } = [];
    public int? CashAccountId { get; set; }
    public PaymentMethod? RefundMethod { get; set; }
}

public sealed class SaleReturnLineInput
{
    public int SaleItemId { get; set; }
    public int Quantity { get; set; }
    public bool Restock { get; set; }
}

public enum SaleReturnResult { Ready, Recorded, NotFound, InvalidSale, InvalidReason, InvalidItems, InvalidRefund, Conflict }

public sealed record SaleReturnReview(SaleReturnResult Result, Sale? Sale, SaleReturn? Return = null);
