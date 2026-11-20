namespace Wscd.Services.Organizations;

public sealed record OrganizationOperationResult(bool Succeeded, string? ErrorCode = null, string? UserId = null);
