using Wscd.Domain.Quotations;
using Wscd.Domain.Sales;
using Wscd.Services.Quotations;
using Wscd.Services.Sales;

namespace Wscd.UnitTests;

public sealed class SaleServiceTests
{
    [Fact]
    public async Task ConversionRequiresCompletedQuotationAndCopiesAgreedPricesOnlyOnce()
    {
        var quote = new Quotation { Id = 1, OrganizationId = Guid.NewGuid(), CustomerId = 2, SellerId = 3, Revision = Guid.NewGuid() };
        quote.Items.Add(new QuotationItem { ProductId = 7, ProductName = "Cafe", Quantity = 2, UnitPrice = 12.50m, DiscountPercent = 20m, Total = 20m });
        var store = new Store();
        var service = new SaleService(store, new Quotations(quote), null!, null!, null!, null!, null!);
        var date = new DateOnly(2026, 11, 18);

        Assert.Null(await service.ConvertQuotationAsync(quote.Id, date));
        quote.IsCompleted = true;
        Assert.Equal(42, await service.ConvertQuotationAsync(quote.Id, date));
        var sale = Assert.IsType<Sale>(store.Sale);
        Assert.Equal(quote.Revision, store.QuotationRevision);
        Assert.Equal(quote.Id, sale.QuotationId);
        Assert.Equal(quote.OrganizationId, sale.OrganizationId);
        Assert.Equal(quote.CustomerId, sale.CustomerId);
        Assert.Equal(quote.SellerId, sale.SellerId);
        Assert.False(sale.IsCompleted);
        Assert.Empty(sale.Payments);
        var item = Assert.Single(sale.Items);
        Assert.Equal(12.50m, item.UnitPrice);
        Assert.Equal(20m, item.DiscountPercent);
        Assert.Equal(20m, sale.Total);

        quote.Sale = sale;
        Assert.Equal(42, await service.ConvertQuotationAsync(quote.Id, date));
        Assert.Equal(1, store.Creations);
    }

    [Fact]
    public async Task CheckoutRejectsInvalidPaymentsAndRequiresExactTotalFromStoredItems()
    {
        var sale = new Sale { Id = 1, OrganizationId = Guid.NewGuid(), Revision = Guid.NewGuid() };
        sale.Items.Add(new SaleItem { Total = 8.20m });
        sale.Items.Add(new SaleItem { Total = 6.30m });
        var store = new Store { Sale = sale };
        var service = new SaleService(store, null!, null!, null!, null!, null!, null!);

        var cash = new SalePaymentInput { Method = PaymentMethod.Cash, CashAccountId = 4, Amount = 8.20m };
        var pix = new SalePaymentInput { Method = PaymentMethod.Pix, CashAccountId = 5, Amount = 6.30m };

        Assert.Equal(SaleCheckout.Conflict, await service.CheckoutAsync(sale.Id, [cash, pix], Guid.NewGuid()));
        Assert.Equal(SaleCheckout.InvalidPayments, await service.CheckoutAsync(sale.Id, [], sale.Revision));
        Assert.Equal(SaleCheckout.PaymentTotalMismatch, await service.CheckoutAsync(sale.Id, [cash], sale.Revision));
        pix.Amount = 6.31m;
        Assert.Equal(SaleCheckout.PaymentTotalMismatch, await service.CheckoutAsync(sale.Id, [cash, pix], sale.Revision));
        pix.Amount = 6.301m;
        Assert.Equal(SaleCheckout.InvalidPayments, await service.CheckoutAsync(sale.Id, [cash, pix], sale.Revision));
        pix.Amount = 6.30m;
        pix.Method = (PaymentMethod)99;
        Assert.Equal(SaleCheckout.InvalidPayments, await service.CheckoutAsync(sale.Id, [cash, pix], sale.Revision));
        Assert.Empty(store.Payments);

        pix.Method = PaymentMethod.Pix;
        Assert.Equal(SaleCheckout.Completed, await service.CheckoutAsync(sale.Id, [cash, pix], sale.Revision));
        Assert.Equal(new[] { (4, PaymentMethod.Cash, 8.20m), (5, PaymentMethod.Pix, 6.30m) },
            store.Payments.Select(payment => (payment.CashAccountId, payment.Method, payment.Amount)));
        Assert.All(store.Payments, payment =>
        {
            Assert.Equal(sale.Id, payment.SaleId);
            Assert.Equal(sale.OrganizationId, payment.OrganizationId);
        });
        Assert.Null(store.Receivable);
        Assert.All(store.Payments, payment => Assert.Equal(store.CompletedAt, payment.ReceivedAtUtc));
    }

