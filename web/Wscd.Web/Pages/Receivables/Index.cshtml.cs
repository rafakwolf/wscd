using Wscd.Services.Sales;

namespace Wscd.Web.Pages.Receivables;

public sealed class IndexModel(ReceivableService receivables) : ReceivableFiltersModel
{
    public IReadOnlyList<ReceivableSummary> Accounts { get; private set; } = [];
    public string? Error { get; private set; }

    public async Task OnGetAsync()
    {
        if (!ModelState.IsValid || From > To)
        {
            Error = "Confira as datas de vencimento e a situação selecionadas.";
            return;
        }

        Accounts = await receivables.ListAsync(Customer, From, To, Status, Today);
    }
}
