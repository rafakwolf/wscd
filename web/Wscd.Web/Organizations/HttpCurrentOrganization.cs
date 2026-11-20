using System.Security.Claims;
using Wscd.Services.Organizations;

namespace Wscd.Web.Organizations;

public sealed class HttpCurrentOrganization(IHttpContextAccessor httpContextAccessor) : ICurrentOrganization
{
    public Guid? OrganizationId => Guid.TryParse(
        httpContextAccessor.HttpContext?.User.FindFirstValue("organization_id"),
        out var organizationId)
            ? organizationId
            : null;
}
