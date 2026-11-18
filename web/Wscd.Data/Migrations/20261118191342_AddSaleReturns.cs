using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddSaleReturns : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddUniqueConstraint(
                name: "AK_SaleItems_IDOrganization_ID",
                table: "SaleItems",
                columns: new[] { "IDOrganization", "ID" });

            migrationBuilder.CreateTable(
                name: "SaleReturns",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDSale = table.Column<int>(type: "integer", nullable: false),
                    ReturnedAtUtc = table.Column<DateTimeOffset>(type: "timestamp with time zone", nullable: false),
                    Reason = table.Column<string>(type: "character varying(240)", maxLength: 240, nullable: false),
                    UserId = table.Column<string>(type: "character varying(450)", maxLength: 450, nullable: false),
                    ReceivableReduction = table.Column<decimal>(type: "numeric(14,2)", precision: 14, scale: 2, nullable: false),
                    RefundAmount = table.Column<decimal>(type: "numeric(14,2)", precision: 14, scale: 2, nullable: false),
                    IDCashAccount = table.Column<int>(type: "integer", nullable: true),
                    RefundMethod = table.Column<int>(type: "integer", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SaleReturns", x => x.ID);
                    table.UniqueConstraint("AK_SaleReturns_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.CheckConstraint("CK_SaleReturns_Amounts", "\"ReceivableReduction\" >= 0 AND \"RefundAmount\" >= 0 AND (\n    (\"RefundAmount\" = 0 AND \"IDCashAccount\" IS NULL AND \"RefundMethod\" IS NULL)\n    OR (\"RefundAmount\" > 0 AND \"IDCashAccount\" IS NOT NULL AND \"RefundMethod\" IS NOT NULL AND \"RefundMethod\" IN (1, 2, 3, 4))\n)");
                    table.ForeignKey(
                        name: "FK_SaleReturns_CashAccounts_IDOrganization_IDCashAccount",
                        columns: x => new { x.IDOrganization, x.IDCashAccount },
                        principalTable: "CashAccounts",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_SaleReturns_Sales_IDOrganization_IDSale",
                        columns: x => new { x.IDOrganization, x.IDSale },
                        principalTable: "Sales",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "SaleReturnItems",
                columns: table => new
                {
                    IDSaleReturn = table.Column<int>(type: "integer", nullable: false),
                    IDSaleItem = table.Column<int>(type: "integer", nullable: false),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    Quantity = table.Column<int>(type: "integer", nullable: false),
                    Amount = table.Column<decimal>(type: "numeric(14,2)", precision: 14, scale: 2, nullable: false),
                    Restock = table.Column<bool>(type: "boolean", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SaleReturnItems", x => new { x.IDSaleReturn, x.IDSaleItem });
                    table.CheckConstraint("CK_SaleReturnItems_Amount", "\"Quantity\" > 0 AND \"Amount\" >= 0");
                    table.ForeignKey(
                        name: "FK_SaleReturnItems_SaleItems_IDOrganization_IDSaleItem",
                        columns: x => new { x.IDOrganization, x.IDSaleItem },
                        principalTable: "SaleItems",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_SaleReturnItems_SaleReturns_IDOrganization_IDSaleReturn",
                        columns: x => new { x.IDOrganization, x.IDSaleReturn },
                        principalTable: "SaleReturns",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SaleReturnItems_IDOrganization_IDSaleItem",
                table: "SaleReturnItems",
                columns: new[] { "IDOrganization", "IDSaleItem" });

            migrationBuilder.CreateIndex(
                name: "IX_SaleReturnItems_IDOrganization_IDSaleReturn",
                table: "SaleReturnItems",
                columns: new[] { "IDOrganization", "IDSaleReturn" });

            migrationBuilder.CreateIndex(
                name: "IX_SaleReturns_IDOrganization_IDCashAccount",
                table: "SaleReturns",
                columns: new[] { "IDOrganization", "IDCashAccount" });

            migrationBuilder.CreateIndex(
                name: "IX_SaleReturns_IDOrganization_IDSale",
                table: "SaleReturns",
                columns: new[] { "IDOrganization", "IDSale" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("""
                LOCK TABLE "SaleReturns" IN ACCESS EXCLUSIVE MODE;
                DO $$
                BEGIN
                    IF EXISTS (SELECT 1 FROM "SaleReturns") THEN
                        RAISE EXCEPTION 'O esquema anterior nao preserva as devolucoes.';
                    END IF;
                END
                $$;
                """);

            migrationBuilder.DropTable(
                name: "SaleReturnItems");

            migrationBuilder.DropTable(
                name: "SaleReturns");

            migrationBuilder.DropUniqueConstraint(
                name: "AK_SaleItems_IDOrganization_ID",
                table: "SaleItems");
        }
    }
}
