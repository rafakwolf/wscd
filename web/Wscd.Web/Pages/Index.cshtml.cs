using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Wscd.Web.Pages;

public class IndexModel : PageModel
{
    public IActionResult OnGet()
    {
        return User.FindFirst("organization_id") is not null
            ? Page()
            : RedirectToPage("/Account/OrganizationSetup");
    }
}
