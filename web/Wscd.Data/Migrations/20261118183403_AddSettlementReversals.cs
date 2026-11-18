using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddSettlementReversals : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ReversalReason",
                table: "SalePayments",
                type: "character varying(240)",
                maxLength: 240,
                nullable: true);

            migrationBuilder.AddColumn<DateTimeOffset>(
                name: "ReversedAtUtc",
                table: "SalePayments",
                type: "timestamp with time zone",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ReversedByUserId",
                table: "SalePayments",
                type: "character varying(450)",
                maxLength: 450,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ReversalReason",
                table: "PayablePayments",
                type: "character varying(240)",
                maxLength: 240,
                nullable: true);

            migrationBuilder.AddColumn<DateTimeOffset>(
                name: "ReversedAtUtc",
                table: "PayablePayments",
                type: "timestamp with time zone",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ReversedByUserId",
                table: "PayablePayments",
                type: "character varying(450)",
                maxLength: 450,
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "Revision",
                table: "AccountsReceivable",
                type: "uuid",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<Guid>(
                name: "Revision",
                table: "AccountsPayable",
                type: "uuid",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.Sql("""
                ALTER TABLE "AccountsReceivable" ALTER COLUMN "Revision" DROP DEFAULT;
                ALTER TABLE "AccountsPayable" ALTER COLUMN "Revision" DROP DEFAULT;
                """);

            migrationBuilder.AddCheckConstraint(
                name: "CK_SalePayments_Reversal",
                table: "SalePayments",
                sql: "((\"ReversedAtUtc\" IS NULL) = (\"ReversalReason\" IS NULL) AND (\"ReversedAtUtc\" IS NULL) = (\"ReversedByUserId\" IS NULL)) AND (\"ReversedAtUtc\" IS NULL OR \"IDAccountReceivable\" IS NOT NULL)");

            migrationBuilder.AddCheckConstraint(
                name: "CK_PayablePayments_Reversal",
                table: "PayablePayments",
                sql: "(\"ReversedAtUtc\" IS NULL) = (\"ReversalReason\" IS NULL) AND (\"ReversedAtUtc\" IS NULL) = (\"ReversedByUserId\" IS NULL)");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("""
                LOCK TABLE "SalePayments", "PayablePayments" IN ACCESS EXCLUSIVE MODE;
                DO $$
                BEGIN
                    IF EXISTS (SELECT 1 FROM "SalePayments" WHERE "ReversedAtUtc" IS NOT NULL)
                        OR EXISTS (SELECT 1 FROM "PayablePayments" WHERE "ReversedAtUtc" IS NOT NULL) THEN
                        RAISE EXCEPTION 'O esquema anterior nao preserva os estornos.';
                    END IF;
                END
                $$;
                """);

            migrationBuilder.DropCheckConstraint(
                name: "CK_SalePayments_Reversal",
                table: "SalePayments");

            migrationBuilder.DropCheckConstraint(
                name: "CK_PayablePayments_Reversal",
                table: "PayablePayments");

            migrationBuilder.DropColumn(
                name: "ReversalReason",
                table: "SalePayments");

            migrationBuilder.DropColumn(
                name: "ReversedAtUtc",
                table: "SalePayments");

            migrationBuilder.DropColumn(
                name: "ReversedByUserId",
                table: "SalePayments");

            migrationBuilder.DropColumn(
                name: "ReversalReason",
                table: "PayablePayments");

            migrationBuilder.DropColumn(
                name: "ReversedAtUtc",
                table: "PayablePayments");

            migrationBuilder.DropColumn(
                name: "ReversedByUserId",
                table: "PayablePayments");

            migrationBuilder.DropColumn(
                name: "Revision",
                table: "AccountsReceivable");

            migrationBuilder.DropColumn(
                name: "Revision",
                table: "AccountsPayable");
        }
    }
}
