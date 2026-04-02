begin;

with inserted_org as (
  insert into organizations (name, slug)
  values ('WSCD Demo', 'wscd-demo')
  on conflict (slug) do update
    set name = excluded.name,
        updated_at = now()
  returning id
)
insert into company_profiles (
  organization_id,
  trade_name,
  legal_name,
  document_number,
  email,
  phone,
  responsible_name
)
select
  id,
  'WSCD Demo',
  'WSCD Demo Ltda',
  '00.000.000/0001-00',
  'contato@wscd.local',
  '(00) 0000-0000',
  'Owner'
from inserted_org
on conflict (organization_id) do update
  set trade_name = excluded.trade_name,
      legal_name = excluded.legal_name,
      document_number = excluded.document_number,
      email = excluded.email,
      phone = excluded.phone,
      responsible_name = excluded.responsible_name,
      updated_at = now();

with target_org as (
  select id from organizations where slug = 'wscd-demo'
)
insert into tax_rates (organization_id, name, rate_percent)
select id, 'Padrao', 0.00
from target_org
where not exists (
  select 1
  from tax_rates tr
  where tr.organization_id = target_org.id
);

with target_org as (
  select id from organizations where slug = 'wscd-demo'
)
insert into cash_accounts (organization_id, name, is_inactive)
select id, 'Caixa Principal', false
from target_org
where not exists (
  select 1
  from cash_accounts ca
  where ca.organization_id = target_org.id
    and ca.name = 'Caixa Principal'
);

with target_org as (
  select id from organizations where slug = 'wscd-demo'
)
insert into units (organization_id, name, abbreviation)
select id, seed.name, seed.abbreviation
from target_org
cross join (
  values
    ('Unidade', 'UN'),
    ('Quilograma', 'KG'),
    ('Pacote', 'PCT')
) as seed(name, abbreviation)
where not exists (
  select 1
  from units u
  where u.organization_id = target_org.id
    and u.name = seed.name
);

with target_org as (
  select id from organizations where slug = 'wscd-demo'
)
insert into product_groups (organization_id, name)
select id, seed.name
from target_org
cross join (
  values
    ('Mercearia'),
    ('Padaria'),
    ('Bebidas')
) as seed(name)
where not exists (
  select 1
  from product_groups pg
  where pg.organization_id = target_org.id
    and pg.name = seed.name
);

with target_org as (
  select
    o.id as organization_id,
    min(tr.id) as default_tax_rate_id,
    min(ca.id) as default_cash_account_id
  from organizations o
  left join tax_rates tr on tr.organization_id = o.id
  left join cash_accounts ca on ca.organization_id = o.id
  where o.slug = 'wscd-demo'
  group by o.id
)
insert into business_settings (
  organization_id,
  default_interest_rate,
  default_payment_interval_days,
  default_first_due_days,
  default_installment_count,
  default_customer_credit_limit,
  default_tax_rate_id,
  default_product_stock,
  default_product_discount,
  default_cash_account_id,
  quotation_requires_stock,
  sale_requires_stock,
  warn_on_open_quotations,
  warn_on_open_sales,
  warn_on_open_purchases,
  reports_zebra_striping,
  quotation_title,
  quotation_footer_text,
  sale_title,
  sale_footer_text
)
select
  organization_id,
  0.00,
  30,
  30,
  1,
  0.00,
  default_tax_rate_id,
  0,
  0.00,
  default_cash_account_id,
  false,
  true,
  true,
  true,
  true,
  true,
  'Orcamento',
  'Obrigado pela preferencia.',
  'Venda',
  'Volte sempre.'
from target_org
on conflict (organization_id) do update
  set default_interest_rate = excluded.default_interest_rate,
      default_payment_interval_days = excluded.default_payment_interval_days,
      default_first_due_days = excluded.default_first_due_days,
      default_installment_count = excluded.default_installment_count,
      default_customer_credit_limit = excluded.default_customer_credit_limit,
      default_tax_rate_id = excluded.default_tax_rate_id,
      default_product_stock = excluded.default_product_stock,
      default_product_discount = excluded.default_product_discount,
      default_cash_account_id = excluded.default_cash_account_id,
      quotation_requires_stock = excluded.quotation_requires_stock,
      sale_requires_stock = excluded.sale_requires_stock,
      warn_on_open_quotations = excluded.warn_on_open_quotations,
      warn_on_open_sales = excluded.warn_on_open_sales,
      warn_on_open_purchases = excluded.warn_on_open_purchases,
      reports_zebra_striping = excluded.reports_zebra_striping,
      quotation_title = excluded.quotation_title,
      quotation_footer_text = excluded.quotation_footer_text,
      sale_title = excluded.sale_title,
      sale_footer_text = excluded.sale_footer_text,
      updated_at = now();

commit;
