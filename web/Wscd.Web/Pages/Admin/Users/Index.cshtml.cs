using System.ComponentModel.DataAnnotations;
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
    [BindProperty]
    public InputModel Input { get; set; } = new();

    public IReadOnlyList<OrganizationMember> Users { get; private set; } = [];

    public async Task<IActionResult> OnGetAsync()
    {
        return await LoadUsersAsync() ? Page() : Forbid();
    }

    public async Task<IActionResult> OnPostAddAsync()
    {
        if (!ModelState.IsValid)
        {
            await LoadUsersAsync();
            return Page();
        }

        var requesterId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (requesterId is null)
        {
            return Forbid();
        }

        var result = await organizationService.AddMemberAsync(requesterId, Input.Email, Input.Password);
        if (!result.Succeeded)
        {
            AddError(result.ErrorCode);
            await LoadUsersAsync();
            return Page();
        }

        TempData["StatusMessage"] = "Usuário criado.";
        return RedirectToPage();
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
        return RedirectToPage();
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

        Users = members;
        return true;
    }

    private void AddError(string? errorCode)
    {
        var message = errorCode switch
        {
            "DuplicateEmail" => "Já existe um usuário com esse e-mail.",
            "InvalidEmail" => "Informe um e-mail válido.",
            "PasswordTooShort" => "A senha deve ter pelo menos 12 caracteres.",
            "PasswordPolicy" => "A senha não atende aos requisitos de segurança.",
            "Forbidden" => "Somente o administrador da organização pode gerenciar usuários.",
            _ => "Não foi possível criar o usuário. Confira os dados informados."
        };

        ModelState.AddModelError(string.Empty, message);
    }

    public sealed class InputModel
    {
        [Required(ErrorMessage = "Informe o e-mail.")]
        [EmailAddress(ErrorMessage = "Informe um e-mail válido.")]
        [Display(Name = "E-mail")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Informe uma senha.")]
        [MinLength(12, ErrorMessage = "A senha deve ter pelo menos 12 caracteres.")]
        [DataType(DataType.Password)]
        [Display(Name = "Senha")]
        public string Password { get; set; } = string.Empty;
    }

}
