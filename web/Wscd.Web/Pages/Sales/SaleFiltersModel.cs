using Microsoft.AspNetCore.Mvc;
using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Sales;

public abstract class SaleFiltersModel : DocumentFiltersModel
{
    [BindProperty(SupportsGet = true)] public SaleStatus? Status { get; set; }

    public override Dictionary<string, string?> ListFilters => new(base.ListFilters) { ["Status"] = Status?.ToString() };
}
