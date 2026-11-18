using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddAccountsReceivable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments");

            migrationBuilder.AddColumn<int>(
                name: "IDAccountReceivable",
                table: "SalePayments",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<DateTimeOffset>(
                name: "ReceivedAtUtc",
                table: "SalePayments",
                type: "timestamp with time zone",
                nullable: true);

            migrationBuilder.Sql("""
                UPDATE "SalePayments" AS payment
                SET "ReceivedAtUtc" = sale."CompletedAtUtc"
                FROM "Sales" AS sale
                WHERE sale."IDOrganization" = payment."IDOrganization" AND sale."ID" = payment."IDSale";
                """);

            migrationBuilder.AlterColumn<DateTimeOffset>(
                name: "ReceivedAtUtc",
                table: "SalePayments",
                type: "timestamp with time zone",
                nullable: false,
                oldClrType: typeof(DateTimeOffset),
                oldType: "timestamp with time zone",
                oldNullable: true);

            migrationBuilder.CreateTable(
                name: "AccountsReceivable",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDSale = table.Column<int>(type: "integer", nullable: false),
                    DueDate = table.Column<DateOnly>(type: "date", nullable: false),
                    Amount = table.Column<decimal>(type: "numeric(14,2)", precision: 14, scale: 2, nullable: false),
                    Balance = table.Column<decimal>(type: "numeric(14,2)", precision: 14, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AccountsReceivable", x => x.ID);
                    table.UniqueConstraint("AK_AccountsReceivable_IDOrganization_IDSale_ID", x => new { x.IDOrganization, x.IDSale, x.ID });
                    table.CheckConstraint("CK_AccountsReceivable_Balance", "\"Amount\" > 0 AND \"Balance\" BETWEEN 0 AND \"Amount\"");
                    table.ForeignKey(
                        name: "FK_AccountsReceivable_Sales_IDOrganization_IDSale",
                        columns: x => new { x.IDOrganization, x.IDSale },
                        principalTable: "Sales",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDSale_IDAccountReceivable",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale", "IDAccountReceivable" });

            migrationBuilder.CreateIndex(
                name: "IX_AccountsReceivable_IDOrganization_DueDate",
                table: "AccountsReceivable",
                columns: new[] { "IDOrganization", "DueDate" });

            migrationBuilder.CreateIndex(
                name: "IX_AccountsReceivable_IDOrganization_IDSale",
                table: "AccountsReceivable",
                columns: new[] { "IDOrganization", "IDSale" },
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_SalePayments_AccountsReceivable_IDOrganization_IDSale_IDAcc~",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale", "IDAccountReceivable" },
                principalTable: "AccountsReceivable",
                principalColumns: new[] { "IDOrganization", "IDSale", "ID" },
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("""
                LOCK TABLE "AccountsReceivable" IN ACCESS EXCLUSIVE MODE;
                DO $$
                BEGIN
                    IF EXISTS (SELECT 1 FROM "AccountsReceivable") THEN
                        RAISE EXCEPTION 'O esquema anterior nao preserva os titulos de crediario.';
                    END IF;
                END $$;
                """);

            migrationBuilder.DropForeignKey(
                name: "FK_SalePayments_AccountsReceivable_IDOrganization_IDSale_IDAcc~",
                table: "SalePayments");

            migrationBuilder.DropTable(
                name: "AccountsReceivable");

            migrationBuilder.DropIndex(
                name: "IX_SalePayments_IDOrganization_IDSale_IDAccountReceivable",
                table: "SalePayments");

            migrationBuilder.DropColumn(
                name: "IDAccountReceivable",
                table: "SalePayments");

            migrationBuilder.DropColumn(
                name: "ReceivedAtUtc",
                table: "SalePayments");

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale" });
        }
    }
}
