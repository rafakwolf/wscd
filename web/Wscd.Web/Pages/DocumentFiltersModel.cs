using System.Globalization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Routing;

namespace Wscd.Web.Pages;

public abstract class DocumentFiltersModel : PageModel
{
    [BindProperty(SupportsGet = true)] public bool? Completed { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? From { get; set; }
    [BindProperty(SupportsGet = true)] public DateOnly? To { get; set; }
    [BindProperty(SupportsGet = true)] public string? Search { get; set; }

    public virtual Dictionary<string, string?> ListFilters => new()
    {
        ["Search"] = Search,
        ["From"] = From?.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture),
        ["To"] = To?.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture),
        ["Completed"] = Completed?.ToString()
    };

    protected RouteValueDictionary MaintenanceRoute(int? id) => new(ListFilters) { ["id"] = id };
}
