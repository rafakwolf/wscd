using Wscd.Services.Purchases;

namespace Wscd.Web.Pages.Payables;

public sealed class IndexModel(PayableService payables) : PayableFiltersModel
{
    public IReadOnlyList<PayableSummary> Accounts { get; private set; } = [];
    public string? Error { get; private set; }

    public async Task OnGetAsync()
    {
        if (!ModelState.IsValid || From > To)
        {
            Error = "Confira as datas de vencimento e a situação selecionadas.";
            return;
        }

        Accounts = await payables.ListAsync(Supplier, From, To, Status, Today);
    }
}
