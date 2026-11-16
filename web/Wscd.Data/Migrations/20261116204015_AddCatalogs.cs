using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddCatalogs : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Banks",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Banks", x => x.ID);
                    table.UniqueConstraint("AK_Banks_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_Banks_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CashAccounts",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                    IsInactive = table.Column<bool>(type: "boolean", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CashAccounts", x => x.ID);
                    table.UniqueConstraint("AK_CashAccounts_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_CashAccounts_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Customers",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                    Type = table.Column<string>(type: "character varying(1)", maxLength: 1, nullable: false),
                    Address = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    PostalCode = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: true),
                    Neighborhood = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    Phone = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: true),
                    Fax = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: true),
                    City = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    State = table.Column<string>(type: "character varying(2)", maxLength: 2, nullable: true),
                    PreviousAddress = table.Column<string>(type: "text", nullable: true),
                    TimeAtAddress = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    Email = table.Column<string>(type: "text", nullable: true),
                    Workplace = table.Column<string>(type: "text", nullable: true),
                    Position = table.Column<string>(type: "text", nullable: true),
                    EmploymentStartDate = table.Column<DateOnly>(type: "date", nullable: true),
                    Salary = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: true),
                    MaritalStatus = table.Column<string>(type: "text", nullable: true),
                    Spouse = table.Column<string>(type: "text", nullable: true),
                    BirthDate = table.Column<DateOnly>(type: "date", nullable: true),
                    Father = table.Column<string>(type: "text", nullable: true),
                    Mother = table.Column<string>(type: "text", nullable: true),
                    TaxNumber = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    StateRegistrationOrIdentity = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: true),
                    PersonalReferences = table.Column<string>(type: "text", nullable: true),
                    BusinessReferences = table.Column<string>(type: "text", nullable: true),
                    BusinessPhone = table.Column<string>(type: "text", nullable: true),
                    RegistrationDate = table.Column<DateOnly>(type: "date", nullable: false),
                    Notes = table.Column<string>(type: "text", nullable: true),
                    Birthplace = table.Column<string>(type: "text", nullable: true),
                    CreditLimit = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customers", x => x.ID);
                    table.UniqueConstraint("AK_Customers_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_Customers_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ProductGroups",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductGroups", x => x.ID);
                    table.UniqueConstraint("AK_ProductGroups_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_ProductGroups_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Sellers",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                    IsActive = table.Column<bool>(type: "boolean", nullable: false, defaultValue: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sellers", x => x.ID);
                    table.UniqueConstraint("AK_Sellers_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_Sellers_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Suppliers",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                    LegalName = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    RegistrationDate = table.Column<DateOnly>(type: "date", nullable: true),
                    Address = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    City = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    Neighborhood = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    TaxNumber = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    StateRegistration = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: true),
                    PostalCode = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: true),
                    Phone = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: true),
                    Fax = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: true),
                    Email = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    State = table.Column<string>(type: "character varying(2)", maxLength: 2, nullable: true),
                    Notes = table.Column<string>(type: "text", nullable: true),
                    SalesContact = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    SalesContactPhone = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: true),
                    SalesContactEmail = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    Type = table.Column<string>(type: "character varying(1)", maxLength: 1, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Suppliers", x => x.ID);
                    table.UniqueConstraint("AK_Suppliers_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_Suppliers_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Units",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Units", x => x.ID);
                    table.UniqueConstraint("AK_Units_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_Units_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Products",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                    Barcode = table.Column<string>(type: "character varying(13)", maxLength: 13, nullable: true),
                    Reference = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: true),
                    Abbreviation = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: true),
                    IDSupplier = table.Column<int>(type: "integer", nullable: true),
                    IDProductGroup = table.Column<int>(type: "integer", nullable: true),
                    IDUnit = table.Column<int>(type: "integer", nullable: true),
                    ExpirationDate = table.Column<DateOnly>(type: "date", nullable: true),
                    Weight = table.Column<decimal>(type: "numeric(12,3)", precision: 12, scale: 3, nullable: true),
                    Cost = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                    MarginPercent = table.Column<decimal>(type: "numeric(8,2)", precision: 8, scale: 2, nullable: false),
                    SalePrice = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                    PromotionPrice = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: true),
                    Stock = table.Column<int>(type: "integer", nullable: false),
                    MinimumStock = table.Column<int>(type: "integer", nullable: false),
                    QuantityReceived = table.Column<int>(type: "integer", nullable: false),
                    ReceivedDate = table.Column<DateOnly>(type: "date", nullable: true),
                    Notes = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Products", x => x.ID);
                    table.UniqueConstraint("AK_Products_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_Products_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Products_ProductGroups_IDOrganization_IDProductGroup",
                        columns: x => new { x.IDOrganization, x.IDProductGroup },
                        principalTable: "ProductGroups",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Products_Suppliers_IDOrganization_IDSupplier",
                        columns: x => new { x.IDOrganization, x.IDSupplier },
                        principalTable: "Suppliers",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Products_Units_IDOrganization_IDUnit",
                        columns: x => new { x.IDOrganization, x.IDUnit },
                        principalTable: "Units",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Customers_IDOrganization_StateRegistrationOrIdentity",
                table: "Customers",
                columns: new[] { "IDOrganization", "StateRegistrationOrIdentity" },
                unique: true,
                filter: "\"StateRegistrationOrIdentity\" IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Customers_IDOrganization_TaxNumber",
                table: "Customers",
                columns: new[] { "IDOrganization", "TaxNumber" },
                unique: true,
                filter: "\"TaxNumber\" IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Products_IDOrganization_Barcode",
                table: "Products",
                columns: new[] { "IDOrganization", "Barcode" },
                unique: true,
                filter: "\"Barcode\" IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Products_IDOrganization_IDProductGroup",
                table: "Products",
                columns: new[] { "IDOrganization", "IDProductGroup" });

            migrationBuilder.CreateIndex(
                name: "IX_Products_IDOrganization_IDSupplier",
                table: "Products",
                columns: new[] { "IDOrganization", "IDSupplier" });

            migrationBuilder.CreateIndex(
                name: "IX_Products_IDOrganization_IDUnit",
                table: "Products",
                columns: new[] { "IDOrganization", "IDUnit" });

            migrationBuilder.CreateIndex(
                name: "IX_Suppliers_IDOrganization_TaxNumber",
                table: "Suppliers",
                columns: new[] { "IDOrganization", "TaxNumber" },
                unique: true,
                filter: "\"TaxNumber\" IS NOT NULL");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Banks");

            migrationBuilder.DropTable(
                name: "CashAccounts");

            migrationBuilder.DropTable(
                name: "Customers");

            migrationBuilder.DropTable(
                name: "Products");

            migrationBuilder.DropTable(
                name: "Sellers");

            migrationBuilder.DropTable(
                name: "ProductGroups");

            migrationBuilder.DropTable(
                name: "Suppliers");

            migrationBuilder.DropTable(
                name: "Units");
        }
    }
}
