using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Services.DemoData;

namespace Wscd.Web.Pages.Development;

[Authorize]
public sealed class DemoDataModel(IWebHostEnvironment environment, DemoDataSeeder seeder) : PageModel
{
    public string? StatusMessage { get; private set; }

    public IActionResult OnGet()
    {
        if (!environment.IsDevelopment())
        {
            return NotFound();
        }

        StatusMessage = TempData["StatusMessage"] as string;
        return Page();
    }

    public async Task<IActionResult> OnPostSeedAsync()
    {
        if (!environment.IsDevelopment())
        {
            return NotFound();
        }

        try
        {
            await seeder.SeedAsync();
            TempData["StatusMessage"] = "Dados fictícios criados ou já existentes na organização atual.";
            return RedirectToPage();
        }
        catch (InvalidOperationException exception)
        {
            ModelState.AddModelError(string.Empty, exception.Message);
            return Page();
        }
    }
}
