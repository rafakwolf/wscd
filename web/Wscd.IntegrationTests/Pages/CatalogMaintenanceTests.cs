using System.Security.Claims;
using System.Text.Encodings.Web;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Wscd.Domain.Catalogs;
using Wscd.Services.Catalogs;

namespace Wscd.IntegrationTests.Pages;

public sealed class CatalogMaintenanceTests(WebApplicationFactory<Program> factory)
    : IClassFixture<WebApplicationFactory<Program>>
{
    [Fact]
    public async Task ListLinksToSeparateFormsAndKeepsSearchOnReturn()
    {
        using var app = factory.WithWebHostBuilder(builder => builder.ConfigureTestServices(services =>
        {
            services.AddSingleton<ICatalogService<Bank>>(new BankCatalog());
            services.AddAuthentication(options => options.DefaultAuthenticateScheme = "Test")
                .AddScheme<AuthenticationSchemeOptions, SignedInUser>("Test", _ => { });
        }));
        using var client = app.CreateClient();
        var cancellationToken = TestContext.Current.CancellationToken;

        var list = await client.GetStringAsync("/Catalogs/Banks?Search=Demo", cancellationToken);
        Assert.Contains("/Catalogs/Banks/Edit?search=Demo", list, StringComparison.OrdinalIgnoreCase);
        Assert.Contains("/Catalogs/Banks/Edit/4?search=Demo", list, StringComparison.OrdinalIgnoreCase);
        Assert.Contains("handler=Delete", list);
        Assert.DoesNotContain("name=\"Input.Name\"", list);

        var create = await client.GetStringAsync("/Catalogs/Banks/Edit?Search=Demo", cancellationToken);
        Assert.Contains("Novo banco", create);
        Assert.Contains("name=\"Input.Name\"", create);
        Assert.Contains("handler=Save", create);
        Assert.Contains("/Catalogs/Banks?search=Demo", create, StringComparison.OrdinalIgnoreCase);
        Assert.DoesNotContain("handler=Delete", create);

        var edit = await client.GetStringAsync("/Catalogs/Banks/Edit/4?Search=Demo", cancellationToken);
        Assert.Contains("Editar banco", edit);
        Assert.Contains("value=\"Banco Demo\"", edit);
        Assert.Matches("action=\"/Catalogs/Banks/Edit/4\\?[^\"]*handler=Save", edit);
        Assert.Contains("/Catalogs/Banks?search=Demo", edit, StringComparison.OrdinalIgnoreCase);
        Assert.DoesNotContain("handler=Delete", edit);
    }

    private sealed class BankCatalog : ICatalogService<Bank>
    {
        private readonly Bank bank = new() { Id = 4, Name = "Banco Demo" };

        public Task<IReadOnlyList<Bank>> ListAsync(string? search) => Task.FromResult<IReadOnlyList<Bank>>([bank]);
        public Task<Bank?> FindAsync(int id) => Task.FromResult(id == bank.Id ? bank : null);
        public Task<bool> SaveAsync(Bank entity) => throw new NotSupportedException();
        public Task<bool> DeleteAsync(int id) => throw new NotSupportedException();
    }

    private sealed class SignedInUser(IOptionsMonitor<AuthenticationSchemeOptions> options, ILoggerFactory logger, UrlEncoder encoder)
        : AuthenticationHandler<AuthenticationSchemeOptions>(options, logger, encoder)
    {
        protected override Task<AuthenticateResult> HandleAuthenticateAsync()
        {
            var identity = new ClaimsIdentity([new Claim(ClaimTypes.Name, "Operador")], Scheme.Name);
            return Task.FromResult(AuthenticateResult.Success(new AuthenticationTicket(new ClaimsPrincipal(identity), Scheme.Name)));
        }
    }
}
