using Wscd.Domain.Catalogs;
using Wscd.Domain.Organizations;

namespace Wscd.Domain.Sales;

public sealed class AccountReceivable : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int? SaleId { get; set; }
    public Sale? Sale { get; set; }
    public int CustomerId { get; set; }
    public Customer Customer { get; set; } = null!;
    public string? Description { get; set; }
    public string? Document { get; set; }
    public DateOnly IssueDate { get; set; }
    public DateOnly DueDate { get; set; }
    public decimal Amount { get; set; }
    public decimal Balance { get; set; }
    public Guid Revision { get; set; }
    public List<SalePayment> Payments { get; } = [];
    public bool IsCancelled => Sale?.IsCancelled == true;
}
