using Wscd.Domain.Catalogs;
using Wscd.Domain.Organizations;

namespace Wscd.Domain.Inventory;

public sealed class Promotion : IOrganizationScoped
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public int ProductId { get; set; }
    public decimal RegularPrice { get; set; }
    public decimal DiscountPercent { get; set; }
    public decimal PromotionPrice { get; set; }
    public DateOnly StartDate { get; set; }
    public DateOnly EndDate { get; set; }
    public Product Product { get; set; } = null!;
}
