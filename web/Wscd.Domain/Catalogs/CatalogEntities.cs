using Wscd.Domain.Organizations;

namespace Wscd.Domain.Catalogs;

public interface ICatalogEntity : IOrganizationScoped
{
    int Id { get; set; }
    string Name { get; set; }
}

public sealed class ProductGroup : ICatalogEntity
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public string Name { get; set; } = string.Empty;
}

public sealed class Unit : ICatalogEntity
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public string Name { get; set; } = string.Empty;
}

public sealed class Product : ICatalogEntity
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? Barcode { get; set; }
    public string? Reference { get; set; }
    public string? Abbreviation { get; set; }
    public int? SupplierId { get; set; }
    public int? ProductGroupId { get; set; }
    public int? UnitId { get; set; }
    public DateOnly? ExpirationDate { get; set; }
    public decimal? Weight { get; set; }
    public decimal Cost { get; set; }
    public decimal MarginPercent { get; set; }
    public decimal SalePrice { get; set; }
    public decimal? PromotionPrice { get; set; }
    public int Stock { get; set; }
    public int MinimumStock { get; set; }
    public int QuantityReceived { get; set; }
    public DateOnly? ReceivedDate { get; set; }
    public string? Notes { get; set; }
}

public sealed class Customer : ICatalogEntity
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Type { get; set; } = "F";
    public string? Address { get; set; }
    public string? PostalCode { get; set; }
    public string? Neighborhood { get; set; }
    public string? Phone { get; set; }
    public string? Fax { get; set; }
    public string? City { get; set; }
    public string? State { get; set; }
    public string? PreviousAddress { get; set; }
    public string? TimeAtAddress { get; set; }
    public string? Email { get; set; }
    public string? Workplace { get; set; }
    public string? Position { get; set; }
    public DateOnly? EmploymentStartDate { get; set; }
    public decimal? Salary { get; set; }
    public string? MaritalStatus { get; set; }
    public string? Spouse { get; set; }
    public DateOnly? BirthDate { get; set; }
    public string? Father { get; set; }
    public string? Mother { get; set; }
    public string? TaxNumber { get; set; }
    public string? StateRegistrationOrIdentity { get; set; }
    public string? PersonalReferences { get; set; }
    public string? BusinessReferences { get; set; }
    public string? BusinessPhone { get; set; }
    public DateOnly RegistrationDate { get; set; }
    public string? Notes { get; set; }
    public string? Birthplace { get; set; }
    public decimal CreditLimit { get; set; }
}

public sealed class Supplier : ICatalogEntity
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? LegalName { get; set; }
    public DateOnly? RegistrationDate { get; set; }
    public string? Address { get; set; }
    public string? City { get; set; }
    public string? Neighborhood { get; set; }
    public string? TaxNumber { get; set; }
    public string? StateRegistration { get; set; }
    public string? PostalCode { get; set; }
    public string? Phone { get; set; }
    public string? Fax { get; set; }
    public string? Email { get; set; }
    public string? State { get; set; }
    public string? Notes { get; set; }
    public string? SalesContact { get; set; }
    public string? SalesContactPhone { get; set; }
    public string? SalesContactEmail { get; set; }
    public string Type { get; set; } = "J";
}

public sealed class Seller : ICatalogEntity
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public string Name { get; set; } = string.Empty;
    public bool IsActive { get; set; } = true;
}

public sealed class Bank : ICatalogEntity
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public string Name { get; set; } = string.Empty;
}

public sealed class CashAccount : ICatalogEntity
{
    public int Id { get; set; }
    public Guid OrganizationId { get; set; }
    public string Name { get; set; } = string.Empty;
    public bool IsInactive { get; set; }
}
