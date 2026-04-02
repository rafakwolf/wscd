import { bootstrapChecklist, buildStages, deliveryPrinciples } from "@/features/bootstrap/blueprint";
import { sql } from "@/server/db/client";

type BootstrapCounts = {
  organizations_count: number;
  company_profiles_count: number;
  business_settings_count: number;
  cash_accounts_count: number;
  tax_rates_count: number;
  units_count: number;
  product_groups_count: number;
};

export async function getBootstrapState() {
  try {
    const [counts] = await sql<BootstrapCounts[]>`
      select
        (select count(*)::int from organizations) as organizations_count,
        (select count(*)::int from company_profiles) as company_profiles_count,
        (select count(*)::int from business_settings) as business_settings_count,
        (select count(*)::int from cash_accounts) as cash_accounts_count,
        (select count(*)::int from tax_rates) as tax_rates_count,
        (select count(*)::int from units) as units_count,
        (select count(*)::int from product_groups) as product_groups_count
    `;

    const ready =
      counts.organizations_count > 0 &&
      counts.company_profiles_count > 0 &&
      counts.business_settings_count > 0 &&
      counts.cash_accounts_count > 0;

    return {
      ok: true,
      project: "WSCD Web",
      mode: "greenfield",
      legacyImportRequired: false,
      bootstrapReady: ready,
      counts,
      buildStages,
      bootstrapChecklist,
      deliveryPrinciples
    };
  } catch (error) {
    return {
      ok: false,
      project: "WSCD Web",
      mode: "greenfield",
      legacyImportRequired: false,
      bootstrapReady: false,
      error: error instanceof Error ? error.message : "Unknown bootstrap error",
      buildStages,
      bootstrapChecklist,
      deliveryPrinciples
    };
  }
}
