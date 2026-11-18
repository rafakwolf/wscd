using Wscd.Domain.Catalogs;
using Wscd.Domain.Purchases;
using Wscd.Domain.Quotations;
using Wscd.Domain.Sales;
using Wscd.Services.Catalogs;
using Wscd.Services.Inventory;
using Wscd.Services.Purchases;
using Wscd.Services.Quotations;
using Wscd.Services.Sales;

namespace Wscd.Services.DemoData;

public sealed class DemoDataSeeder(
    ICatalogService<ProductGroup> groups,
    ICatalogService<Unit> units,
    ICatalogService<Supplier> suppliers,
    ICatalogService<Customer> customers,
    ICatalogService<Seller> sellers,
    ICatalogService<Bank> banks,
    ICatalogService<CashAccount> cashAccounts,
    ICatalogService<Product> products,
    IPurchaseService purchases,
    IStockLossService losses,
    IPromotionService promotions,
    QuotationService quotations,
    SaleService sales)
{
    private const string Prefix = "DEMO · ";
    private const string CompletedPurchaseMarker = "Carga de demonstração WSCD: compra concluída";
    private const string DraftPurchaseMarker = "Carga de demonstração WSCD: compra em rascunho";
    private const string StockLossMarker = "Carga de demonstração WSCD: perda de teste";

    private static readonly string[] ProductNames =
    [
        "Café 500 g", "Arroz 5 kg", "Chocolate 90 g", "Açúcar 1 kg", "Feijão 1 kg",
        "Macarrão 500 g", "Óleo 900 ml", "Farinha 1 kg", "Leite 1 l", "Biscoito 300 g"
    ];

    public async Task SeedAsync()
    {
        var demoGroups = await EnsureManyAsync(groups, index => new ProductGroup
        {
            Name = index == 1 ? Prefix + "Mercearia" : $"{Prefix}Grupo {index:00}"
        });
        var demoUnits = await EnsureManyAsync(units, index => new Unit
        {
            Name = index == 1 ? "UN" : $"UN-{index:00}"
        });
        var demoSuppliers = await EnsureManyAsync(suppliers, index => new Supplier
        {
            Name = index == 1 ? Prefix + "Distribuidora" : $"{Prefix}Distribuidora {index:00}",
            LegalName = $"{Prefix}Empresa {index:00} Ltda.",
            Email = index == 1 ? "fornecedor@exemplo.invalid" : $"fornecedor{index:00}@exemplo.invalid",
            Phone = "0000000000",
            Notes = "Registro fictício para testes."
        });

        var demoCustomers = await EnsureManyAsync(customers, index => new Customer
        {
            Name = index == 1 ? Prefix + "Cliente balcão" : $"{Prefix}Cliente {index:00}",
            Type = "F",
            Email = index == 1 ? "cliente@exemplo.invalid" : $"cliente{index:00}@exemplo.invalid",
            Phone = "0000000000",
            RegistrationDate = DateOnly.FromDateTime(DateTime.Today).AddDays(-index),
            Notes = "Registro fictício para testes."
        });
        var demoSellers = await EnsureManyAsync(sellers, index => new Seller
        {
            Name = index == 1 ? Prefix + "Vendedor" : $"{Prefix}Vendedor {index:00}"
        });
        await EnsureManyAsync(banks, index => new Bank
        {
            Name = index == 1 ? Prefix + "Banco" : $"{Prefix}Banco {index:00}"
        });
        var demoCashAccounts = await EnsureManyAsync(cashAccounts, index => new CashAccount
        {
            Name = index == 1 ? Prefix + "Caixa principal" : $"{Prefix}Caixa {index:00}"
        });

        var demoProducts = await EnsureManyAsync(products, index => new Product
        {
            Name = Prefix + ProductNames[index - 1],
            Reference = $"DEMO-{index:000}",
            SupplierId = demoSuppliers[index <= 3 ? 0 : index - 1].Id,
            ProductGroupId = demoGroups[index <= 3 ? 0 : index - 1].Id,
            UnitId = demoUnits[index <= 3 ? 0 : index - 1].Id,
            Cost = index switch { 1 => 12.50m, 2 => 20m, 3 => 5m, _ => index + 3m },
            MarginPercent = index switch { 1 => 40m, 2 => 30m, 3 => 50m, _ => 25m },
            Stock = index switch { 1 => 2, 2 => 8, 3 => 6, _ when index % 2 == 0 => 12, _ => 2 },
            MinimumStock = index switch { 1 => 5, 2 => 3, 3 => 2, _ when index % 2 == 0 => 3, _ => 5 }
        });

        var today = DateOnly.FromDateTime(DateTime.Today);
        for (var index = 1; index <= 10; index++)
        {
            var completed = index % 2 == 0;
            var supplier = demoSuppliers[index <= 3 ? 0 : index - 1];
            var product = demoProducts[index - 1];
            var marker = index switch
            {
                1 => DraftPurchaseMarker,
                2 => CompletedPurchaseMarker,
                _ => $"Carga de demonstração WSCD: compra {index:00}"
            };

            await EnsurePurchaseAsync(
                supplier,
                product,
                index == 1 ? 4 : index == 2 ? 10 : 5 + index,
                index == 1 ? 12.50m : index == 2 ? 20m : product.Cost,
                today.AddDays(-index),
                marker,
                completed);
        }

        var existingLossNotes = (await losses.ListAsync(null, null))
            .Select(loss => loss.Notes)
            .ToHashSet(StringComparer.Ordinal);
        for (var index = 1; index <= 10; index++)
        {
            var marker = index == 2 ? StockLossMarker : $"{StockLossMarker} {index:00}";
            if (!existingLossNotes.Add(marker))
            {
                continue;
            }

            var result = await losses.CreateAsync(demoProducts[index - 1].Id, 1, today, "D", marker);
            if (!result.Succeeded)
            {
                throw new InvalidOperationException($"Não foi possível registrar a perda fictícia {index:00}.");
            }
        }

        var existingPromotionNames = (await promotions.ListAsync())
            .Select(promotion => promotion.ProductName)
            .ToHashSet(StringComparer.Ordinal);
        for (var index = 0; index < demoProducts.Count; index++)
        {
            var product = demoProducts[index];
            if (!existingPromotionNames.Add(product.Name))
            {
                continue;
            }

            var result = await promotions.SaveAsync(0, product.Id, 10, today.AddDays(-1), today.AddDays(30));
            if (!result.Succeeded)
            {
                throw new InvalidOperationException($"Não foi possível criar a promoção fictícia {index + 1:00}.");
            }
        }

        for (var index = 0; index < demoProducts.Count; index++)
        {
            var customer = demoCustomers[index];
            var marker = $"Carga de demonstração WSCD: orçamento {index + 1:00}";
            var existing = await quotations.ListAsync(customer.Name, null, null, null);
            Quotation? draft = null;
            foreach (var summary in existing)
            {
                if (await quotations.FindAsync(summary.Id) is { } candidate && candidate.Notes == marker)
                {
                    draft = candidate;
                    break;
                }
            }
            if (draft is { Items.Count: > 0 })
            {
                continue;
            }

            if ((draft?.Id ?? await quotations.SaveAsync(0, customer.Id, demoSellers[index].Id, today.AddDays(-index), marker)) is not int id ||
                !await quotations.AddItemAsync(id, demoProducts[index].Id, index + 1, index) ||
                (index % 2 == 1 && !await quotations.SetCompletedAsync(id, true)))
            {
                throw new InvalidOperationException($"Não foi possível criar o orçamento fictício {index + 1:00}.");
            }
        }

        for (var index = 0; index < demoProducts.Count; index++)
        {
            var customer = demoCustomers[index];
            var marker = $"Carga de demonstração WSCD: venda {index + 1:00}";
            Sale? sale = null;
            foreach (var summary in await sales.ListAsync(customer.Name, null, null, null))
            {
                if (await sales.FindAsync(summary.Id) is { } candidate && candidate.Notes == marker)
                {
                    sale = candidate;
                    break;
                }
            }

            var id = sale?.Id ?? await sales.SaveAsync(0, customer.Id, demoSellers[index].Id, today.AddDays(-index), marker);
            if (id is not int saleId ||
                ((sale is null || sale.Items.Count == 0) && !await sales.AddItemAsync(saleId, demoProducts[index].Id, 1, 0)))
            {
                throw new InvalidOperationException($"Não foi possível criar a venda fictícia {index + 1:00}.");
            }

            if (index % 2 == 1 && sale?.IsCompleted != true &&
                (await sales.FindAsync(saleId) is not { } draft ||
                    await sales.CheckoutAsync(saleId, demoCashAccounts[index].Id, draft.Revision) != SaleCheckout.Completed))
            {
                throw new InvalidOperationException($"Não foi possível concluir a venda fictícia {index + 1:00}. Confira o estoque e a conta caixa de demonstração.");
            }
        }
    }

    private static async Task<List<TEntity>> EnsureManyAsync<TEntity>(
        ICatalogService<TEntity> service,
        Func<int, TEntity> create)
        where TEntity : class, ICatalogEntity
    {
        var result = new List<TEntity>(10);
        for (var index = 1; index <= 10; index++)
        {
            result.Add(await EnsureAsync(service, create(index)));
        }

        return result;
    }

    private static async Task<TEntity> EnsureAsync<TEntity>(ICatalogService<TEntity> service, TEntity candidate)
        where TEntity : class, ICatalogEntity
    {
        var existing = (await service.ListAsync(candidate.Name))
            .FirstOrDefault(item => item.Name == candidate.Name);
        if (existing is not null)
        {
            return existing;
        }

        if (!await service.SaveAsync(candidate))
        {
            throw new InvalidOperationException($"Não foi possível criar o cadastro fictício '{candidate.Name}'.");
        }

        return candidate;
    }

    private async Task EnsurePurchaseAsync(
        Supplier supplier,
        Product product,
        int quantity,
        decimal unitCost,
        DateOnly date,
        string marker,
        bool complete)
    {
        Purchase? purchase = null;
        foreach (var summary in await purchases.ListAsync(null, null, null, supplier.Name))
        {
            var candidate = await purchases.FindAsync(summary.Id);
            if (candidate?.Notes == marker)
            {
                purchase = candidate;
                break;
            }
        }

        if (purchase is null)
        {
            var result = await purchases.SaveDraftAsync(0, supplier.Id, date, date.AddDays(30), marker);
            if (!result.Succeeded || result.PurchaseId is not int purchaseId)
            {
                throw new InvalidOperationException("Não foi possível criar uma compra fictícia.");
            }

            purchase = await purchases.FindAsync(purchaseId)
                ?? throw new InvalidOperationException("A compra fictícia não foi encontrada após a criação.");
        }

        if (!purchase.IsCompleted && purchase.Items.All(item => item.ProductId != product.Id))
        {
            var result = await purchases.AddItemAsync(purchase.Id, product.Id, quantity, unitCost);
            if (!result.Succeeded)
            {
                throw new InvalidOperationException("Não foi possível adicionar um produto à compra fictícia.");
            }
        }

        if (complete && !purchase.IsCompleted)
        {
            var result = await purchases.CompleteAsync(purchase.Id);
            if (!result.Succeeded)
            {
                throw new InvalidOperationException("Não foi possível concluir uma compra fictícia.");
            }
        }
    }
}
