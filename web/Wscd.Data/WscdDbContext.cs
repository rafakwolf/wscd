using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using Wscd.Data.Identity;
using Wscd.Domain.Catalogs;
using Wscd.Domain.Organizations;
using Wscd.Services.Organizations;

namespace Wscd.Data;

public sealed class WscdDbContext(
    DbContextOptions<WscdDbContext> options,
    ICurrentOrganization currentOrganization)
    : IdentityDbContext<ApplicationUser>(options)
{
    public DbSet<Organization> Organizations => Set<Organization>();
    public DbSet<ProductGroup> ProductGroups => Set<ProductGroup>();
    public DbSet<Unit> Units => Set<Unit>();
    public DbSet<Product> Products => Set<Product>();
    public DbSet<Customer> Customers => Set<Customer>();
    public DbSet<Supplier> Suppliers => Set<Supplier>();
    public DbSet<Seller> Sellers => Set<Seller>();
    public DbSet<Bank> Banks => Set<Bank>();
    public DbSet<CashAccount> CashAccounts => Set<CashAccount>();

    public Guid? CurrentOrganizationId => currentOrganization.OrganizationId;

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.Entity<Organization>(entity =>
        {
            entity.ToTable("Organizations");
            entity.HasKey(organization => organization.Id).HasName("PK_Organizations");
            entity.Property(organization => organization.Id).HasColumnName("ID");
            entity.Property(organization => organization.Name).HasMaxLength(160).IsRequired();
            entity.Property(organization => organization.CreatedAtUtc).IsRequired();
            entity.Property(organization => organization.OwnerUserId).HasColumnName("IDOwnerUser");
            entity.HasIndex(organization => organization.OwnerUserId).IsUnique();
            entity.HasOne<ApplicationUser>()
                .WithMany()
                .HasForeignKey(organization => organization.OwnerUserId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        builder.Entity<ApplicationUser>(entity =>
        {
            entity.Property(user => user.OrganizationId).HasColumnName("IDOrganization");
            entity.Property(user => user.IsActive).HasDefaultValue(true).IsRequired();
            entity.HasOne<Organization>()
                .WithMany()
                .HasForeignKey(user => user.OrganizationId)
                .OnDelete(DeleteBehavior.Restrict);
            entity.HasIndex(user => user.OrganizationId);
        });

        ConfigureCatalog<ProductGroup>(builder, "ProductGroups", 80);
        ConfigureCatalog<Unit>(builder, "Units", 10);
        ConfigureCatalog<Product>(builder, "Products", 80);
        ConfigureCatalog<Customer>(builder, "Customers", 80);
        ConfigureCatalog<Supplier>(builder, "Suppliers", 80);
        ConfigureCatalog<Seller>(builder, "Sellers", 80);
        ConfigureCatalog<Bank>(builder, "Banks", 80);
        ConfigureCatalog<CashAccount>(builder, "CashAccounts", 80);

        builder.Entity<Product>(entity =>
        {
            entity.Property(product => product.Barcode).HasMaxLength(13);
            entity.Property(product => product.Reference).HasMaxLength(30);
            entity.Property(product => product.Abbreviation).HasMaxLength(80);
            entity.Property(product => product.SupplierId).HasColumnName("IDSupplier");
            entity.Property(product => product.ProductGroupId).HasColumnName("IDProductGroup");
            entity.Property(product => product.UnitId).HasColumnName("IDUnit");
            entity.Property(product => product.Weight).HasPrecision(12, 3);
            entity.Property(product => product.Cost).HasPrecision(12, 2);
            entity.Property(product => product.MarginPercent).HasPrecision(8, 2);
            entity.Property(product => product.SalePrice).HasPrecision(12, 2);
            entity.Property(product => product.PromotionPrice).HasPrecision(12, 2);
            entity.Property(product => product.Notes).HasColumnType("text");
            entity.HasIndex(product => new { product.OrganizationId, product.Barcode })
                .IsUnique()
                .HasFilter("\"Barcode\" IS NOT NULL");

            entity.HasOne<ProductGroup>()
                .WithMany()
                .HasForeignKey(product => new { product.OrganizationId, product.ProductGroupId })
                .HasPrincipalKey(group => new { group.OrganizationId, group.Id })
                .OnDelete(DeleteBehavior.Restrict);
            entity.HasOne<Unit>()
                .WithMany()
                .HasForeignKey(product => new { product.OrganizationId, product.UnitId })
                .HasPrincipalKey(unit => new { unit.OrganizationId, unit.Id })
                .OnDelete(DeleteBehavior.Restrict);
            entity.HasOne<Supplier>()
                .WithMany()
                .HasForeignKey(product => new { product.OrganizationId, product.SupplierId })
                .HasPrincipalKey(supplier => new { supplier.OrganizationId, supplier.Id })
                .OnDelete(DeleteBehavior.Restrict);
        });

        builder.Entity<Customer>(entity =>
        {
            entity.Property(customer => customer.Type).HasMaxLength(1).IsRequired();
            entity.Property(customer => customer.Address).HasMaxLength(80);
            entity.Property(customer => customer.PostalCode).HasMaxLength(10);
            entity.Property(customer => customer.Neighborhood).HasMaxLength(80);
            entity.Property(customer => customer.Phone).HasMaxLength(30);
            entity.Property(customer => customer.Fax).HasMaxLength(30);
            entity.Property(customer => customer.City).HasMaxLength(80);
            entity.Property(customer => customer.State).HasMaxLength(2);
            entity.Property(customer => customer.TimeAtAddress).HasMaxLength(80);
            entity.Property(customer => customer.TaxNumber).HasMaxLength(20);
            entity.Property(customer => customer.StateRegistrationOrIdentity).HasMaxLength(30);
            entity.Property(customer => customer.Salary).HasPrecision(12, 2);
            entity.Property(customer => customer.CreditLimit).HasPrecision(12, 2);
            entity.Property(customer => customer.Notes).HasColumnType("text");
            entity.Property(customer => customer.PersonalReferences).HasColumnType("text");
            entity.Property(customer => customer.BusinessReferences).HasColumnType("text");
            entity.HasIndex(customer => new { customer.OrganizationId, customer.TaxNumber })
                .IsUnique()
                .HasFilter("\"TaxNumber\" IS NOT NULL");
            entity.HasIndex(customer => new { customer.OrganizationId, customer.StateRegistrationOrIdentity })
                .IsUnique()
                .HasFilter("\"StateRegistrationOrIdentity\" IS NOT NULL");
        });

        builder.Entity<Supplier>(entity =>
        {
            entity.Property(supplier => supplier.LegalName).HasMaxLength(80);
            entity.Property(supplier => supplier.Address).HasMaxLength(80);
            entity.Property(supplier => supplier.City).HasMaxLength(80);
            entity.Property(supplier => supplier.Neighborhood).HasMaxLength(80);
            entity.Property(supplier => supplier.TaxNumber).HasMaxLength(20);
            entity.Property(supplier => supplier.StateRegistration).HasMaxLength(30);
            entity.Property(supplier => supplier.PostalCode).HasMaxLength(10);
            entity.Property(supplier => supplier.Phone).HasMaxLength(30);
            entity.Property(supplier => supplier.Fax).HasMaxLength(30);
            entity.Property(supplier => supplier.Email).HasMaxLength(80);
            entity.Property(supplier => supplier.State).HasMaxLength(2);
            entity.Property(supplier => supplier.Notes).HasColumnType("text");
            entity.Property(supplier => supplier.SalesContact).HasMaxLength(80);
            entity.Property(supplier => supplier.SalesContactPhone).HasMaxLength(30);
            entity.Property(supplier => supplier.SalesContactEmail).HasMaxLength(80);
            entity.Property(supplier => supplier.Type).HasMaxLength(1).IsRequired();
            entity.HasIndex(supplier => new { supplier.OrganizationId, supplier.TaxNumber })
                .IsUnique()
                .HasFilter("\"TaxNumber\" IS NOT NULL");
        });

        builder.Entity<Seller>(entity => entity.Property(seller => seller.IsActive).HasDefaultValue(true));
        builder.Entity<CashAccount>(entity => entity.Property(account => account.IsInactive).HasDefaultValue(false));

        foreach (var entityType in builder.Model.GetEntityTypes()
                     .Where(type => typeof(IOrganizationScoped).IsAssignableFrom(type.ClrType)))
        {
            var property = entityType.ClrType.GetProperty(nameof(IOrganizationScoped.OrganizationId));
            if (property is null)
            {
                continue;
            }

            var entity = Expression.Parameter(entityType.ClrType, "entity");
            var organizationId = Expression.Property(entity, property);
            var currentOrganizationId = Expression.Property(
                Expression.Constant(this),
                nameof(CurrentOrganizationId));
            var filter = Expression.Lambda(
                Expression.Equal(Expression.Convert(organizationId, typeof(Guid?)), currentOrganizationId),
                entity);

            builder.Entity(entityType.ClrType).HasQueryFilter(filter);
        }
    }

    private static void ConfigureCatalog<TEntity>(ModelBuilder builder, string table, int nameLength)
        where TEntity : class, ICatalogEntity
    {
        builder.Entity<TEntity>(entity =>
        {
            entity.ToTable(table);
            entity.HasKey(item => item.Id).HasName($"PK_{table}");
            entity.Property(item => item.Id).HasColumnName("ID").ValueGeneratedOnAdd();
            entity.Property(item => item.OrganizationId).HasColumnName("IDOrganization").IsRequired();
            entity.Property(item => item.Name).HasMaxLength(nameLength).IsRequired();
            entity.HasAlternateKey(item => new { item.OrganizationId, item.Id });
            entity.HasOne<Organization>()
                .WithMany()
                .HasForeignKey(item => item.OrganizationId)
                .OnDelete(DeleteBehavior.Restrict);
        });
    }
}
