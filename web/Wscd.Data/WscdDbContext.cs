using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using Wscd.Data.Identity;
using Wscd.Domain.Organizations;
using Wscd.Services.Organizations;

namespace Wscd.Data;

public sealed class WscdDbContext(
    DbContextOptions<WscdDbContext> options,
    ICurrentOrganization currentOrganization)
    : IdentityDbContext<ApplicationUser>(options)
{
    public DbSet<Organization> Organizations => Set<Organization>();

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
}
