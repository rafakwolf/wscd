using Wscd.Domain.Catalogs;
using Wscd.Domain.Organizations;

namespace Wscd.Domain.Inventory;

public sealed class StockLoss : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int ProductId { get; set; }
    public int Quantity { get; set; }
    public decimal UnitCost { get; set; }
    public DateOnly LossDate { get; set; }
    public string Reason { get; set; } = string.Empty;
    public string? Notes { get; set; }
    public Product Product { get; set; } = null!;
}
