using System.ComponentModel.DataAnnotations;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Data.Identity;
using Wscd.Services.Organizations;

namespace Wscd.Web.Pages.Account;

[Authorize(Roles = ApplicationRoles.Administrator)]
public sealed class OrganizationSetupModel(
    IOrganizationService organizationService,
    SignInManager<ApplicationUser> signInManager,
    UserManager<ApplicationUser> userManager) : PageModel
{
    [BindProperty]
    public InputModel Input { get; set; } = new();

    public IActionResult OnGet() => User.FindFirst("organization_id") is not null
        ? RedirectToPage("/Index")
        : Page();

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
            return Page();
        }

        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        if (userId is null)
        {
            return Forbid();
        }

        var result = await organizationService.AttachExistingOwnerAsync(userId, Input.OrganizationName);
        if (!result.Succeeded)
        {
            ModelState.AddModelError(string.Empty, result.ErrorCode == "InvalidOrganizationName"
                ? "Informe o nome da organização (até 160 caracteres)."
                : "Não foi possível associar esta conta a uma organização.");
            return Page();
        }

        var user = await userManager.FindByIdAsync(userId);
        if (user is null)
        {
            return Forbid();
        }

        await signInManager.RefreshSignInAsync(user);
        return RedirectToPage("/Index");
    }

    public sealed class InputModel
    {
        [Required(ErrorMessage = "Informe o nome da organização.")]
        [StringLength(160, ErrorMessage = "O nome pode ter até 160 caracteres.")]
        [Display(Name = "Nome da organização")]
        public string OrganizationName { get; set; } = string.Empty;
    }
}
