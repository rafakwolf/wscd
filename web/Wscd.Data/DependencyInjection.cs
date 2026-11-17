using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Wscd.Data.Organizations;
using Wscd.Data.Catalogs;
using Wscd.Data.Purchases;
using Wscd.Data.Inventory;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;
using Wscd.Services.Purchases;
using Wscd.Services.Inventory;

namespace Wscd.Data;

public static class DependencyInjection
{
    public static IServiceCollection AddWscdData(this IServiceCollection services, string connectionString)
    {
        services.AddDbContext<WscdDbContext>(options => options.UseNpgsql(connectionString));
        services.AddScoped<IOrganizationStore, OrganizationStore>();
        services.AddScoped(typeof(ICatalogStore<>), typeof(CatalogStore<>));
        services.AddScoped<IPurchaseStore, PurchaseStore>();
        services.AddScoped<IStockLossStore, StockLossStore>();
        services.AddScoped<IPromotionStore, PromotionStore>();
        return services;
    }
}
