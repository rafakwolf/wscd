using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddSplitSalePayments : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments");

            migrationBuilder.AddColumn<int>(
                name: "Method",
                table: "SalePayments",
                type: "integer",
                nullable: false,
                defaultValue: 1); // Existing receipts were all cash.

            migrationBuilder.AlterColumn<int>(
                name: "Method",
                table: "SalePayments",
                type: "integer",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer",
                oldDefaultValue: 1);

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale" });

            migrationBuilder.AddCheckConstraint(
                name: "CK_SalePayments_Method",
                table: "SalePayments",
                sql: "\"Method\" IN (1, 2, 3, 4)");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("""
                LOCK TABLE "SalePayments" IN ACCESS EXCLUSIVE MODE;
                DO $$
                BEGIN
                    IF EXISTS (SELECT 1 FROM "SalePayments" WHERE "Method" <> 1)
                        OR EXISTS (SELECT 1 FROM "SalePayments" GROUP BY "IDOrganization", "IDSale" HAVING COUNT(*) > 1) THEN
                        RAISE EXCEPTION 'O esquema anterior nao preserva recebimentos divididos ou em outros meios.';
                    END IF;
                END $$;
                """);

            migrationBuilder.DropIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments");

            migrationBuilder.DropCheckConstraint(
                name: "CK_SalePayments_Method",
                table: "SalePayments");

            migrationBuilder.DropColumn(
                name: "Method",
                table: "SalePayments");

            migrationBuilder.CreateIndex(
                name: "IX_SalePayments_IDOrganization_IDSale",
                table: "SalePayments",
                columns: new[] { "IDOrganization", "IDSale" },
                unique: true);
        }
    }
}
