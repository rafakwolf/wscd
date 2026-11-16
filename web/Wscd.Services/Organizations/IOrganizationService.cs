namespace Wscd.Services.Organizations;

public interface IOrganizationService
{
    Task<OrganizationOperationResult> RegisterOwnerAsync(string organizationName, string email, string password);
    Task<OrganizationOperationResult> AttachExistingOwnerAsync(string userId, string organizationName);
    Task<IReadOnlyList<OrganizationMember>?> GetMembersAsync(string requesterId);
    Task<OrganizationOperationResult> AddMemberAsync(string requesterId, string email, string password);
    Task<OrganizationOperationResult> RemoveMemberAsync(string requesterId, string memberId);
}
