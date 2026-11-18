using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs;

public abstract class CatalogPageModel<TEntity> : PageModel
    where TEntity : class, ICatalogEntity, new()
{
    private readonly ICatalogService<TEntity> catalog;

    protected CatalogPageModel(ICatalogService<TEntity> catalog)
    {
        this.catalog = catalog;
    }

    [BindProperty(SupportsGet = true)]
    public string? Search { get; set; }

    public IReadOnlyList<TEntity> Items { get; private set; } = [];

    public string? StatusMessage { get; private set; }
    public string? ErrorMessage { get; private set; }
    public string Title { get; protected set; } = "Cadastros";
    public string NewLabel { get; protected set; } = "Novo cadastro";
    public bool CanDelete { get; protected set; } = true;

    public CatalogListViewModel ListView => new(
        Title,
        NewLabel,
        Search,
        StatusMessage,
        ErrorMessage,
        CanDelete,
        Items.Select(item => new CatalogListRow(
            item.Id,
            item.Name,
            item switch
            {
                Seller seller => seller.IsActive ? "Ativo" : "Inativo",
                CashAccount account => account.IsInactive ? "Inativo" : "Ativo",
                _ => null
            })).ToArray());

    public async Task<IActionResult> OnGetAsync()
    {
        await LoadAsync();
        return Page();
    }

    public async Task<IActionResult> OnPostDeleteAsync(int id)
    {
        if (!CanDelete)
        {
            return NotFound();
        }
        if (!await catalog.DeleteAsync(id))
        {
            TempData["ErrorMessage"] = "Não foi possível excluir. O cadastro pode estar sendo usado por outro módulo.";
            return RedirectToPage(new { Search });
        }

        TempData["StatusMessage"] = "Cadastro excluído.";
        return RedirectToPage(new { Search });
    }

    private async Task LoadAsync()
    {
        Items = await catalog.ListAsync(Search);
        StatusMessage = TempData["StatusMessage"] as string;
        ErrorMessage = TempData["ErrorMessage"] as string;
    }
}

public sealed record CatalogListViewModel(
    string Title,
    string NewLabel,
    string? Search,
    string? StatusMessage,
    string? ErrorMessage,
    bool CanDelete,
    IReadOnlyList<CatalogListRow> Rows);

public sealed record CatalogListRow(int Id, string Name, string? Status);
