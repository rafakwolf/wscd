using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs;

public abstract class CatalogPageModel<TEntity> : PageModel
    where TEntity : class, ICatalogEntity, new()
{
    private readonly ICatalogService<TEntity> catalog;

    protected ICatalogService<TEntity> Catalog => catalog;

    protected CatalogPageModel(ICatalogService<TEntity> catalog)
    {
        this.catalog = catalog;
    }

    [BindProperty(SupportsGet = true)]
    public string? Search { get; set; }

    [BindProperty]
    public TEntity Input { get; set; } = new();

    public IReadOnlyList<TEntity> Items { get; private set; } = [];

    public string? StatusMessage { get; private set; }
    public string? ErrorMessage { get; private set; }
    public string Title { get; protected set; } = "Cadastros";
    public bool CanDelete { get; protected set; } = true;
    public IReadOnlyList<string> Cities => CityCatalog.Names;
    public string? UnlistedCity => Input switch
    {
        Customer customer when !string.IsNullOrWhiteSpace(customer.City) &&
                               !Cities.Contains(customer.City, StringComparer.Ordinal) => customer.City,
        Supplier supplier when !string.IsNullOrWhiteSpace(supplier.City) &&
                               !Cities.Contains(supplier.City, StringComparer.Ordinal) => supplier.City,
        _ => null
    };

    public CatalogListViewModel ListView => new(
        Title,
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

    public async Task<IActionResult> OnPostEditAsync(int id)
    {
        var item = await catalog.FindAsync(id);
        if (item is null)
        {
            return NotFound();
        }

        Input = item;
        await LoadAsync();
        return Page();
    }

    public async Task<IActionResult> OnPostSaveAsync()
    {
        if (!ModelState.IsValid)
        {
            await LoadAsync();
            return Page();
        }

        await PrepareToSaveAsync();
        if (!await catalog.SaveAsync(Input))
        {
            ModelState.AddModelError(string.Empty, "Não foi possível salvar. Verifique a cidade selecionada, dados duplicados ou referências usadas por outros cadastros.");
            await LoadAsync();
            return Page();
        }

        TempData["StatusMessage"] = "Cadastro salvo.";
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostDeleteAsync(int id)
    {
        if (!await catalog.DeleteAsync(id))
        {
            TempData["ErrorMessage"] = "Não foi possível excluir. O cadastro pode estar sendo usado por outro módulo.";
            return RedirectToPage(new { Search });
        }

        TempData["StatusMessage"] = "Cadastro excluído.";
        return RedirectToPage(new { Search });
    }

    protected virtual Task PrepareToSaveAsync() => Task.CompletedTask;
    protected virtual Task LoadAdditionalDataAsync() => Task.CompletedTask;

    private async Task LoadAsync()
    {
        Items = await catalog.ListAsync(Search);
        StatusMessage = TempData["StatusMessage"] as string;
        ErrorMessage = TempData["ErrorMessage"] as string;
        await LoadAdditionalDataAsync();
    }
}

public sealed record CatalogListViewModel(
    string Title,
    string? Search,
    string? StatusMessage,
    string? ErrorMessage,
    bool CanDelete,
    IReadOnlyList<CatalogListRow> Rows);

public sealed record CatalogListRow(int Id, string Name, string? Status);
