using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations;

public partial class AddStockLosses : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "StockLosses",
            columns: table => new
            {
                ID = table.Column<int>(type: "integer", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                IDProduct = table.Column<int>(type: "integer", nullable: false),
                Quantity = table.Column<int>(type: "integer", nullable: false),
                UnitCost = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                LossDate = table.Column<DateOnly>(type: "date", nullable: false),
                Reason = table.Column<string>(type: "character(1)", maxLength: 1, nullable: false),
                Notes = table.Column<string>(type: "text", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_StockLosses", x => x.ID);
                table.UniqueConstraint("AK_StockLosses_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                table.CheckConstraint("CK_StockLosses_Quantity", "\"Quantity\" > 0");
                table.CheckConstraint("CK_StockLosses_UnitCost", "\"UnitCost\" >= 0");
                table.CheckConstraint("CK_StockLosses_Reason", "\"Reason\" IN ('D', 'V', 'F', 'P', 'O')");
                table.ForeignKey(
                    name: "FK_StockLosses_Organizations_IDOrganization",
                    column: x => x.IDOrganization,
                    principalTable: "Organizations",
                    principalColumn: "ID",
                    onDelete: ReferentialAction.Restrict);
                table.ForeignKey(
                    name: "FK_StockLosses_Products_IDOrganization_IDProduct",
                    columns: x => new { x.IDOrganization, x.IDProduct },
                    principalTable: "Products",
                    principalColumns: new[] { "IDOrganization", "ID" },
                    onDelete: ReferentialAction.Restrict);
            });

        migrationBuilder.CreateIndex(
            name: "IX_StockLosses_IDOrganization_LossDate",
            table: "StockLosses",
            columns: new[] { "IDOrganization", "LossDate" });
        migrationBuilder.CreateIndex(
            name: "IX_StockLosses_IDOrganization_IDProduct",
            table: "StockLosses",
            columns: new[] { "IDOrganization", "IDProduct" });
    }

    protected override void Down(MigrationBuilder migrationBuilder) => migrationBuilder.DropTable(name: "StockLosses");
}
