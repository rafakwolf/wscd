using Wscd.Domain.Sales;

namespace Wscd.Web.Pages;

public static class PaymentLabels
{
    public static string For(PaymentMethod method) => method switch
    {
        PaymentMethod.Cash => "Dinheiro",
        PaymentMethod.Pix => "Pix",
        PaymentMethod.DebitCard => "Cart\u00e3o de d\u00e9bito",
        PaymentMethod.CreditCard => "Cart\u00e3o de cr\u00e9dito \u00e0 vista",
        _ => "N\u00e3o informado"
    };
}
