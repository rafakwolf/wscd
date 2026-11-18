using System.Net;
using Microsoft.AspNetCore.Mvc.Testing;

namespace Wscd.IntegrationTests.Pages;

public sealed class HomePageTests(WebApplicationFactory<Program> factory)
    : IClassFixture<WebApplicationFactory<Program>>
{
    [Theory]
    [InlineData("/")]
    [InlineData("/orcamentos")]
    [InlineData("/vendas")]
    [InlineData("/caixa")]
    [InlineData("/contas-a-receber")]
    [InlineData("/contas-a-receber/1")]
    [InlineData("/vendas/manutencao")]
    [InlineData("/Admin/Users/Create")]
    public async Task AnonymousProtectedPage_RedirectsToLogin(string path)
    {
        using var client = factory.CreateClient(new WebApplicationFactoryClientOptions
        {
            AllowAutoRedirect = false
        });
        using var response = await client.GetAsync(path, TestContext.Current.CancellationToken);

        Assert.Equal(HttpStatusCode.Redirect, response.StatusCode);
        Assert.Contains("/Account/Login", response.Headers.Location?.ToString());
    }

    [Fact]
    public async Task LoginPage_ReturnsHtml()
    {
        using var client = factory.CreateClient();
        using var response = await client.GetAsync("/Account/Login", TestContext.Current.CancellationToken);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        Assert.Equal("text/html", response.Content.Headers.ContentType?.MediaType);
    }
}
