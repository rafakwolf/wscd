using Wscd.Domain.Catalogs;
using Wscd.Domain.Organizations;

namespace Wscd.Domain.Sales;

public sealed class SaleReturn : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int SaleId { get; set; }
    public Sale Sale { get; set; } = null!;
    public DateTimeOffset ReturnedAtUtc { get; set; }
    public string Reason { get; set; } = string.Empty;
    public string UserId { get; set; } = string.Empty;
    public decimal ReceivableReduction { get; set; }
    public decimal RefundAmount { get; set; }
    public int? CashAccountId { get; set; }
    public CashAccount? CashAccount { get; set; }
    public PaymentMethod? RefundMethod { get; set; }
    public List<SaleReturnItem> Items { get; } = [];
    public decimal Total => ReceivableReduction + RefundAmount;
}

public sealed class SaleReturnItem : IOrganizationScoped
{
    public Guid OrganizationId { get; set; }
    public int SaleReturnId { get; set; }
    public int SaleItemId { get; set; }
    public int Quantity { get; set; }
    public decimal Amount { get; set; }
    public bool Restock { get; set; }
}
