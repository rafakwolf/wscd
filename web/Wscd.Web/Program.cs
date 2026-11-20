using Microsoft.AspNetCore.Identity;
using Wscd.Data;
using Wscd.Data.Identity;
using Wscd.Services.Catalogs;
using Wscd.Services.Organizations;
using Wscd.Services.Purchases;
using Wscd.Services.Inventory;
using Wscd.Services.Reports;
using Wscd.Services.DemoData;
using Wscd.Services.Quotations;
using Wscd.Services.Sales;
using Wscd.Web.Organizations;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection")
    ?? throw new InvalidOperationException("ConnectionStrings:DefaultConnection não foi configurada.");

builder.Services.AddWscdData(connectionString);
builder.Services.AddScoped<IOrganizationService, OrganizationService>();
builder.Services.AddScoped(typeof(ICatalogService<>), typeof(CatalogService<>));
builder.Services.AddScoped<IPurchaseService, PurchaseService>();
builder.Services.AddScoped<IStockLossService, StockLossService>();
builder.Services.AddScoped<IPromotionService, PromotionService>();
builder.Services.AddScoped<IStockReportService, StockReportService>();
builder.Services.AddScoped<CashReportService>();
builder.Services.AddScoped<SellerCommissionService>();
builder.Services.AddScoped<PeriodSalesReportService>();
builder.Services.AddScoped<TitlePositionReportService>();
builder.Services.AddScoped<QuotationService>();
builder.Services.AddScoped<SaleService>();
builder.Services.AddScoped<ReceivableService>();
builder.Services.AddScoped<PayableService>();
builder.Services.AddScoped<DemoDataSeeder>();
builder.Services.AddHttpContextAccessor();
builder.Services.AddScoped<ICurrentOrganization, HttpCurrentOrganization>();
builder.Services.AddIdentityCore<ApplicationUser>(options =>
    {
        options.User.RequireUniqueEmail = true;
        options.SignIn.RequireConfirmedAccount = false;
        options.Password.RequiredLength = 12;
        options.Password.RequireDigit = false;
        options.Password.RequireLowercase = false;
        options.Password.RequireUppercase = false;
        options.Password.RequireNonAlphanumeric = false;
        options.Lockout.AllowedForNewUsers = true;
        options.Lockout.MaxFailedAccessAttempts = 5;
        options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(15);
    })
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<WscdDbContext>()
    .AddSignInManager();
builder.Services.AddScoped<IUserClaimsPrincipalFactory<ApplicationUser>, OrganizationClaimsPrincipalFactory>();

builder.Services
    .AddAuthentication(IdentityConstants.ApplicationScheme)
    .AddIdentityCookies();
builder.Services.ConfigureApplicationCookie(options =>
{
    options.Cookie.Name = "WSCD.Auth";
    options.LoginPath = "/Account/Login";
    options.AccessDeniedPath = "/Account/AccessDenied";
    options.ExpireTimeSpan = TimeSpan.FromHours(8);
    options.SlidingExpiration = true;
});
builder.Services.Configure<SecurityStampValidatorOptions>(options =>
    options.ValidationInterval = TimeSpan.FromSeconds(30));
builder.Services.AddAuthorization(options => options.FallbackPolicy = options.DefaultPolicy);
builder.Services.AddRazorPages(options =>
{
    options.Conventions.AllowAnonymousToPage("/Account/Login");
    options.Conventions.AllowAnonymousToPage("/Account/AccessDenied");
    options.Conventions.AllowAnonymousToPage("/Account/Register");
    options.Conventions.AllowAnonymousToPage("/Error");
});

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
}

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapStaticAssets().AllowAnonymous();
app.MapRazorPages().WithStaticAssets();

app.Run();
