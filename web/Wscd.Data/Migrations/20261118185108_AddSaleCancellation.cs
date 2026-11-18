using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddSaleCancellation : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "CancellationReason",
                table: "Sales",
                type: "character varying(240)",
                maxLength: 240,
                nullable: true);

            migrationBuilder.AddColumn<DateTimeOffset>(
                name: "CancelledAtUtc",
                table: "Sales",
                type: "timestamp with time zone",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CancelledByUserId",
                table: "Sales",
                type: "character varying(450)",
                maxLength: 450,
                nullable: true);

            migrationBuilder.AddCheckConstraint(
                name: "CK_Sales_Cancellation",
                table: "Sales",
                sql: "(\"CancelledAtUtc\" IS NULL AND \"CancellationReason\" IS NULL AND \"CancelledByUserId\" IS NULL)\nOR (\"CancelledAtUtc\" IS NOT NULL AND \"CompletedAtUtc\" IS NOT NULL\n    AND \"CancellationReason\" IS NOT NULL AND \"CancelledByUserId\" IS NOT NULL)");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("""
                LOCK TABLE "Sales" IN ACCESS EXCLUSIVE MODE;
                DO $$
                BEGIN
                    IF EXISTS (SELECT 1 FROM "Sales" WHERE "CancelledAtUtc" IS NOT NULL) THEN
                        RAISE EXCEPTION 'O esquema anterior nao preserva os cancelamentos.';
                    END IF;
                END
                $$;
                """);

            migrationBuilder.DropCheckConstraint(
                name: "CK_Sales_Cancellation",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "CancellationReason",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "CancelledAtUtc",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "CancelledByUserId",
                table: "Sales");
        }
    }
}
