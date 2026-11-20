using Wscd.Domain.Catalogs;
using Wscd.Domain.Quotations;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
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
        var service = new SaleService(store, new Quotations(quote), null!, new Sellers(), null!, null!, null!);
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
        var service = new SaleService(store, null!, null!, new Sellers(), null!, null!, null!);

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
        var service = new SaleService(store, null!, null!, new Sellers(), null!, null!, null!);
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

    [Fact]
    public async Task CancellationRequiresACompletedSaleWithReasonAndCurrentReceivable()
    {
        var sale = new Sale { Id = 1, Revision = Guid.NewGuid(), Receivable = new() { Revision = Guid.NewGuid() } };
        var store = new Store { Sale = sale };
        var service = new SaleService(store, null!, null!, new Sellers(), null!, null!, null!);
        var input = new ReversalInput { Revision = sale.Revision, Reason = "  Compra desfeita  " };
        var titleRevision = sale.Receivable.Revision;

        Assert.Equal(SaleCancellation.NotFound, await service.CancelAsync(99, input, titleRevision, "user"));
        Assert.Equal(SaleCancellation.InvalidSale, await service.CancelAsync(sale.Id, input, titleRevision, "user"));
        sale.CompletedAtUtc = DateTimeOffset.UtcNow;
        Assert.Equal(SaleCancellation.InvalidReason, await service.CancelAsync(sale.Id, input, titleRevision, null));
        Assert.Equal(SaleCancellation.InvalidReason, await service.CancelAsync(sale.Id,
            new ReversalInput { Revision = sale.Revision, Reason = "  " }, titleRevision, "user"));
        Assert.Equal(SaleCancellation.Conflict, await service.CancelAsync(sale.Id, input, null, "user"));
        Assert.Equal(SaleCancellation.Conflict, await service.CancelAsync(sale.Id,
            new ReversalInput { Revision = Guid.NewGuid(), Reason = input.Reason }, titleRevision, "user"));
        Assert.Null(store.Cancellation);

        Assert.Equal(SaleCancellation.Cancelled, await service.CancelAsync(sale.Id, input, titleRevision, "user"));
        var cancellation = Assert.IsType<SettlementReversal>(store.Cancellation);
        Assert.Equal(("Compra desfeita", "user"), (cancellation.Reason, cancellation.UserId));
        Assert.Equal(SaleCancellation.InvalidSale, await service.CancelAsync(sale.Id, input, titleRevision, "user"));
    }

    [Fact]
    public async Task ReturnsPreserveTheOriginalLineTotalAcrossPartialQuantities()
    {
        var sale = new Sale
        {
            Id = 1,
            CompletedAtUtc = DateTimeOffset.UtcNow,
            Revision = Guid.NewGuid(),
            Receivable = new() { Balance = 4m, Revision = Guid.NewGuid() }
        };
        sale.Items.Add(new SaleItem { Id = 2, Quantity = 3, Total = 10m });
        var store = new Store { Sale = sale };
        var service = new SaleService(store, null!, null!, new Sellers(), null!, null!, null!);
        var line = new SaleReturnLineInput { SaleItemId = 2, Quantity = 1, Restock = true };
        var input = new SaleReturnInput
        {
            Reason = " Cliente devolveu ",
            Revision = sale.Revision,
            ReceivableRevision = sale.Receivable.Revision,
            Lines = [line]
        };

        Assert.Equal(SaleReturnResult.Conflict, (await service.ReviewReturnAsync(1,
            new SaleReturnInput { Revision = sale.Revision }, "user")).Result);
        Assert.Equal(SaleReturnResult.InvalidReason, (await service.ReviewReturnAsync(1, input, null)).Result);
        line.Quantity = 4;
        Assert.Equal(SaleReturnResult.InvalidItems, (await service.ReviewReturnAsync(1, input, "user")).Result);
        line.Quantity = 1;
        input.Lines.Add(line);
        Assert.Equal(SaleReturnResult.InvalidItems, (await service.ReviewReturnAsync(1, input, "user")).Result);
        input.Lines.RemoveAt(1);

        var first = await service.RegisterReturnAsync(1, input, "user");
        Assert.Equal(SaleReturnResult.Recorded, first.Result);
        Assert.Equal((3.33m, 0m), (first.Return!.ReceivableReduction, first.Return.RefundAmount));
        Assert.True(Assert.Single(first.Return.Items).Restock);
        Assert.Equal(SaleReturnResult.Conflict, (await service.RegisterReturnAsync(1, input, "user")).Result);

        input.Revision = sale.Revision;
        input.ReceivableRevision = sale.Receivable.Revision;
        Assert.Equal(SaleReturnResult.InvalidRefund, (await service.RegisterReturnAsync(1, input, "user")).Result);
        input.CashAccountId = 7;
        input.RefundMethod = PaymentMethod.Pix;
        line.Restock = false;
        var second = await service.RegisterReturnAsync(1, input, "user");
        Assert.Equal(SaleReturnResult.Recorded, second.Result);
        Assert.Equal((0.67m, 2.67m, 7, PaymentMethod.Pix),
            (second.Return!.ReceivableReduction, second.Return.RefundAmount, second.Return.CashAccountId, second.Return.RefundMethod));
        Assert.False(Assert.Single(second.Return.Items).Restock);

        input.Revision = sale.Revision;
        input.ReceivableRevision = sale.Receivable.Revision;
        Assert.Equal(SaleReturnResult.Recorded, (await service.RegisterReturnAsync(1, input, "user")).Result);
        Assert.Equal(10m, sale.Returns.Sum(saleReturn => saleReturn.Total));
        Assert.Equal(3, sale.ReturnedQuantity(2));
        input.Revision = sale.Revision;
        input.ReceivableRevision = sale.Receivable.Revision;
        Assert.Equal(SaleReturnResult.InvalidItems, (await service.RegisterReturnAsync(1, input, "user")).Result);
        Assert.Equal(SaleCancellation.HasReturns, await service.CancelAsync(1, input, input.ReceivableRevision, "user"));
    }

    [Fact]
    public async Task ItemCommissionCanBeSetOnAConvertedDraftButNotAfterCheckout()
    {
        var sale = new Sale { Id = 1, QuotationId = 3, Revision = Guid.NewGuid() };
        var item = new SaleItem { Id = 2, Total = 30m };
        sale.Items.Add(item);
        var service = new SaleService(new Store { Sale = sale }, null!, null!, null!, null!, null!, null!);
        var revision = sale.Revision;

        Assert.False(await service.SetItemCommissionAsync(1, 2, -1m, revision));
        Assert.False(await service.SetItemCommissionAsync(1, 2, 100.01m, revision));
        Assert.False(await service.SetItemCommissionAsync(1, 2, 1.001m, revision));
        Assert.False(await service.SetItemCommissionAsync(1, 99, 10m, revision));
        Assert.True(await service.SetItemCommissionAsync(1, 2, 7.25m, revision));
        Assert.Equal(30m, sale.Total);
        Assert.False(await service.SetItemCommissionAsync(1, 2, 10m, revision));

        sale.CompletedAtUtc = DateTimeOffset.UtcNow;
        Assert.False(await service.SetItemCommissionAsync(1, 2, 10m, sale.Revision));
        Assert.Equal(7.25m, item.CommissionPercent);
    }

    [Fact]
    public async Task InactiveSellerIsRejectedOnQuotationConversionAndCheckout()
    {
        var quote = new Quotation
        {
            Id = 1,
            OrganizationId = Guid.NewGuid(),
            CustomerId = 2,
            SellerId = 99,
            IsCompleted = true,
            Revision = Guid.NewGuid()
        };
        quote.Items.Add(new QuotationItem { ProductId = 7, ProductName = "Cafe", Quantity = 1, UnitPrice = 10m, Total = 10m });
        var sale = new Sale { Id = 1, SellerId = 99, OrganizationId = quote.OrganizationId, Revision = Guid.NewGuid() };
        sale.Items.Add(new SaleItem { Total = 10m });
        var store = new Store { Sale = sale };
        var service = new SaleService(store, new Quotations(quote), null!, new Sellers(), null!, null!, null!);

        Assert.Null(await service.ConvertQuotationAsync(quote.Id, new DateOnly(2026, 11, 18)));
        Assert.Equal(SaleCheckout.InactiveSeller, await service.CheckoutAsync(
            sale.Id,
            [new SalePaymentInput { Method = PaymentMethod.Cash, CashAccountId = 1, Amount = 10m }],
            sale.Revision));
    }

    private sealed class Store : ISaleStore
    {
        public Sale? Sale { get; set; }
        public IReadOnlyList<SalePayment> Payments { get; private set; } = [];
        public AccountReceivable? Receivable { get; private set; }
        public DateTimeOffset CompletedAt { get; private set; }
        public Guid? QuotationRevision { get; private set; }
        public int Creations { get; private set; }
        public SettlementReversal? Cancellation { get; private set; }

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
        public Task<bool> UpdateAsync(int id, Func<Sale, bool> change)
        {
            if (Sale is not { } sale || sale.Id != id || !change(sale))
            {
                return Task.FromResult(false);
            }
            sale.Revision = Guid.NewGuid();
            return Task.FromResult(true);
        }
        public Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, SaleStatus? status) => throw new NotSupportedException();

        public Task<SaleCancellation> CancelAsync(Sale sale, SettlementReversal cancellation)
        {
            Cancellation = cancellation;
            sale.CancelledAtUtc = cancellation.AtUtc;
            return Task.FromResult(SaleCancellation.Cancelled);
        }

        public Task<SaleReturnResult> ReturnAsync(Sale sale, SaleReturn saleReturn)
        {
            sale.Returns.Add(saleReturn);
            sale.Revision = Guid.NewGuid();
            if (sale.Receivable is { } title)
            {
                title.Balance -= saleReturn.ReceivableReduction;
                title.Revision = Guid.NewGuid();
            }
            return Task.FromResult(SaleReturnResult.Recorded);
        }

        public Task<bool> DeleteDraftAsync(int id) => throw new NotSupportedException();
    }

    private sealed class Quotations(Quotation quote) : IQuotationStore
    {
        public Task<Quotation?> FindAsync(int id) => Task.FromResult<Quotation?>(id == quote.Id ? quote : null);
        public Task<bool> UpdateAsync(int id, Func<Quotation, bool> change) => throw new NotSupportedException();
        public Task<bool> CreateAsync(Quotation quotation) => throw new NotSupportedException();
        public Task<IReadOnlyList<QuotationSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, bool? completed) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }

    private sealed class Sellers : ICatalogService<Seller>
    {
        public Task<Seller?> FindAsync(int id) => Task.FromResult<Seller?>(new Seller { Id = id, Name = "Vendedor", IsActive = id != 99 });
        public Task<IReadOnlyList<Seller>> ListAsync(string? search) => throw new NotSupportedException();
        public Task<bool> SaveAsync(Seller entity) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }
}