    [Fact]
    public async Task CheckoutCreatesOnlyTheUnpaidAmountWithAnExplicitValidDueDate()
    {
        var sale = new Sale { Id = 1, Date = new DateOnly(2026, 11, 18), OrganizationId = Guid.NewGuid(), Revision = Guid.NewGuid() };
        sale.Items.Add(new SaleItem { Total = 14.51m });
        var store = new Store { Sale = sale };
        var service = new SaleService(store, null!, null!, null!, null!, null!, null!);
        var entry = new SalePaymentInput { Method = PaymentMethod.Pix, CashAccountId = 5, Amount = 4.50m };
        var due = sale.Date.AddDays(10);

        Assert.Equal(SaleCheckout.InvalidDueDate, await service.CheckoutAsync(sale.Id, [entry], sale.Revision, sale.Date.AddDays(-1)));
        var full = new SalePaymentInput { Method = PaymentMethod.Pix, CashAccountId = 5, Amount = 14.51m };
        Assert.Equal(SaleCheckout.InvalidDueDate, await service.CheckoutAsync(sale.Id, [full], sale.Revision, due));
        Assert.Null(store.Receivable);

        Assert.Equal(SaleCheckout.Completed, await service.CheckoutAsync(sale.Id, [entry], sale.Revision, due));
        var account = Assert.IsType<AccountReceivable>(store.Receivable);
        Assert.Equal((sale.Id, sale.OrganizationId, due, 10.01m, 10.01m),
            (account.SaleId, account.OrganizationId, account.DueDate, account.Amount, account.Balance));
        Assert.Equal(4.50m, Assert.Single(store.Payments).Amount);

        Assert.Equal(SaleCheckout.Completed, await service.CheckoutAsync(sale.Id, [], sale.Revision, due));
        Assert.Empty(store.Payments);
        Assert.Equal(14.51m, store.Receivable!.Balance);
    }

    private sealed class Store : ISaleStore
    {
        public Sale? Sale { get; set; }
        public IReadOnlyList<SalePayment> Payments { get; private set; } = [];
        public AccountReceivable? Receivable { get; private set; }
        public DateTimeOffset CompletedAt { get; private set; }
        public Guid? QuotationRevision { get; private set; }
        public int Creations { get; private set; }

        public Task<bool> CreateAsync(Sale sale, Guid? quotationRevision)
        {
            sale.Id = 42;
            Sale = sale;
            QuotationRevision = quotationRevision;
            Creations++;
            return Task.FromResult(true);
        }

        public Task<SaleCheckout> CheckoutAsync(Sale sale, IReadOnlyList<SalePayment> payments, AccountReceivable? receivable, DateTimeOffset completedAt)
        {
            Payments = payments;
            Receivable = receivable;
            CompletedAt = completedAt;
            return Task.FromResult(SaleCheckout.Completed);
        }

        public Task<Sale?> FindAsync(int id) => Task.FromResult(Sale?.Id == id ? Sale : null);
        public Task<bool> UpdateAsync(int id, Func<Sale, bool> change) => throw new NotSupportedException();
        public Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed) => throw new NotSupportedException();
    }

    private sealed class Quotations(Quotation quote) : IQuotationStore
    {
        public Task<Quotation?> FindAsync(int id) => Task.FromResult<Quotation?>(id == quote.Id ? quote : null);
        public Task<bool> UpdateAsync(int id, Func<Quotation, bool> change) => throw new NotSupportedException();
        public Task<bool> CreateAsync(Quotation quotation) => throw new NotSupportedException();
        public Task<IReadOnlyList<QuotationSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed) => throw new NotSupportedException();
    }
}
