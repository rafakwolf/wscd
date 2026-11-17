using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Wscd.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddPromotions : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Promotions",
                columns: table => new
                {
                    ID = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    IDOrganization = table.Column<Guid>(type: "uuid", nullable: false),
                    IDProduct = table.Column<int>(type: "integer", nullable: false),
                    RegularPrice = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                    DiscountPercent = table.Column<decimal>(type: "numeric(6,2)", precision: 6, scale: 2, nullable: false),
                    PromotionPrice = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                    StartDate = table.Column<DateOnly>(type: "date", nullable: false),
                    EndDate = table.Column<DateOnly>(type: "date", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Promotions", x => x.ID);
                    table.UniqueConstraint("AK_Promotions_IDOrganization_ID", x => new { x.IDOrganization, x.ID });
                    table.CheckConstraint("CK_Promotions_DateRange", "\"StartDate\" <= \"EndDate\"");
                    table.CheckConstraint("CK_Promotions_DiscountPercent", "\"DiscountPercent\" > 0 AND \"DiscountPercent\" < 100");
                    table.CheckConstraint("CK_Promotions_PromotionPrice", "\"PromotionPrice\" > 0 AND \"PromotionPrice\" < \"RegularPrice\"");
                    table.CheckConstraint("CK_Promotions_RegularPrice", "\"RegularPrice\" > 0");
                    table.ForeignKey(
                        name: "FK_Promotions_Organizations_IDOrganization",
                        column: x => x.IDOrganization,
                        principalTable: "Organizations",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Promotions_Products_IDOrganization_IDProduct",
                        columns: x => new { x.IDOrganization, x.IDProduct },
                        principalTable: "Products",
                        principalColumns: new[] { "IDOrganization", "ID" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Promotions_IDOrganization_IDProduct",
                table: "Promotions",
                columns: new[] { "IDOrganization", "IDProduct" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Promotions");
        }
    }
}
