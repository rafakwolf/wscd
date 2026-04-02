import { sql } from "@/server/db/client";

type OrganizationRow = {
  id: number;
  name: string;
  slug: string | null;
  created_at: string;
};

type CompanyProfileRow = {
  organization_id: number;
  trade_name: string | null;
  legal_name: string | null;
  document_number: string | null;
  state_registration: string | null;
  municipal_registration: string | null;
  email: string | null;
  phone: string | null;
  address_line: string | null;
  neighborhood: string | null;
  state_code: string | null;
  zip_code: string | null;
  responsible_name: string | null;
  logo_asset_url: string | null;
  updated_at: string;
};

type BusinessSettingsRow = {
  organization_id: number;
  default_interest_rate: string;
  default_payment_interval_days: number;
  default_first_due_days: number;
  default_installment_count: number;
  default_customer_credit_limit: string;
  default_product_stock: string;
  default_product_discount: string;
  quotation_requires_stock: boolean;
  sale_requires_stock: boolean;
  warn_on_open_quotations: boolean;
  warn_on_open_sales: boolean;
  warn_on_open_purchases: boolean;
  reports_zebra_striping: boolean;
  quotation_title: string | null;
  quotation_footer_text: string | null;
  sale_title: string | null;
  sale_footer_text: string | null;
  default_tax_rate_name: string | null;
  default_cash_account_name: string | null;
  updated_at: string;
};

type CashAccountRow = {
  id: number;
  name: string;
  is_inactive: boolean;
  created_at: string;
  updated_at: string;
};

type SeedCountsRow = {
  units_count: number;
  product_groups_count: number;
  tax_rates_count: number;
};

export async function getPrimaryOrganization() {
  const [organization] = await sql<OrganizationRow[]>`
    select id, name, slug, created_at
    from organizations
    order by id asc
    limit 1
  `;

  return organization ?? null;
}

export async function getSetupSnapshot() {
  const organization = await getPrimaryOrganization();

  if (!organization) {
    return {
      organization: null,
      companyProfile: null,
      businessSettings: null,
      cashAccounts: [],
      seedCounts: null
    };
  }

  const [companyProfile] = await sql<CompanyProfileRow[]>`
    select
      organization_id,
      trade_name,
      legal_name,
      document_number,
      state_registration,
      municipal_registration,
      email,
      phone,
      address_line,
      neighborhood,
      state_code,
      zip_code,
      responsible_name,
      logo_asset_url,
      updated_at
    from company_profiles
    where organization_id = ${organization.id}
    limit 1
  `;

  const [businessSettings] = await sql<BusinessSettingsRow[]>`
    select
      bs.organization_id,
      bs.default_interest_rate::text,
      bs.default_payment_interval_days,
      bs.default_first_due_days,
      bs.default_installment_count,
      bs.default_customer_credit_limit::text,
      bs.default_product_stock::text,
      bs.default_product_discount::text,
      bs.quotation_requires_stock,
      bs.sale_requires_stock,
      bs.warn_on_open_quotations,
      bs.warn_on_open_sales,
      bs.warn_on_open_purchases,
      bs.reports_zebra_striping,
      bs.quotation_title,
      bs.quotation_footer_text,
      bs.sale_title,
      bs.sale_footer_text,
      tr.name as default_tax_rate_name,
      ca.name as default_cash_account_name,
      bs.updated_at
    from business_settings bs
    left join tax_rates tr on tr.id = bs.default_tax_rate_id
    left join cash_accounts ca on ca.id = bs.default_cash_account_id
    where bs.organization_id = ${organization.id}
    limit 1
  `;

  const cashAccounts = await sql<CashAccountRow[]>`
    select id, name, is_inactive, created_at, updated_at
    from cash_accounts
    where organization_id = ${organization.id}
    order by is_inactive asc, name asc
  `;

  const [seedCounts] = await sql<SeedCountsRow[]>`
    select
      (select count(*)::int from units where organization_id = ${organization.id}) as units_count,
      (select count(*)::int from product_groups where organization_id = ${organization.id}) as product_groups_count,
      (select count(*)::int from tax_rates where organization_id = ${organization.id}) as tax_rates_count
  `;

  return {
    organization,
    companyProfile: companyProfile ?? null,
    businessSettings: businessSettings ?? null,
    cashAccounts,
    seedCounts: seedCounts ?? null
  };
}
