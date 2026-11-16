using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using Wscd.Data.Identity;

namespace Wscd.Web.Organizations;

public sealed class OrganizationClaimsPrincipalFactory(
    UserManager<ApplicationUser> userManager,
    RoleManager<IdentityRole> roleManager,
    IOptions<IdentityOptions> options)
    : UserClaimsPrincipalFactory<ApplicationUser, IdentityRole>(userManager, roleManager, options)
{
    protected override async Task<ClaimsIdentity> GenerateClaimsAsync(ApplicationUser user)
    {
        var identity = await base.GenerateClaimsAsync(user);
        if (user.OrganizationId is Guid organizationId)
        {
            identity.AddClaim(new Claim("organization_id", organizationId.ToString("D")));
        }

        return identity;
    }
}
