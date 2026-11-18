using Wscd.Domain.Catalogs;
using Wscd.Domain.Organizations;
using Wscd.Domain.Quotations;

namespace Wscd.Domain.Sales;

public sealed class Sale : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int CustomerId { get; set; }
    public Customer Customer { get; set; } = null!;
    public int SellerId { get; set; }
    public Seller Seller { get; set; } = null!;
    public int? QuotationId { get; set; }
    public Quotation? Quotation { get; set; }
    public DateOnly Date { get; set; }
    public string? Notes { get; set; }
    public DateTimeOffset? CompletedAtUtc { get; set; }
    public Guid Revision { get; set; }
    public List<SaleItem> Items { get; } = [];
    public List<SalePayment> Payments { get; } = [];
    public AccountReceivable? Receivable { get; set; }
    public decimal Total => Items.Sum(item => item.Total);
    public bool IsCompleted => CompletedAtUtc is not null;
}

public sealed class SaleItem : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int SaleId { get; set; }
    public int ProductId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal DiscountPercent { get; set; }
    public decimal Total { get; set; }
}

public sealed class SalePayment : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int SaleId { get; set; }
    public Sale Sale { get; set; } = null!;
    public int CashAccountId { get; set; }
    public CashAccount CashAccount { get; set; } = null!;
    public PaymentMethod Method { get; set; }
    public decimal Amount { get; set; }
    public DateTimeOffset ReceivedAtUtc { get; set; }
    public int? AccountReceivableId { get; set; }
}

public enum PaymentMethod { Cash = 1, Pix = 2, DebitCard = 3, CreditCard = 4 }
