using Wscd.Domain.Organizations;

namespace Wscd.Services.Organizations;

public sealed class OrganizationService(IOrganizationStore store) : IOrganizationService
{
    public Task<OrganizationOperationResult> RegisterOwnerAsync(string organizationName, string email, string password)
    {
        var name = organizationName.Trim();
        if (name.Length is 0 or > 160)
        {
            return Task.FromResult(new OrganizationOperationResult(false, "InvalidOrganizationName"));
        }
        if (string.IsNullOrWhiteSpace(email))
        {
            return Task.FromResult(new OrganizationOperationResult(false, "InvalidEmail"));
        }
        if (password.Length < 12)
        {
            return Task.FromResult(new OrganizationOperationResult(false, "PasswordTooShort"));
        }

        return store.RegisterOwnerAsync(name, email.Trim(), password);
    }

    public Task<OrganizationOperationResult> AttachExistingOwnerAsync(string userId, string organizationName)
    {
        var name = organizationName.Trim();
        if (name.Length is 0 or > 160)
        {
            return Task.FromResult(new OrganizationOperationResult(false, "InvalidOrganizationName"));
        }

        return store.AttachExistingOwnerAsync(userId, name);
    }

    public async Task<IReadOnlyList<OrganizationMember>?> GetMembersAsync(string requesterId)
    {
        var membership = await store.GetMemberContextAsync(requesterId);
        return membership is { IsActive: true, IsOwner: true, OrganizationId: Guid organizationId }
            ? await store.GetMembersAsync(organizationId)
            : null;
    }

    public async Task<OrganizationOperationResult> AddMemberAsync(string requesterId, string email, string password)
    {
        var membership = await store.GetMemberContextAsync(requesterId);
        if (membership is not { IsActive: true, IsOwner: true, OrganizationId: Guid organizationId })
        {
            return new OrganizationOperationResult(false, "Forbidden");
        }
        if (string.IsNullOrWhiteSpace(email))
        {
            return new OrganizationOperationResult(false, "InvalidEmail");
        }
        if (password.Length < 12)
        {
            return new OrganizationOperationResult(false, "PasswordTooShort");
        }

        return await store.AddMemberAsync(organizationId, email.Trim(), password);
    }

    public async Task<OrganizationOperationResult> RemoveMemberAsync(string requesterId, string memberId)
    {
        var membership = await store.GetMemberContextAsync(requesterId);
        if (membership is not { IsActive: true, IsOwner: true, OrganizationId: Guid organizationId })
        {
            return new OrganizationOperationResult(false, "Forbidden");
        }

        return await store.RemoveMemberAsync(organizationId, memberId)
            ? new OrganizationOperationResult(true)
            : new OrganizationOperationResult(false, "MemberNotFound");
    }

    public async Task<OrganizationOperationResult> ReactivateMemberAsync(string requesterId, string memberId)
    {
        var membership = await store.GetMemberContextAsync(requesterId);
        if (membership is not { IsActive: true, IsOwner: true, OrganizationId: Guid organizationId })
        {
            return new OrganizationOperationResult(false, "Forbidden");
        }

        return await store.ReactivateMemberAsync(organizationId, memberId)
            ? new OrganizationOperationResult(true)
            : new OrganizationOperationResult(false, "MemberNotFound");
    }

    public async Task<OrganizationOperationResult> ResetMemberPasswordAsync(string requesterId, string memberId, string newPassword)
    {
        var membership = await store.GetMemberContextAsync(requesterId);
        if (membership is not { IsActive: true, IsOwner: true, OrganizationId: Guid organizationId })
        {
            return new OrganizationOperationResult(false, "Forbidden");
        }
        if (string.IsNullOrEmpty(newPassword) || newPassword.Length < 12)
        {
            return new OrganizationOperationResult(false, "PasswordTooShort");
        }

        return await store.ResetMemberPasswordAsync(organizationId, memberId, newPassword);
    }
}
