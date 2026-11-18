using Wscd.Domain.Catalogs;
using Wscd.Domain.Organizations;

namespace Wscd.Domain.Quotations;

public sealed class Quotation : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int CustomerId { get; set; }
    public Customer Customer { get; set; } = null!;
    public int SellerId { get; set; }
    public Seller Seller { get; set; } = null!;
    public DateOnly Date { get; set; }
    public string? Notes { get; set; }
    public bool IsCompleted { get; set; }
    public Guid Revision { get; set; }
    public List<QuotationItem> Items { get; } = [];
    public decimal Total => Items.Sum(item => item.Total);
}

public sealed class QuotationItem : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int QuotationId { get; set; }
    public int ProductId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal DiscountPercent { get; set; }
    public decimal Total { get; set; }
}
