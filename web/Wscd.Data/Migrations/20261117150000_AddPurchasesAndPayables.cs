using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations;

public partial class AddPurchasesAndPayables : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "Purchases",
            columns: table => new
            {
                ID = table.Column<int>(type: "integer", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                IDSupplier = table.Column<int>(type: "integer", nullable: false),
                PurchaseDate = table.Column<DateOnly>(type: "date", nullable: false),
                DueDate = table.Column<DateOnly>(type: "date", nullable: true),
                Notes = table.Column<string>(type: "text", nullable: true),
                Total = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                IsCompleted = table.Column<bool>(type: "boolean", nullable: false, defaultValue: false),
                CompletedDate = table.Column<DateOnly>(type: "date", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_Purchases", x => x.ID);
                table.UniqueConstraint("AK_Purchases_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                table.ForeignKey(
                    name: "FK_Purchases_Organizations_IDOrganization",
                    column: x => x.IDOrganization,
                    principalTable: "Organizations",
                    principalColumn: "ID",
                    onDelete: ReferentialAction.Restrict);
                table.ForeignKey(
                    name: "FK_Purchases_Suppliers_IDOrganization_IDSupplier",
                    columns: x => new { x.IDOrganization, x.IDSupplier },
                    principalTable: "Suppliers",
                    principalColumns: new[] { "IDOrganization", "ID" },
                    onDelete: ReferentialAction.Restrict);
            });

        migrationBuilder.CreateTable(
            name: "PurchaseItems",
            columns: table => new
            {
                ID = table.Column<int>(type: "integer", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                IDPurchase = table.Column<int>(type: "integer", nullable: false),
                IDProduct = table.Column<int>(type: "integer", nullable: false),
                Quantity = table.Column<int>(type: "integer", nullable: false),
                UnitCost = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_PurchaseItems", x => x.ID);
                table.UniqueConstraint("AK_PurchaseItems_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                table.CheckConstraint("CK_PurchaseItems_Quantity", "\"Quantity\" > 0");
                table.ForeignKey(
                    name: "FK_PurchaseItems_Products_IDOrganization_IDProduct",
                    columns: x => new { x.IDOrganization, x.IDProduct },
                    principalTable: "Products",
                    principalColumns: new[] { "IDOrganization", "ID" },
                    onDelete: ReferentialAction.Restrict);
                table.ForeignKey(
                    name: "FK_PurchaseItems_Purchases_IDOrganization_IDPurchase",
                    columns: x => new { x.IDOrganization, x.IDPurchase },
                    principalTable: "Purchases",
                    principalColumns: new[] { "IDOrganization", "ID" },
                    onDelete: ReferentialAction.Restrict);
                table.ForeignKey(
                    name: "FK_PurchaseItems_Organizations_IDOrganization",
                    column: x => x.IDOrganization,
                    principalTable: "Organizations",
                    principalColumn: "ID",
                    onDelete: ReferentialAction.Restrict);
            });

        migrationBuilder.CreateTable(
            name: "AccountsPayable",
            columns: table => new
            {
                ID = table.Column<int>(type: "integer", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                IDPurchase = table.Column<int>(type: "integer", nullable: false),
                IDSupplier = table.Column<int>(type: "integer", nullable: false),
                CreatedDate = table.Column<DateOnly>(type: "date", nullable: false),
                DueDate = table.Column<DateOnly>(type: "date", nullable: false),
                Amount = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                IsPaid = table.Column<bool>(type: "boolean", nullable: false, defaultValue: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_AccountsPayable", x => x.ID);
                table.UniqueConstraint("AK_AccountsPayable_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                table.ForeignKey(
                    name: "FK_AccountsPayable_Organizations_IDOrganization",
                    column: x => x.IDOrganization,
                    principalTable: "Organizations",
                    principalColumn: "ID",
                    onDelete: ReferentialAction.Restrict);
                table.ForeignKey(
                    name: "FK_AccountsPayable_Purchases_IDOrganization_IDPurchase",
                    columns: x => new { x.IDOrganization, x.IDPurchase },
                    principalTable: "Purchases",
                    principalColumns: new[] { "IDOrganization", "ID" },
                    onDelete: ReferentialAction.Restrict);
                table.ForeignKey(
                    name: "FK_AccountsPayable_Suppliers_IDOrganization_IDSupplier",
                    columns: x => new { x.IDOrganization, x.IDSupplier },
                    principalTable: "Suppliers",
                    principalColumns: new[] { "IDOrganization", "ID" },
                    onDelete: ReferentialAction.Restrict);
            });

        migrationBuilder.CreateIndex(
            name: "IX_Purchases_IDOrganization_PurchaseDate",
            table: "Purchases",
            columns: new[] { "IDOrganization", "PurchaseDate" });
        migrationBuilder.CreateIndex(
            name: "IX_Purchases_IDOrganization_IsCompleted",
            table: "Purchases",
            columns: new[] { "IDOrganization", "IsCompleted" });
        migrationBuilder.CreateIndex(
            name: "IX_Purchases_IDOrganization_IDSupplier",
            table: "Purchases",
            columns: new[] { "IDOrganization", "IDSupplier" });
        migrationBuilder.CreateIndex(
            name: "IX_PurchaseItems_IDOrganization_IDPurchase_IDProduct",
            table: "PurchaseItems",
            columns: new[] { "IDOrganization", "IDPurchase", "IDProduct" },
            unique: true);
        migrationBuilder.CreateIndex(
            name: "IX_PurchaseItems_IDOrganization_IDProduct",
            table: "PurchaseItems",
            columns: new[] { "IDOrganization", "IDProduct" });
        migrationBuilder.CreateIndex(
            name: "IX_AccountsPayable_IDOrganization_IDPurchase",
            table: "AccountsPayable",
            columns: new[] { "IDOrganization", "IDPurchase" },
            unique: true);
        migrationBuilder.CreateIndex(
            name: "IX_AccountsPayable_IDOrganization_IDSupplier",
            table: "AccountsPayable",
            columns: new[] { "IDOrganization", "IDSupplier" });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "AccountsPayable");
        migrationBuilder.DropTable(name: "PurchaseItems");
        migrationBuilder.DropTable(name: "Purchases");
    }
}
