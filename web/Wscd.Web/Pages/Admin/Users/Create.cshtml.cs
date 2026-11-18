using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;
using Wscd.Data.Identity;
using Wscd.Services.Organizations;

namespace Wscd.Web.Pages.Admin.Users;

[Authorize(Roles = ApplicationRoles.Administrator)]
public sealed class CreateModel(
    IOrganizationService organizationService) : PageModel
{
    [BindProperty]
    public InputModel Input { get; set; } = new();

    [BindProperty(SupportsGet = true)] public string? Search { get; set; }
    public Dictionary<string, string?> ListFilters => new() { ["Search"] = Search };

    public async Task<IActionResult> OnGetAsync() =>
        User.FindFirstValue(ClaimTypes.NameIdentifier) is { } id && await organizationService.GetMembersAsync(id) is not null
            ? Page()
            : Forbid();

    public async Task<IActionResult> OnPostAddAsync()
    {
        if (!ModelState.IsValid)
        {
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
            if (result.ErrorCode == "Forbidden")
            {
                return Forbid();
            }

            AddError(result.ErrorCode);
            return Page();
        }

        TempData["StatusMessage"] = "Usuário criado.";
        return RedirectToPage("./Index", new { Search });
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
