import { sql } from "@/server/db/client";
import { getPrimaryOrganization } from "@/server/setup";

type ProductGroupRow = {
  id: number;
  name: string;
  created_at: string;
  updated_at: string;
};

type UnitRow = {
  id: number;
  name: string;
  abbreviation: string | null;
  created_at: string;
  updated_at: string;
};

type SupplierRow = {
  id: number;
  trade_name: string;
  legal_name: string | null;
  document_number: string | null;
  email: string | null;
  phone: string | null;
  sales_contact_name: string | null;
  sales_contact_phone: string | null;
  sales_contact_email: string | null;
  notes: string | null;
  is_active: boolean;
  created_at: string;
  updated_at: string;
};

type ProductRow = {
  id: number;
  name: string;
  barcode: string | null;
  reference: string | null;
  sale_price: string;
  current_stock: string;
  minimum_stock: string;
  is_archived: boolean;
  supplier_name: string | null;
  group_name: string | null;
  unit_abbreviation: string | null;
  updated_at: string;
};

type CatalogCountsRow = {
  groups_count: number;
  units_count: number;
  suppliers_count: number;
  active_suppliers_count: number;
  products_count: number;
  archived_products_count: number;
};

export async function getCatalogSnapshot() {
  const organization = await getPrimaryOrganization();

  if (!organization) {
    return {
      organization: null,
      groups: [],
      units: [],
      suppliers: [],
      products: [],
      counts: null
    };
  }

  const [groups, units, suppliers, products, counts] = await Promise.all([
    sql<ProductGroupRow[]>`
      select id, name, created_at, updated_at
      from product_groups
      where organization_id = ${organization.id}
      order by name asc
    `,
    sql<UnitRow[]>`
      select id, name, abbreviation, created_at, updated_at
      from units
      where organization_id = ${organization.id}
      order by name asc
    `,
    sql<SupplierRow[]>`
      select
        id,
        trade_name,
        legal_name,
        document_number,
        email,
        phone,
        sales_contact_name,
        sales_contact_phone,
        sales_contact_email,
        notes,
        is_active,
        created_at,
        updated_at
      from suppliers
      where organization_id = ${organization.id}
      order by is_active desc, trade_name asc
    `,
    sql<ProductRow[]>`
      select
        p.id,
        p.name,
        p.barcode,
        p.reference,
        p.sale_price::text,
        p.current_stock::text,
        p.minimum_stock::text,
        p.is_archived,
        s.trade_name as supplier_name,
        pg.name as group_name,
        u.abbreviation as unit_abbreviation,
        p.updated_at
      from products p
      left join suppliers s on s.id = p.supplier_id
      left join product_groups pg on pg.id = p.group_id
      left join units u on u.id = p.unit_id
      where p.organization_id = ${organization.id}
      order by p.is_archived asc, p.name asc
      limit 20
    `,
    sql<CatalogCountsRow[]>`
      select
        (select count(*)::int from product_groups where organization_id = ${organization.id}) as groups_count,
        (select count(*)::int from units where organization_id = ${organization.id}) as units_count,
        (select count(*)::int from suppliers where organization_id = ${organization.id}) as suppliers_count,
        (select count(*)::int from suppliers where organization_id = ${organization.id} and is_active) as active_suppliers_count,
        (select count(*)::int from products where organization_id = ${organization.id}) as products_count,
        (select count(*)::int from products where organization_id = ${organization.id} and is_archived) as archived_products_count
    `.then((rows) => rows[0] ?? null)
  ]);

  return {
    organization,
    groups,
    units,
    suppliers,
    products,
    counts
  };
}
