using Wscd.Domain.Organizations;

namespace Wscd.Services.Organizations;

public interface IOrganizationStore
{
    Task<OrganizationOperationResult> RegisterOwnerAsync(string organizationName, string email, string password);
    Task<OrganizationOperationResult> AttachExistingOwnerAsync(string userId, string organizationName);
    Task<OrganizationMemberContext?> GetMemberContextAsync(string userId);
    Task<IReadOnlyList<OrganizationMember>> GetMembersAsync(Guid organizationId);
    Task<OrganizationOperationResult> AddMemberAsync(Guid organizationId, string email, string password);
    Task<bool> RemoveMemberAsync(Guid organizationId, string memberId);
}
