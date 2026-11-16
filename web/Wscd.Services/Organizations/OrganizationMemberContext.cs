namespace Wscd.Services.Organizations;

public sealed record OrganizationMemberContext(Guid? OrganizationId, bool IsActive, bool IsOwner);
