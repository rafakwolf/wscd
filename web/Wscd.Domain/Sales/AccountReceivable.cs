using Wscd.Domain.Organizations;

namespace Wscd.Domain.Sales;

public sealed class AccountReceivable : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int SaleId { get; set; }
    public Sale Sale { get; set; } = null!;
    public DateOnly DueDate { get; set; }
    public decimal Amount { get; set; }
    public decimal Balance { get; set; }
    public List<SalePayment> Payments { get; } = [];
}
