using Wscd.Domain.Catalogs;
using Wscd.Domain.Organizations;
using Wscd.Domain.Sales;

namespace Wscd.Domain.Purchases;

public sealed class Purchase : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int SupplierId { get; set; }
    public DateOnly PurchaseDate { get; set; }
    public DateOnly? DueDate { get; set; }
    public string? Notes { get; set; }
    public decimal Total { get; set; }
    public bool IsCompleted { get; set; }
    public DateOnly? CompletedDate { get; set; }
    public Supplier Supplier { get; set; } = null!;
    public List<PurchaseItem> Items { get; set; } = [];
}

public sealed class PurchaseItem : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int PurchaseId { get; set; }
    public int ProductId { get; set; }
    public int Quantity { get; set; }
    public decimal UnitCost { get; set; }
    public Purchase Purchase { get; set; } = null!;
    public Product Product { get; set; } = null!;
}

public sealed class AccountPayable : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int? PurchaseId { get; set; }
    public int SupplierId { get; set; }
    public Supplier Supplier { get; set; } = null!;
    public string? Description { get; set; }
    public string? Document { get; set; }
    public DateOnly CreatedDate { get; set; }
    public DateOnly DueDate { get; set; }
    public decimal Amount { get; set; }
    public decimal Balance { get; set; }
    public Guid Revision { get; set; }
    public List<PayablePayment> Payments { get; } = [];
}

public sealed class PayablePayment : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int AccountPayableId { get; set; }
    public AccountPayable Payable { get; set; } = null!;
    public int CashAccountId { get; set; }
    public CashAccount CashAccount { get; set; } = null!;
    public PaymentMethod Method { get; set; }
    public decimal Amount { get; set; }
    public DateTimeOffset PaidAtUtc { get; set; }
    public DateTimeOffset? ReversedAtUtc { get; set; }
    public string? ReversalReason { get; set; }
    public string? ReversedByUserId { get; set; }
}
