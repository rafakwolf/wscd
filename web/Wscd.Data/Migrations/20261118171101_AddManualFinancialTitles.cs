using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddManualFinancialTitles : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SalePayments_AccountsReceivable_IDOrganization_IDSale_IDAcc~",
                table: "SalePayments");

            migrationBuilder.DropIndex(
                name: "IX_SalePayments_IDOrganization_IDSale_IDAccountReceivable",
                table: "SalePayments");

            migrationBuilder.DropUniqueConstraint(
                name: "AK_AccountsReceivable_IDOrganization_IDSale_ID",
                table: "AccountsReceivable");

            migrationBuilder.AlterColumn<int>(
                name: "IDSale",
                table: "SalePayments",
                type: "integer",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "integer");

            migrationBuilder.AlterColumn<int>(
                name: "IDSale",
                table: "AccountsReceivable",
                type: "integer",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "integer");

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "AccountsReceivable",
                type: "character varying(160)",
                maxLength: 160,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Document",
                table: "AccountsReceivable",
                type: "character varying(80)",
                maxLength: 80,
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "IDCustomer",
                table: "AccountsReceivable",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<DateOnly>(
                name: "IssueDate",
                table: "AccountsReceivable",
                type: "date",
                nullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "IDPurchase",
                table: "AccountsPayable",
                type: "integer",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "integer");

            migrationBuilder.AddColumn<decimal>(
                name: "Balance",
                table: "AccountsPayable",
                type: "numeric(12,2)",
                precision: 12,
                scale: 2,
                nullable: true);

            migrationBuilder.Sql("""
                UPDATE "AccountsReceivable" AS account
                SET "IDCustomer" = sale."IDCustomer", "IssueDate" = sale."Date"
                FROM "Sales" AS sale
                WHERE sale."IDOrganization" = account."IDOrganization" AND sale."ID" = account."IDSale";

                UPDATE "SalePayments" SET "IDSale" = NULL WHERE "IDAccountReceivable" IS NOT NULL;

                UPDATE "AccountsPayable" SET "Balance" = CASE WHEN "IsPaid" THEN 0 ELSE "Amount" END;
                """);

            migrationBuilder.AlterColumn<int>(
                name: "IDCustomer", table: "AccountsReceivable", type: "integer", nullable: false,
                oldClrType: typeof(int), oldType: "integer", oldNullable: true);

            migrationBuilder.AlterColumn<DateOnly>(
                name: "IssueDate", table: "AccountsReceivable", type: "date", nullable: false,
                oldClrType: typeof(DateOnly), oldType: "date", oldNullable: true);

            migrationBuilder.AlterColumn<decimal>(
                name: "Balance", table: "AccountsPayable", type: "numeric(12,2)", precision: 12, scale: 2, nullable: false,
                oldClrType: typeof(decimal), oldType: "numeric(12,2)", oldPrecision: 12, oldScale: 2, oldNullable: true);

            migrationBuilder.DropColumn(name: "IsPaid", table: "AccountsPayable");

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "AccountsPayable",
                type: "character varying(160)",
                maxLength: 160,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Document",
                table: "AccountsPayable",
                type: "character varying(80)",
                maxLength: 80,
                nullable: true);

            migrationBuilder.AddUniqueConstraint(
                name: "AK_AccountsReceivable_IDOrganization_ID",
                table: "AccountsReceivable",
                columns: new[] { "IDOrganization", "ID" });

            migrationBuilder.CreateTable(
                name: "PayablePayments",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDAccountPayable = table.Column<int>(type: "integer", nullable: false),
                    IDCashAccount = table.Column<int>(type: "integer", nullable: false),
                    Method = table.Column<int>(type: "integer", nullable: false),
                    Amount = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                    PaidAtUtc = table.Column<DateTimeOffset>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PayablePayments", x => x.ID);
                    table.CheckConstraint("CK_PayablePayments_Amount", "\"Amount\" > 0");
                    table.CheckConstraint("CK_PayablePayments_Method", "\"Method\" IN (1, 2, 3, 4)");
                    table.ForeignKey(
                        name: "FK_PayablePayments_AccountsPayable_IDOrganization_IDAccountPay~",
                        columns: x => new { x.IDOrganization, x.IDAccountPayable },
                        principalTable: "AccountsPayable",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PayablePayments_CashAccounts_IDOrganization_IDCashAccount",
                        columns: x => new { x.IDOrganization, x.IDCashAccount },
                        principalTable: "CashAccounts",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDAccountReceivable",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDAccountReceivable" });

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale" });

            migrationBuilder.AddCheckConstraint(
                name: "CK_SalePayments_Origin",
                table: "SalePayments",
                sql: "(\"IDSale\" IS NULL) <> (\"IDAccountReceivable\" IS NULL)");

            migrationBuilder.CreateIndex(
                name: "IX_AccountsReceivable_IDOrganization_IDCustomer",
                table: "AccountsReceivable",
                columns: new[] { "IDOrganization", "IDCustomer" });

            migrationBuilder.CreateIndex(
                name: "IX_AccountsPayable_IDOrganization_DueDate",
                table: "AccountsPayable",
                columns: new[] { "IDOrganization", "DueDate" });

            migrationBuilder.AddCheckConstraint(
                name: "CK_AccountsPayable_Balance",
                table: "AccountsPayable",
                sql: "\"Balance\" BETWEEN 0 AND \"Amount\"");

            migrationBuilder.CreateIndex(
                name: "IX_PayablePayments_IDOrganization_IDAccountPayable",
                table: "PayablePayments",
                columns: new[] { "IDOrganization", "IDAccountPayable" });

            migrationBuilder.CreateIndex(
                name: "IX_PayablePayments_IDOrganization_IDCashAccount",
                table: "PayablePayments",
                columns: new[] { "IDOrganization", "IDCashAccount" });

            migrationBuilder.AddForeignKey(
                name: "FK_AccountsReceivable_Customers_IDOrganization_IDCustomer",
                table: "AccountsReceivable",
                columns: new[] { "IDOrganization", "IDCustomer" },
                principalTable: "Customers",
                principalColumns: new[] { "IDOrganization", "ID" },
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_SalePayments_AccountsReceivable_IDOrganization_IDAccountRec~",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDAccountReceivable" },
                principalTable: "AccountsReceivable",
                principalColumns: new[] { "IDOrganization", "ID" },
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("""
                LOCK TABLE "AccountsReceivable", "AccountsPayable", "SalePayments", "PayablePayments" IN ACCESS EXCLUSIVE MODE;
                DO $$
                BEGIN
                    IF EXISTS (SELECT 1 FROM "AccountsReceivable" WHERE "IDSale" IS NULL)
                        OR EXISTS (SELECT 1 FROM "AccountsPayable" WHERE "IDPurchase" IS NULL)
                        OR EXISTS (SELECT 1 FROM "PayablePayments") THEN
                        RAISE EXCEPTION 'O esquema anterior nao preserva titulos manuais ou baixas de contas a pagar.';
                    END IF;
                END $$;
                """);

            migrationBuilder.DropForeignKey(
                name: "FK_AccountsReceivable_Customers_IDOrganization_IDCustomer",
                table: "AccountsReceivable");

            migrationBuilder.DropForeignKey(
                name: "FK_SalePayments_AccountsReceivable_IDOrganization_IDAccountRec~",
                table: "SalePayments");

            migrationBuilder.DropTable(
                name: "PayablePayments");

            migrationBuilder.DropIndex(
                name: "IX_SalePayments_IDOrganization_IDAccountReceivable",
                table: "SalePayments");

            migrationBuilder.DropIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments");

            migrationBuilder.DropCheckConstraint(
                name: "CK_SalePayments_Origin",
                table: "SalePayments");

            migrationBuilder.Sql("""
                UPDATE "SalePayments" AS payment
                SET "IDSale" = account."IDSale"
                FROM "AccountsReceivable" AS account
                WHERE account."IDOrganization" = payment."IDOrganization" AND account."ID" = payment."IDAccountReceivable";
                """);

            migrationBuilder.DropUniqueConstraint(
                name: "AK_AccountsReceivable_IDOrganization_ID",
                table: "AccountsReceivable");

            migrationBuilder.DropIndex(
                name: "IX_AccountsReceivable_IDOrganization_IDCustomer",
                table: "AccountsReceivable");

            migrationBuilder.DropIndex(
                name: "IX_AccountsPayable_IDOrganization_DueDate",
                table: "AccountsPayable");

            migrationBuilder.DropCheckConstraint(
                name: "CK_AccountsPayable_Balance",
                table: "AccountsPayable");

            migrationBuilder.DropColumn(
                name: "Description",
                table: "AccountsReceivable");

            migrationBuilder.DropColumn(
                name: "Document",
                table: "AccountsReceivable");

            migrationBuilder.DropColumn(
                name: "IDCustomer",
                table: "AccountsReceivable");

            migrationBuilder.DropColumn(
                name: "IssueDate",
                table: "AccountsReceivable");

            migrationBuilder.AddColumn<bool>(
                name: "IsPaid", table: "AccountsPayable", type: "boolean", nullable: false, defaultValue: false);

            migrationBuilder.Sql("""
                UPDATE "AccountsPayable" SET "IsPaid" = "Balance" = 0;
                """);

            migrationBuilder.DropColumn(
                name: "Balance",
                table: "AccountsPayable");

            migrationBuilder.DropColumn(
                name: "Description",
                table: "AccountsPayable");

            migrationBuilder.DropColumn(
                name: "Document",
                table: "AccountsPayable");

            migrationBuilder.AlterColumn<int>(
                name: "IDSale",
                table: "SalePayments",
                type: "integer",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "IDSale",
                table: "AccountsReceivable",
                type: "integer",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "IDPurchase",
                table: "AccountsPayable",
                type: "integer",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer",
                oldNullable: true);

            migrationBuilder.AddUniqueConstraint(
                name: "AK_AccountsReceivable_IDOrganization_IDSale_ID",
                table: "AccountsReceivable",
                columns: new[] { "IDOrganization", "IDSale", "ID" });

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDSale_IDAccountReceivable",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale", "IDAccountReceivable" });

            migrationBuilder.AddForeignKey(
                name: "FK_SalePayments_AccountsReceivable_IDOrganization_IDSale_IDAcc~",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale", "IDAccountReceivable" },
                principalTable: "AccountsReceivable",
                principalColumns: new[] { "IDOrganization", "IDSale", "ID" },
                onDelete: ReferentialAction.Restrict);
        }
    }
}
