using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Wscd.Data.Organizations;
using Wscd.Services.Organizations;

namespace Wscd.Data;

public static class DependencyInjection
{
    public static IServiceCollection AddWscdData(this IServiceCollection services, string connectionString)
    {
        services.AddDbContext<WscdDbContext>(options => options.UseNpgsql(connectionString));
        services.AddScoped<IOrganizationStore, OrganizationStore>();
        return services;
    }
}
