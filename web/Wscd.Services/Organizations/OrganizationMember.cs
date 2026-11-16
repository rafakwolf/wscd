namespace Wscd.Services.Organizations;

public sealed record OrganizationMember(string UserId, string Email, bool IsActive, bool IsOwner);
