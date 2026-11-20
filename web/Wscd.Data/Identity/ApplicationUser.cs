using Microsoft.AspNetCore.Identity;

namespace Wscd.Data.Identity;

public sealed class ApplicationUser : IdentityUser
{
    public Guid? OrganizationId { get; set; }
    public bool IsActive { get; set; } = true;
}
