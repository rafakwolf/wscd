begin;

create or replace view v_product_stock as
select
  p.id,
  p.organization_id,
  p.name,
  p.barcode,
  p.reference,
  p.current_stock,
  p.minimum_stock,
  p.cost_price,
  p.sale_price,
  (p.current_stock * p.cost_price) as stock_value,
  (p.current_stock <= p.minimum_stock) as is_below_minimum,
  pg.name as group_name,
  s.trade_name as supplier_name
from products p
left join product_groups pg on pg.id = p.group_id
left join suppliers s on s.id = p.supplier_id;

create or replace view v_accounts_receivable_summary as
select
  ar.id,
  ar.organization_id,
  ar.customer_id,
  c.name as customer_name,
  ar.sale_id,
  ar.cash_account_id,
  ar.origin_type,
  ar.entry_date,
  ar.due_date,
  ar.description,
  ar.document_number,
  ar.principal_amount,
  ar.interest_rate,
  ar.amount_received,
  ar.interest_received,
  ar.discount_amount,
  ar.receipt_date,
  ar.is_open,
  ar.is_received,
  ar.notes,
  case
    when ar.is_received and ar.receipt_date > ar.due_date then (ar.receipt_date - ar.due_date)
    when not ar.is_received and current_date > ar.due_date then (current_date - ar.due_date)
    else 0
  end::integer as delay_days,
  round(
    ar.principal_amount
    * ar.interest_rate
    * (
      case
        when ar.is_received and ar.receipt_date > ar.due_date then (ar.receipt_date - ar.due_date)
        when not ar.is_received and current_date > ar.due_date then (current_date - ar.due_date)
        else 0
      end
    ) / 100.0 / 30.0,
    2
  ) as interest_amount,
  round(
    ar.principal_amount
    + (
      ar.principal_amount
      * ar.interest_rate
      * (
        case
          when ar.is_received and ar.receipt_date > ar.due_date then (ar.receipt_date - ar.due_date)
          when not ar.is_received and current_date > ar.due_date then (current_date - ar.due_date)
          else 0
        end
      ) / 100.0 / 30.0
    )
    - ar.discount_amount,
    2
  ) as total_amount,
  round(ar.amount_received + ar.interest_received, 2) as total_received_amount
from accounts_receivable ar
left join customers c on c.id = ar.customer_id;

create or replace view v_accounts_payable_summary as
select
  ap.id,
  ap.organization_id,
  ap.supplier_id,
  s.trade_name as supplier_name,
  ap.purchase_id,
  ap.cash_account_id,
  ap.origin_type,
  ap.entry_date,
  ap.due_date,
  ap.description,
  ap.document_number,
  ap.principal_amount,
  ap.interest_rate,
  ap.amount_paid,
  ap.interest_paid,
  ap.discount_amount,
  ap.payment_date,
  ap.is_open,
  ap.is_paid,
  ap.notes,
  case
    when ap.is_paid and ap.payment_date > ap.due_date then (ap.payment_date - ap.due_date)
    when not ap.is_paid and current_date > ap.due_date then (current_date - ap.due_date)
    else 0
  end::integer as delay_days,
  round(
    ap.principal_amount
    * ap.interest_rate
    * (
      case
        when ap.is_paid and ap.payment_date > ap.due_date then (ap.payment_date - ap.due_date)
        when not ap.is_paid and current_date > ap.due_date then (current_date - ap.due_date)
        else 0
      end
    ) / 100.0 / 30.0,
    2
  ) as interest_amount,
  round(
    ap.principal_amount
    + (
      ap.principal_amount
      * ap.interest_rate
      * (
        case
          when ap.is_paid and ap.payment_date > ap.due_date then (ap.payment_date - ap.due_date)
          when not ap.is_paid and current_date > ap.due_date then (current_date - ap.due_date)
          else 0
        end
      ) / 100.0 / 30.0
    )
    - ap.discount_amount,
    2
  ) as total_amount,
  round(ap.amount_paid + ap.interest_paid, 2) as total_paid_amount
from accounts_payable ap
left join suppliers s on s.id = ap.supplier_id;

create or replace view v_cash_balance_by_account as
select
  ce.organization_id,
  ce.cash_account_id,
  ca.name as cash_account_name,
  sum(case when ce.entry_type = 'credit' then ce.amount else 0 end) as total_credits,
  sum(case when ce.entry_type = 'debit' then ce.amount else 0 end) as total_debits,
  sum(case when ce.entry_type = 'credit' then ce.amount else -ce.amount end) as balance
from cash_entries ce
join cash_accounts ca on ca.id = ce.cash_account_id
group by ce.organization_id, ce.cash_account_id, ca.name;

create or replace view v_customer_financial_summary as
select
  c.organization_id,
  c.id as customer_id,
  c.name as customer_name,
  c.credit_limit,
  coalesce(sum(case when ar.is_received = false then ar.principal_amount else 0 end), 0) as open_principal_amount,
  coalesce(sum(case when ar.is_received = false and ar.due_date < current_date then ar.principal_amount else 0 end), 0) as overdue_principal_amount,
  min(case when ar.is_received = false then ar.due_date end) as first_open_due_date,
  min(case when ar.is_received = false and ar.due_date < current_date then ar.due_date end) as first_overdue_date
from customers c
left join accounts_receivable ar on ar.customer_id = c.id
group by c.organization_id, c.id, c.name, c.credit_limit;

commit;
