using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;
using Wscd.Data.Identity;
using Wscd.Services.Organizations;

namespace Wscd.Web.Pages.Admin.Users;

[Authorize(Roles = ApplicationRoles.Administrator)]
public sealed class IndexModel(
    IOrganizationService organizationService) : PageModel
{
    [BindProperty(SupportsGet = true)] public string? Search { get; set; }

    public IReadOnlyList<OrganizationMember> Users { get; private set; } = [];

    public async Task<IActionResult> OnGetAsync()
    {
        return await LoadUsersAsync() ? Page() : Forbid();
    }

    public async Task<IActionResult> OnPostRemoveAsync(string memberId)
    {
        var requesterId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (requesterId is null)
        {
            return Forbid();
        }

        var result = await organizationService.RemoveMemberAsync(requesterId, memberId);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, "Não foi possível remover esse membro.");
            await LoadUsersAsync();
            return Page();
        }

        TempData["StatusMessage"] = "Acesso do membro removido.";
        return RedirectToPage(new { Search });
    }

    public async Task<IActionResult> OnPostReactivateAsync(string memberId)
    {
        var requesterId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (requesterId is null)
        {
            return Forbid();
        }

        var result = await organizationService.ReactivateMemberAsync(requesterId, memberId);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, "Não foi possível reativar esse membro.");
            await LoadUsersAsync();
            return Page();
        }

        TempData["StatusMessage"] = "Acesso do membro reativado.";
        return RedirectToPage(new { Search });
    }

    public async Task<IActionResult> OnPostResetPasswordAsync(string memberId, string? newPassword)
    {
        var requesterId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (requesterId is null)
        {
            return Forbid();
        }

        var result = await organizationService.ResetMemberPasswordAsync(requesterId, memberId, newPassword ?? string.Empty);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, result.ErrorCode == "PasswordTooShort"
                ? "A nova senha deve ter pelo menos 12 caracteres."
                : "Não foi possível redefinir a senha desse membro.");
            await LoadUsersAsync();
            return Page();
        }

        TempData["StatusMessage"] = "Senha do membro redefinida.";
        return RedirectToPage(new { Search });
    }

    private async Task<bool> LoadUsersAsync()
    {
        var requesterId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (requesterId is null)
        {
            return false;
        }

        var members = await organizationService.GetMembersAsync(requesterId);
        if (members is null)
        {
            return false;
        }

        Users = string.IsNullOrWhiteSpace(Search)
            ? members
            : members.Where(member => member.Email.Contains(Search.Trim(), StringComparison.OrdinalIgnoreCase)).ToArray();
        return true;
    }
}
