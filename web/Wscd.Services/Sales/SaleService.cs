using Wscd.Domain.Catalogs;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;
using Wscd.Services.Organizations;
using Wscd.Services.Quotations;

namespace Wscd.Services.Sales;

public sealed class SaleService(
    ISaleStore store,
    IQuotationStore quotations,
    ICatalogService<Customer> customers,
    ICatalogService<Seller> sellers,
    ICatalogService<Product> products,
    IPromotionStore promotions,
    ICurrentOrganization currentOrganization)
{
    // shortcut: limit checkout to ten payment lines for small retail sales.
    public const int MaxPayments = 10;
    private const decimal MaxSaleTotal = 999_999_999_999.99m;

    public Task<IReadOnlyList<SaleSummary>> ListAsync(string? search, DateOnly? from, DateOnly? to, SaleStatus? status) =>
        store.ListAsync(search?.Trim(), from, to, status);

    public Task<Sale?> FindAsync(int id) => store.FindAsync(id);

    public async Task<int?> SaveAsync(int id, int customerId, int sellerId, DateOnly date, string? notes, Guid? expectedRevision = null)
    {
        if (currentOrganization.OrganizationId is not Guid organizationId || id < 0 || date == default ||
            await customers.FindAsync(customerId) is null || await sellers.FindAsync(sellerId) is not { IsActive: true })
        {
            return null;
        }

        Dictionary<int, (Product Product, Domain.Inventory.Promotion? Promotion)>? repricing = null;
        if (id != 0 && await store.FindAsync(id) is { IsCompleted: false, QuotationId: null, Items.Count: > 0 } current && current.Date != date)
        {
            repricing = new Dictionary<int, (Product, Domain.Inventory.Promotion?)>(current.Items.Count);
            foreach (var item in current.Items)
            {
                if (await products.FindAsync(item.ProductId) is not { } product)
                {
                    return null;
                }
                repricing[item.ProductId] = (product, await promotions.FindByProductAsync(item.ProductId));
            }
        }

        bool SetHeader(Sale sale)
        {
            if (!CanChange(sale) || (expectedRevision is Guid rev && sale.Revision != rev))
            {
                return false;
            }

            if (sale.Items.Count > 0 && sale.Date != date)
            {
                if (repricing is null)
                {
                    return false;
                }
                foreach (var item in sale.Items)
                {
                    if (!repricing.TryGetValue(item.ProductId, out var source) ||
                        ItemPricing.Calculate(source.Product, source.Promotion, date, item.Quantity, item.DiscountPercent) is not { } pricing)
                    {
                        return false;
                    }
                    item.UnitPrice = pricing.Price;
                    item.Total = pricing.Total;
                }
            }

            sale.CustomerId = customerId;
            sale.SellerId = sellerId;
            sale.Date = date;
            sale.Notes = string.IsNullOrWhiteSpace(notes) ? null : notes.Trim();
            return true;
        }

        if (id != 0)
        {
            return await store.UpdateAsync(id, SetHeader) ? id : null;
        }

        var draft = new Sale { OrganizationId = organizationId };
        SetHeader(draft);
        return await store.CreateAsync(draft) ? draft.Id : null;
    }

    public async Task<int?> ConvertQuotationAsync(int quotationId, DateOnly date)
    {
        var quotation = await quotations.FindAsync(quotationId);
        if (quotation is not { IsCompleted: true, Items.Count: > 0 } || quotation.Total <= 0 || date == default)
        {
            return null;
        }
        if (quotation.Sale is { } existing)
        {
            return existing.Id;
        }
        if (await sellers.FindAsync(quotation.SellerId) is not { IsActive: true })
        {
            return null;
        }

        var sale = new Sale
        {
            OrganizationId = quotation.OrganizationId,
            CustomerId = quotation.CustomerId,
            SellerId = quotation.SellerId,
            QuotationId = quotation.Id,
            Notes = quotation.Notes,
            Date = date
        };
        sale.Items.AddRange(quotation.Items.Select(item => new SaleItem
        {
            OrganizationId = quotation.OrganizationId,
            ProductId = item.ProductId,
            ProductName = item.ProductName,
            Quantity = item.Quantity,
            UnitPrice = item.UnitPrice,
            DiscountPercent = item.DiscountPercent,
            Total = item.Total
        }));

        return await store.CreateAsync(sale, quotation.Revision)
            ? sale.Id
            : (await quotations.FindAsync(quotationId))?.Sale?.Id;
    }

    public async Task<IReadOnlyList<string>> GetInsufficientStockItemsAsync(int saleId)
    {
        if (await store.FindAsync(saleId) is not { } sale)
        {
            return [];
        }

        var insufficient = new List<string>();
        foreach (var item in sale.Items)
        {
            var product = await products.FindAsync(item.ProductId);
            if (product is null || product.Stock < item.Quantity)
            {
                insufficient.Add($"{item.ProductName} (pedido: {item.Quantity}, estoque: {product?.Stock ?? 0})");
            }
        }
        return insufficient;
    }

    public async Task<bool> AddItemAsync(int id, int productId, int quantity, decimal discountPercent,
        decimal commissionPercent = 0m, Guid? expectedRevision = null)
    {
        if (!ItemPricing.IsValid(quantity, discountPercent) ||
            commissionPercent is < 0 or > 100 || decimal.Round(commissionPercent, 2) != commissionPercent ||
            await products.FindAsync(productId) is not { } product)
        {
            return false;
        }

        var promotion = await promotions.FindByProductAsync(productId);
        return await store.UpdateAsync(id, sale =>
        {
            if (!CanChange(sale) || (expectedRevision is Guid rev && sale.Revision != rev) ||
                sale.Items.Any(item => item.ProductId == productId) ||
                ItemPricing.Calculate(product, promotion, sale.Date, quantity, discountPercent) is not { } pricing)
            {
                return false;
            }

            sale.Items.Add(new SaleItem
            {
                OrganizationId = sale.OrganizationId,
                ProductId = productId,
                ProductName = product.Name,
                Quantity = quantity,
                UnitPrice = pricing.Price,
                DiscountPercent = pricing.Discount,
                CommissionPercent = commissionPercent,
                Total = pricing.Total
            });
            return true;
        });
    }

    public Task<bool> RemoveItemAsync(int id, int itemId, Guid? expectedRevision = null) => store.UpdateAsync(id, sale =>
        CanChange(sale) && (expectedRevision is null || sale.Revision == expectedRevision) &&
        sale.Items.SingleOrDefault(item => item.Id == itemId) is { } item && sale.Items.Remove(item));

    public Task<bool> DeleteDraftAsync(int id) => store.DeleteDraftAsync(id);

    public Task<bool> SetItemCommissionAsync(int id, int itemId, decimal percent, Guid expectedRevision)
    {
        if (percent is < 0 or > 100 || decimal.Round(percent, 2) != percent)
        {
            return Task.FromResult(false);
        }

        return store.UpdateAsync(id, sale =>
        {
            if (sale.IsCompleted || sale.Revision != expectedRevision ||
                sale.Items.SingleOrDefault(item => item.Id == itemId) is not { } item)
            {
                return false;
            }

            item.CommissionPercent = percent;
            return true;
        });
    }

    public async Task<SaleCheckout> CheckoutAsync(int id, IReadOnlyList<SalePaymentInput> payments, Guid expectedRevision, DateOnly? dueDate = null)
    {
        if (await store.FindAsync(id) is not { IsCompleted: false, Items.Count: > 0 } sale ||
            sale.Total is <= 0 or > MaxSaleTotal)
        {
            return SaleCheckout.InvalidSale;
        }
        if (sale.Revision != expectedRevision)
        {
            return SaleCheckout.Conflict;
        }
        if (await sellers.FindAsync(sale.SellerId) is not { IsActive: true })
        {
            return SaleCheckout.InactiveSeller;
        }

        if ((payments.Count == 0 && dueDate is null) || payments.Count > MaxPayments || payments.Any(payment => !payment.IsValid(MaxSaleTotal)))
        {
            return SaleCheckout.InvalidPayments;
        }
        var remaining = sale.Total - payments.Sum(payment => payment.Amount);
        if (remaining < 0 || (remaining > 0 && dueDate is null))
        {
            return SaleCheckout.PaymentTotalMismatch;
        }
        if (dueDate is DateOnly due && (remaining == 0 || due == DateOnly.MinValue || due < sale.Date))
        {
            return SaleCheckout.InvalidDueDate;
        }

        // shortcut: one due date per sale; add installments when a payment schedule is needed.
        var receivable = dueDate is DateOnly date ? new AccountReceivable
        {
            OrganizationId = sale.OrganizationId,
            SaleId = sale.Id,
            CustomerId = sale.CustomerId,
            IssueDate = sale.Date,
            DueDate = date,
            Amount = remaining,
            Balance = remaining
        } : null;

        var completedAt = DateTimeOffset.UtcNow;
        var receipts = payments.Select(payment => new SalePayment
        {
            OrganizationId = sale.OrganizationId,
            SaleId = sale.Id,
            CashAccountId = payment.CashAccountId,
            Method = payment.Method,
            Amount = payment.Amount,
            ReceivedAtUtc = completedAt
        }).ToArray();
        return await store.CheckoutAsync(sale, receipts, receivable, completedAt);
    }

    public async Task<SaleCancellation> CancelAsync(int id, ReversalInput input, Guid? receivableRevision, string? userId)
    {
        var sale = await store.FindAsync(id);
        if (sale is null)
        {
            return SaleCancellation.NotFound;
        }
        if (!sale.IsCompleted || sale.IsCancelled)
        {
            return SaleCancellation.InvalidSale;
        }
        if (sale.Returns.Count != 0)
        {
            return SaleCancellation.HasReturns;
        }
        if (input.Build(userId) is not { } cancellation)
        {
            return SaleCancellation.InvalidReason;
        }
        if (sale.Revision != input.Revision || sale.Receivable?.Revision != receivableRevision)
        {
            return SaleCancellation.Conflict;
        }

        return await store.CancelAsync(sale, cancellation);
    }

    public async Task<SaleReturnReview> ReviewReturnAsync(int id, SaleReturnInput input, string? userId)
    {
        var sale = await store.FindAsync(id);
        if (sale is null)
        {
            return new(SaleReturnResult.NotFound, null);
        }
        if (!sale.IsCompleted || sale.IsCancelled)
        {
            return new(SaleReturnResult.InvalidSale, sale);
        }
        if (sale.Revision != input.Revision || sale.Receivable?.Revision != input.ReceivableRevision)
        {
            return new(SaleReturnResult.Conflict, sale);
        }
        if (input.Build(userId) is not { } audit)
        {
            return new(SaleReturnResult.InvalidReason, sale);
        }

        var result = new SaleReturn
        {
            SaleId = sale.Id,
            OrganizationId = sale.OrganizationId,
            ReturnedAtUtc = audit.AtUtc,
            Reason = audit.Reason,
            UserId = audit.UserId
        };
        var selected = new HashSet<int>();
        foreach (var line in input.Lines.Where(line => line.Quantity != 0))
        {
            var item = sale.Items.SingleOrDefault(item => item.Id == line.SaleItemId);
            if (item is null || line.Quantity < 1 || !selected.Add(line.SaleItemId))
            {
                return new(SaleReturnResult.InvalidItems, sale);
            }
            var returned = sale.ReturnedQuantity(item.Id);
            if (line.Quantity > item.Quantity - returned)
            {
                return new(SaleReturnResult.InvalidItems, sale);
            }

            // Round the cumulative amount so successive returns add up to the original line total.
            decimal Cumulative(int quantity) => decimal.Round(item.Total * quantity / item.Quantity, 2, MidpointRounding.AwayFromZero);
            result.Items.Add(new SaleReturnItem
            {
                OrganizationId = sale.OrganizationId,
                SaleItemId = item.Id,
                Quantity = line.Quantity,
                Restock = line.Restock,
                Amount = Cumulative(returned + line.Quantity) - Cumulative(returned)
            });
        }
        if (result.Items.Count == 0)
        {
            return new(SaleReturnResult.InvalidItems, sale);
        }

        var total = result.Items.Sum(item => item.Amount);
        result.ReceivableReduction = Math.Min(total, sale.Receivable?.Balance ?? 0);
        result.RefundAmount = total - result.ReceivableReduction;
        return new(SaleReturnResult.Ready, sale, result);
    }

    public async Task<SaleReturnReview> RegisterReturnAsync(int id, SaleReturnInput input, string? userId)
    {
        var review = await ReviewReturnAsync(id, input, userId);
        if (review.Sale is not { } sale || review.Return is not { } saleReturn)
        {
            return review;
        }
        if (saleReturn.RefundAmount > 0)
        {
            if (input.CashAccountId is not > 0 || input.RefundMethod is not PaymentMethod method || !Enum.IsDefined(method))
            {
                return review with { Result = SaleReturnResult.InvalidRefund };
            }
            saleReturn.CashAccountId = input.CashAccountId;
            saleReturn.RefundMethod = method;
        }
        return review with { Result = await store.ReturnAsync(sale, saleReturn) };
    }

    private static bool CanChange(Sale sale) => !sale.IsCompleted && sale.QuotationId is null;
}
