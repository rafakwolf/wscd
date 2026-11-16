using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Data.Identity;
using Wscd.Services.Organizations;

namespace Wscd.Web.Pages.Account;

public sealed class RegisterModel(
    IOrganizationService organizationService,
    SignInManager<ApplicationUser> signInManager,
    UserManager<ApplicationUser> userManager) : PageModel
{
    [BindProperty]
    public InputModel Input { get; set; } = new();

    public IActionResult OnGet() => User.Identity?.IsAuthenticated == true
        ? RedirectToPage("/Index")
        : Page();

    public async Task<IActionResult> OnPostAsync()
    {
        if (User.Identity?.IsAuthenticated == true)
        {
            return RedirectToPage("/Index");
        }

        if (!ModelState.IsValid)
        {
            return Page();
        }

        var result = await organizationService.RegisterOwnerAsync(Input.OrganizationName, Input.Email, Input.Password);
        if (!result.Succeeded)
        {
            AddError(result.ErrorCode);
            return Page();
        }

        var user = await userManager.FindByIdAsync(result.UserId!);
        if (user is null)
        {
            ModelState.AddModelError(string.Empty, "A organização foi criada, mas não foi possível iniciar a sessão.");
            return Page();
        }

        await signInManager.SignInAsync(user, isPersistent: false);
        return RedirectToPage("/Index");
    }

    private void AddError(string? errorCode)
    {
        var message = errorCode switch
        {
            "InvalidOrganizationName" => "Informe o nome da organização (até 160 caracteres).",
            "DuplicateEmail" => "Já existe um usuário com esse e-mail.",
            "InvalidEmail" => "Informe um e-mail válido.",
            "PasswordTooShort" => "A senha deve ter pelo menos 12 caracteres.",
            "PasswordPolicy" => "A senha não atende aos requisitos de segurança.",
            _ => "Não foi possível criar a organização e o usuário. Confira os dados e tente novamente."
        };

        ModelState.AddModelError(string.Empty, message);
    }

    public sealed class InputModel
    {
        [Required(ErrorMessage = "Informe o nome da organização.")]
        [StringLength(160, ErrorMessage = "O nome pode ter até 160 caracteres.")]
        [Display(Name = "Nome da organização")]
        public string OrganizationName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Informe o e-mail.")]
        [EmailAddress(ErrorMessage = "Informe um e-mail válido.")]
        [Display(Name = "E-mail do administrador")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Informe uma senha.")]
        [MinLength(12, ErrorMessage = "A senha deve ter pelo menos 12 caracteres.")]
        [DataType(DataType.Password)]
        [Display(Name = "Senha")]
        public string Password { get; set; } = string.Empty;
    }
}
