using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddSaleItemCommission : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "CommissionPercent",
                table: "SaleItems",
                type: "numeric(5,2)",
                precision: 5,
                scale: 2,
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddCheckConstraint(
                name: "CK_SaleItems_Commission",
                table: "SaleItems",
                sql: "\"CommissionPercent\" BETWEEN 0 AND 100");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("""
                LOCK TABLE "SaleItems" IN ACCESS EXCLUSIVE MODE;
                DO $$
                BEGIN
                    IF EXISTS (SELECT 1 FROM "SaleItems" WHERE "CommissionPercent" <> 0) THEN
                        RAISE EXCEPTION 'O esquema anterior nao preserva os percentuais de comissao.';
                    END IF;
                END
                $$;
                """);

            migrationBuilder.DropCheckConstraint(
                name: "CK_SaleItems_Commission",
                table: "SaleItems");

            migrationBuilder.DropColumn(
                name: "CommissionPercent",
                table: "SaleItems");
        }
    }
}
