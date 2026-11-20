using Microsoft.AspNetCore.Mvc;
using Wscd.Domain.Catalogs;
using Wscd.Services;
using Wscd.Services.Catalogs;

namespace Wscd.Web.Pages.Catalogs.Customers;

public sealed class EditModel(ICatalogService<Customer> catalog) : CatalogEditModel<Customer>(catalog)
{
    public override async Task<IActionResult> OnGetAsync([FromRoute] int? id)
    {
        var result = await base.OnGetAsync(id);
        if (id is null && Input.RegistrationDate == default)
        {
            Input.RegistrationDate = BrasiliaClock.Today;
        }

        return result;
    }
}
