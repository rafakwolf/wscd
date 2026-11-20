using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddQuotations : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Quotations",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDCustomer = table.Column<int>(type: "integer", nullable: false),
                    IDSeller = table.Column<int>(type: "integer", nullable: false),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    Notes = table.Column<string>(type: "text", nullable: true),
                    IsCompleted = table.Column<bool>(type: "boolean", nullable: false),
                    Revision = table.Column<Guid>(type: "uuid", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Quotations", x => x.ID);
                    table.UniqueConstraint("AK_Quotations_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_Quotations_Customers_IDOrganization_IDCustomer",
                        columns: x => new { x.IDOrganization, x.IDCustomer },
                        principalTable: "Customers",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Quotations_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Quotations_Sellers_IDOrganization_IDSeller",
                        columns: x => new { x.IDOrganization, x.IDSeller },
                        principalTable: "Sellers",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "QuotationItems",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDQuotation = table.Column<int>(type: "integer", nullable: false),
                    IDProduct = table.Column<int>(type: "integer", nullable: false),
                    ProductName = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                    Quantity = table.Column<int>(type: "integer", nullable: false),
                    UnitPrice = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                    DiscountPercent = table.Column<decimal>(type: "numeric(5,2)", precision: 5, scale: 2, nullable: false),
                    Total = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuotationItems", x => x.ID);
                    table.CheckConstraint("CK_QuotationItems_Discount", "\"DiscountPercent\" BETWEEN 0 AND 100");
                    table.CheckConstraint("CK_QuotationItems_Price", "\"UnitPrice\" >= 0 AND \"Total\" >= 0");
                    table.CheckConstraint("CK_QuotationItems_Quantity", "\"Quantity\" > 0");
                    table.ForeignKey(
                        name: "FK_QuotationItems_Products_IDOrganization_IDProduct",
                        columns: x => new { x.IDOrganization, x.IDProduct },
                        principalTable: "Products",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_QuotationItems_Quotations_IDOrganization_IDQuotation",
                        columns: x => new { x.IDOrganization, x.IDQuotation },
                        principalTable: "Quotations",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_QuotationItems_IDOrganization_IDProduct",
                table: "QuotationItems",
                columns: new[] { "IDOrganization", "IDProduct" });

            migrationBuilder.CreateIndex(
                name: "IX_QuotationItems_IDOrganization_IDQuotation_IDProduct",
                table: "QuotationItems",
                columns: new[] { "IDOrganization", "IDQuotation", "IDProduct" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Quotations_IDOrganization_Date",
                table: "Quotations",
                columns: new[] { "IDOrganization", "Date" });

            migrationBuilder.CreateIndex(
                name: "IX_Quotations_IDOrganization_IDCustomer",
                table: "Quotations",
                columns: new[] { "IDOrganization", "IDCustomer" });

            migrationBuilder.CreateIndex(
                name: "IX_Quotations_IDOrganization_IDSeller",
                table: "Quotations",
                columns: new[] { "IDOrganization", "IDSeller" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "QuotationItems");

            migrationBuilder.DropTable(
                name: "Quotations");
        }
    }
}
