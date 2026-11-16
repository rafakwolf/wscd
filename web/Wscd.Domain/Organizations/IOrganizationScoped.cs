namespace Wscd.Domain.Organizations;

public interface IOrganizationScoped
{
    Guid OrganizationId { get; set; }
}
