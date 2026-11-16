using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Wscd.Data.Identity;
using Wscd.Domain.Organizations;
using Wscd.Services.Organizations;

namespace Wscd.Data.Organizations;

public sealed class OrganizationStore(
    WscdDbContext db,
    UserManager<ApplicationUser> userManager,
    RoleManager<IdentityRole> roleManager) : IOrganizationStore
{
    public async Task<OrganizationOperationResult> RegisterOwnerAsync(string organizationName, string email, string password)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        var organization = new Organization(organizationName);
        db.Organizations.Add(organization);
        await db.SaveChangesAsync();

        var user = new ApplicationUser
        {
            UserName = email,
            Email = email,
            OrganizationId = organization.Id
        };
        var createResult = await userManager.CreateAsync(user, password);
        if (!createResult.Succeeded)
        {
            await transaction.RollbackAsync();
            return Failure(createResult);
        }

        var roleResult = await AddRoleAsync(user, ApplicationRoles.Administrator);
        if (!roleResult.Succeeded)
        {
            await transaction.RollbackAsync();
            return Failure(roleResult);
        }

        organization.SetOwner(user.Id);
        await db.SaveChangesAsync();
        await transaction.CommitAsync();
        return new OrganizationOperationResult(true, UserId: user.Id);
    }

    public async Task<OrganizationOperationResult> AttachExistingOwnerAsync(string userId, string organizationName)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user is null || user.OrganizationId is not null || !user.IsActive ||
            !await userManager.IsInRoleAsync(user, ApplicationRoles.Administrator))
        {
            return new OrganizationOperationResult(false, "AccountNotAvailable");
        }

        await using var transaction = await db.Database.BeginTransactionAsync();
        var organization = new Organization(organizationName);
        db.Organizations.Add(organization);
        await db.SaveChangesAsync();

        user.OrganizationId = organization.Id;
        var updateResult = await userManager.UpdateAsync(user);
        if (!updateResult.Succeeded)
        {
            await transaction.RollbackAsync();
            return Failure(updateResult);
        }

        var roleResult = await AddRoleAsync(user, ApplicationRoles.Administrator);
        if (!roleResult.Succeeded)
        {
            await transaction.RollbackAsync();
            return Failure(roleResult);
        }

        organization.SetOwner(user.Id);
        await db.SaveChangesAsync();
        await transaction.CommitAsync();
        return new OrganizationOperationResult(true, UserId: user.Id);
    }

    public async Task<OrganizationMemberContext?> GetMemberContextAsync(string userId)
    {
        var user = await userManager.FindByIdAsync(userId);
        return user is null
            ? null
            : new OrganizationMemberContext(
                user.OrganizationId,
                user.IsActive,
                user.OrganizationId is Guid organizationId &&
                await db.Organizations.AnyAsync(org => org.Id == organizationId && org.OwnerUserId == user.Id));
    }

    public async Task<IReadOnlyList<OrganizationMember>> GetMembersAsync(Guid organizationId)
    {
        var ownerId = await db.Organizations
            .Where(organization => organization.Id == organizationId)
            .Select(organization => organization.OwnerUserId)
            .SingleAsync();

        return await db.Users
            .Where(user => user.OrganizationId == organizationId)
            .OrderBy(user => user.Email)
            .Select(user => new OrganizationMember(
                user.Id,
                user.Email ?? user.UserName ?? string.Empty,
                user.IsActive,
                user.Id == ownerId))
            .ToListAsync();
    }

    public async Task<OrganizationOperationResult> AddMemberAsync(Guid organizationId, string email, string password)
    {
        if (!await db.Organizations.AnyAsync(organization => organization.Id == organizationId))
        {
            return new OrganizationOperationResult(false, "OrganizationNotFound");
        }

        await using var transaction = await db.Database.BeginTransactionAsync();
        var user = new ApplicationUser
        {
            UserName = email,
            Email = email,
            OrganizationId = organizationId
        };
        var createResult = await userManager.CreateAsync(user, password);
        if (!createResult.Succeeded)
        {
            await transaction.RollbackAsync();
            return Failure(createResult);
        }

        var roleResult = await AddRoleAsync(user, ApplicationRoles.Operator);
        if (!roleResult.Succeeded)
        {
            await transaction.RollbackAsync();
            return Failure(roleResult);
        }

        await transaction.CommitAsync();
        return new OrganizationOperationResult(true, UserId: user.Id);
    }

    public async Task<bool> RemoveMemberAsync(Guid organizationId, string memberId)
    {
        var ownerId = await db.Organizations
            .Where(organization => organization.Id == organizationId)
            .Select(organization => organization.OwnerUserId)
            .SingleOrDefaultAsync();
        var user = await userManager.Users.SingleOrDefaultAsync(user =>
            user.Id == memberId && user.OrganizationId == organizationId && user.Id != ownerId);

        if (user is null || !user.IsActive)
        {
            return false;
        }

        user.IsActive = false;
        return (await userManager.UpdateSecurityStampAsync(user)).Succeeded;
    }

    private async Task<IdentityResult> AddRoleAsync(ApplicationUser user, string role)
    {
        if (await userManager.IsInRoleAsync(user, role))
        {
            return IdentityResult.Success;
        }

        if (!await roleManager.RoleExistsAsync(role))
        {
            var createRole = await roleManager.CreateAsync(new IdentityRole(role));
            if (!createRole.Succeeded)
            {
                return createRole;
            }
        }

        return await userManager.AddToRoleAsync(user, role);
    }

    private static OrganizationOperationResult Failure(IdentityResult result)
    {
        var errorCode = result.Errors.FirstOrDefault()?.Code switch
        {
            "DuplicateEmail" or "DuplicateUserName" => "DuplicateEmail",
            "PasswordTooShort" => "PasswordTooShort",
            "PasswordRequiresDigit" or "PasswordRequiresLower" or "PasswordRequiresUpper" or "PasswordRequiresNonAlphanumeric" => "PasswordPolicy",
            _ => "AccountCreationFailed"
        };

        return new OrganizationOperationResult(false, errorCode);
    }
}
