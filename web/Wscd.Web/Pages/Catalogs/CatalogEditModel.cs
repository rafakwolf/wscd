using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs;

public class CatalogEditModel<TEntity>(ICatalogService<TEntity> catalog) : PageModel
    where TEntity : class, ICatalogEntity, new()
{
    [BindProperty(SupportsGet = true)] public string? Search { get; set; }
    [BindProperty] public TEntity Input { get; set; } = new();

    public int? Id { get; private set; }
    public Dictionary<string, string?> ListFilters => new() { ["Search"] = Search };
    public IReadOnlyList<string> Cities => CityCatalog.Names;
    public string? UnlistedCity => Input switch
    {
        Customer customer when !string.IsNullOrWhiteSpace(customer.City) &&
                               !Cities.Contains(customer.City, StringComparer.Ordinal) => customer.City,
        Supplier supplier when !string.IsNullOrWhiteSpace(supplier.City) &&
                               !Cities.Contains(supplier.City, StringComparer.Ordinal) => supplier.City,
        _ => null
    };

    public async Task<IActionResult> OnGetAsync([FromRoute] int? id)
    {
        Id = id;
        if (id is int key)
        {
            var item = await catalog.FindAsync(key);
            if (item is null)
            {
                return NotFound();
            }
            Input = item;
        }

        await LoadOptionsAsync();
        return Page();
    }

    public async Task<IActionResult> OnPostSaveAsync([FromRoute] int? id)
    {
        if (id is <= 0)
        {
            return NotFound();
        }

        Id = id;
        Input.Id = id ?? 0;
        if (ModelState.IsValid)
        {
            if (await catalog.SaveAsync(Input))
            {
                TempData["StatusMessage"] = "Cadastro salvo.";
                return RedirectToPage("./Index", new { Search });
            }

            ModelState.AddModelError(string.Empty, "Não foi possível salvar. Verifique a cidade selecionada, dados duplicados ou referências usadas por outros cadastros.");
        }

        await LoadOptionsAsync();
        return Page();
    }

    protected virtual Task LoadOptionsAsync() => Task.CompletedTask;
}
