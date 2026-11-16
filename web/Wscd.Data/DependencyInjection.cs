using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Wscd.Data.Organizations;
using Wscd.Data.Catalogs;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;

namespace Wscd.Data;

public static class DependencyInjection
{
    public static IServiceCollection AddWscdData(this IServiceCollection services, string connectionString)
    {
        services.AddDbContext<WscdDbContext>(options => options.UseNpgsql(connectionString));
        services.AddScoped<IOrganizationStore, OrganizationStore>();
        services.AddScoped(typeof(ICatalogStore<>), typeof(CatalogStore<>));
        return services;
    }
}
