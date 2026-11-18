using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddSales : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Sales",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDCustomer = table.Column<int>(type: "integer", nullable: false),
                    IDSeller = table.Column<int>(type: "integer", nullable: false),
                    IDQuotation = table.Column<int>(type: "integer", nullable: true),
                    Date = table.Column<DateOnly>(type: "date", nullable: false),
                    Notes = table.Column<string>(type: "text", nullable: true),
                    CompletedAtUtc = table.Column<DateTimeOffset>(type: "timestamp with time zone", nullable: true),
                    Revision = table.Column<Guid>(type: "uuid", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sales", x => x.ID);
                    table.UniqueConstraint("AK_Sales_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.ForeignKey(
                        name: "FK_Sales_Customers_IDOrganization_IDCustomer",
                        columns: x => new { x.IDOrganization, x.IDCustomer },
                        principalTable: "Customers",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sales_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sales_Quotations_IDOrganization_IDQuotation",
                        columns: x => new { x.IDOrganization, x.IDQuotation },
                        principalTable: "Quotations",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Sales_Sellers_IDOrganization_IDSeller",
                        columns: x => new { x.IDOrganization, x.IDSeller },
                        principalTable: "Sellers",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "SaleItems",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDSale = table.Column<int>(type: "integer", nullable: false),
                    IDProduct = table.Column<int>(type: "integer", nullable: false),
                    ProductName = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                    Quantity = table.Column<int>(type: "integer", nullable: false),
                    UnitPrice = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                    DiscountPercent = table.Column<decimal>(type: "numeric(5,2)", precision: 5, scale: 2, nullable: false),
                    Total = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SaleItems", x => x.ID);
                    table.CheckConstraint("CK_SaleItems_Discount", "\"DiscountPercent\" BETWEEN 0 AND 100");
                    table.CheckConstraint("CK_SaleItems_Price", "\"UnitPrice\" >= 0 AND \"Total\" >= 0");
                    table.CheckConstraint("CK_SaleItems_Quantity", "\"Quantity\" > 0");
                    table.ForeignKey(
                        name: "FK_SaleItems_Products_IDOrganization_IDProduct",
                        columns: x => new { x.IDOrganization, x.IDProduct },
                        principalTable: "Products",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_SaleItems_Sales_IDOrganization_IDSale",
                        columns: x => new { x.IDOrganization, x.IDSale },
                        principalTable: "Sales",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SalePayments",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDSale = table.Column<int>(type: "integer", nullable: false),
                    IDCashAccount = table.Column<int>(type: "integer", nullable: false),
                    Amount = table.Column<decimal>(type: "numeric(14,2)", precision: 14, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SalePayments", x => x.ID);
                    table.CheckConstraint("CK_SalePayments_Amount", "\"Amount\" > 0");
                    table.ForeignKey(
                        name: "FK_SalePayments_CashAccounts_IDOrganization_IDCashAccount",
                        columns: x => new { x.IDOrganization, x.IDCashAccount },
                        principalTable: "CashAccounts",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_SalePayments_Sales_IDOrganization_IDSale",
                        columns: x => new { x.IDOrganization, x.IDSale },
                        principalTable: "Sales",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SaleItems_IDOrganization_IDProduct",
                table: "SaleItems",
                columns: new[] { "IDOrganization", "IDProduct" });

            migrationBuilder.CreateIndex(
                name: "IX_SaleItems_IDOrganization_IDSale_IDProduct",
                table: "SaleItems",
                columns: new[] { "IDOrganization", "IDSale", "IDProduct" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDCashAccount",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDCashAccount" });

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Sales_IDOrganization_Date",
                table: "Sales",
                columns: new[] { "IDOrganization", "Date" });

            migrationBuilder.CreateIndex(
                name: "IX_Sales_IDOrganization_IDCustomer",
                table: "Sales",
                columns: new[] { "IDOrganization", "IDCustomer" });

            migrationBuilder.CreateIndex(
                name: "IX_Sales_IDOrganization_IDQuotation",
                table: "Sales",
                columns: new[] { "IDOrganization", "IDQuotation" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Sales_IDOrganization_IDSeller",
                table: "Sales",
                columns: new[] { "IDOrganization", "IDSeller" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SaleItems");

            migrationBuilder.DropTable(
                name: "SalePayments");

            migrationBuilder.DropTable(
                name: "Sales");
        }
    }
}
