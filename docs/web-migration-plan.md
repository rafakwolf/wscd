# WSCD Web Migration Plan

## Purpose

This document captures the current understanding of the legacy Delphi ERP and turns it into a practical migration guide for rebuilding it as a web application.

It is designed to serve two purposes:

1. Guide implementation decisions for the web rewrite.
2. Act as handoff context for a future session so work can continue without re-reading the whole Delphi codebase.

---

## Project Summary

`WSCD` is a small ERP originally built in Delphi/VCL for small businesses such as bakeries, neighborhood markets, and similar operations.

Core business areas identified in the legacy system:

- Customer management
- Supplier management
- Product catalog and stock
- Quotations
- Sales
- Purchase entry
- Accounts payable
- Accounts receivable
- Cash ledger
- Promotions
- Inventory losses
- Reports

The legacy application entrypoint loads a large number of forms and reports in a desktop-first design:

- `WSCD.dpr`
- `Principal/unPrincipal.pas`

There is also an early API experiment using Horse:

- `Routes.pas`
- `Padrao/BaseController.pas`
- `Padrao/BaseRepo.pas`

This confirms that the system was already starting to move toward a service-oriented structure, but only for a few entities.

---

## Migration Goal

Rebuild the ERP for the web while preserving the useful business workflows and simplifying areas that only made sense in a desktop application.

Constraints and assumptions already agreed:

- Authentication from the Delphi app will not be migrated.
- A third-party auth provider such as Clerk can be used later.
- Reports can be rendered in HTML.
- Firebird will be replaced by PostgreSQL.
- The product should stay small-business oriented, not enterprise-heavy.
- Legacy data migration is not required because the Delphi project is not in production.

---

## Legacy Inventory

### Main desktop modules

The desktop app exposes the following relevant functional areas:

- `Cadastros`
  - clients
  - suppliers
  - products
  - product listings
- `Movimentos`
  - sales
  - quotations
  - purchases / purchase invoices
  - accounts payable
  - accounts receivable
  - cash ledger
  - promotions
  - losses
  - checks
- `Configuracoes`
  - company data
  - groups
  - units
  - cities
  - cash accounts
  - banks
  - tax rates / CFOP
  - local/global configuration
- `Utilitarios`
  - agenda
  - backup/restore
  - receipts / promissory notes / envelopes
  - phone search

### ORM-style domain classes already present

Some newer files map Firebird tables to entities and are useful as domain references:

- `Cadastros/Cliente/Cliente.pas`
- `Cadastros/Fornecedor/Fornecedor.pas`
- `Configuracoes/ContaCaixa/ContaCaixa.pas`
- `Configuracoes/Vendedor/Vendedor.pas`
- `Configuracoes/grupo/GrupoProduto.pas`
- `Movimentos/ContasPagar/ContasPagar.pas`
- `Movimentos/ContasReceber/ContasReceber.pas`
- `Movimentos/Caixa/Caixa.pas`
- `Utilitarios/Cidades/Cidades.pas`

These classes are useful as a business vocabulary reference, but should not be copied blindly because they still reflect Firebird and Delphi-era choices.

---

## Recommended Product Scope

### Keep in the web MVP

These modules clearly fit a small web ERP and should be preserved:

- Dashboard / operational summaries
- Customers
- Suppliers
- Products
- Product groups
- Units
- Cities
- Vendors / salespeople
- Cash accounts
- Banks
- Quotations
- Sales
- Purchase entry
- Accounts payable
- Accounts receivable
- Cash ledger
- Promotions
- Losses
- Company profile
- HTML reports

### Keep, but simplify

- CFOP and tax support
  - keep only if the intended users really need purchase/sales fiscal metadata
  - otherwise move to phase 2
- Customer credit analysis
  - keep credit limit and overdue visibility
  - drop overly personal registration fields from the first version
- Checks
  - keep only if the business still uses them
  - otherwise move to phase 2
- Purchase invoices
  - keep as "purchase entries" rather than aiming for full fiscal automation

### Leave out in the first web version

These areas are strongly desktop-specific, low value, or can be replaced later:

- Legacy auth, users, passwords, local access screens
- Printer setup dialogs
- Wallpaper/background personalization
- "Tip of the day"
- Local machine configuration
- Local connection setup
- Calculator / text editor launchers
- Desktop backup/restore screens
- License/serial/HD validation
- Promissory note printing
- Envelope printing
- Low-level SQL command execution UI
- Legacy log viewers tied to the old app behavior

### Likely discard permanently

Unless a real business need appears, these can stay out of the product:

- Desktop wallpaper/image settings
- Local SMTP test UI
- Local export directory preferences
- Desktop tray behavior
- Per-machine behavior toggles

---

## Suggested Web Product Model

### User model

Use third-party auth later and keep domain ownership separate from identity.

Recommended approach:

- External auth provider for login/session
- Internal `organization` or `workspace` model
- All business records linked to organization

Do not port:

- `USUARIOS`
- `PERFIL`
- `ITEMPERFIL`
- password fields
- access forms

The only exception is if you later want app-level roles such as `owner`, `manager`, `cashier`, but that should be redesigned rather than migrated from Delphi.

### Business modules

Recommended modules for the web app:

- `catalog`
  - customers
  - suppliers
  - products
  - groups
  - units
  - cities
  - vendors
  - banks
  - cash accounts
- `sales`
  - quotations
  - quotation items
  - sales
  - sale items
  - sale receipts
- `purchasing`
  - purchase entries
  - purchase items
  - purchase payments
- `finance`
  - accounts receivable
  - accounts payable
  - cash ledger
  - promotions
  - losses
- `settings`
  - company profile
  - business rules
  - report preferences
- `reports`
  - HTML report pages with print/export support

---

## Firebird to PostgreSQL Migration Notes

### Important

The legacy system stores business behavior both:

- in Delphi forms and event handlers
- in Firebird procedures, triggers, computed fields, and views

The migration must preserve the behavior, not just the tables.

### Tables identified as core

These tables form the core of the ERP:

- `CLIENTES`
- `FORNECEDORES`
- `PRODUTOS`
- `GRUPOS`
- `UNIDADES`
- `CIDADES`
- `VENDEDOR`
- `BANCO`
- `CAIXAS`
- `CAIXA`
- `ORCAMENTO`
- `ITEMORCAMENTO`
- `VENDA`
- `ITEMVENDA`
- `RECTOVENDA`
- `NOTAS_FISCAIS`
- `ITEMNOTAFISCAL`
- `PAGTOCOMPRA`
- `CONTASRECEBER`
- `CONTASPAGAR`
- `PROMOCAO`
- `PERDA`
- `EMPRESA`
- `CONFIGURACAO`
- `CONFIGURACAOGLOBAL`

### PostgreSQL migration rules

#### 1. Replace `max(id) + 1`

Legacy procedure `STPGETID` builds IDs using `max(field)+1`.

That is unsafe in a web app with concurrent users.

Use PostgreSQL:

- `generated by default as identity`, or
- explicit `sequence`

for every primary key.

Do not preserve the old key generation behavior.

#### 2. Replace Firebird computed fields

The legacy database computes fields like:

- receivable/payable delay
- interest
- total amount with interest
- stock value

These appear in:

- `CONTASPAGAR`
- `CONTASRECEBER`
- `PRODUTOS`

Recommended approach:

- store raw columns only
- compute derived values in SQL views or application services
- use database views only for reporting convenience, not as the main write model

#### 3. Replace `S/N` and custom boolean strings

Many flags use `'S'` / `'N'` or `"BOOLEAN"` character values.

In PostgreSQL, convert to proper `boolean` columns:

- `true`
- `false`

Examples:

- `CONCLUIDA`
- `BAIXADO`
- `CANCELADO`
- `PAGA`
- `RECDA`
- `PROMOCAO`
- `EXCLUIR`
- `INATIVO`

#### 4. Replace BLOBs carefully

Legacy BLOB usage includes:

- notes / observations
- company logo
- customer photo

Recommended mapping:

- text notes -> `text`
- images -> file/object storage with URL metadata in PostgreSQL

Avoid keeping binary files directly in PostgreSQL unless there is a strong reason.

#### 5. Use timestamps consistently

Legacy fields mix date-only and datetime usage.

Recommended standard:

- business dates such as `sale_date`, `due_date`, `issue_date` -> `date`
- audit timestamps such as `created_at`, `updated_at`, `received_at` -> `timestamp with time zone`

---

## Proposed PostgreSQL Domain Model

This is not final DDL. It is the recommended logical model.

### Catalog

#### customers

Base fields for MVP:

- `id`
- `organization_id`
- `type`
- `name`
- `document`
- `state_registration`
- `email`
- `phone`
- `address_line`
- `neighborhood`
- `city_id`
- `state`
- `zip_code`
- `birth_date`
- `credit_limit`
- `notes`
- `is_active`
- `created_at`
- `updated_at`

Fields from the legacy customer record that can be moved to phase 2 or dropped:

- employer/work history
- salary
- spouse/parents
- personal references
- commercial references
- customer photo

#### suppliers

- `id`
- `organization_id`
- `trade_name`
- `legal_name`
- `document`
- `state_registration`
- `email`
- `phone`
- `address_line`
- `neighborhood`
- `city_id`
- `state`
- `zip_code`
- `sales_contact_name`
- `sales_contact_phone`
- `sales_contact_email`
- `notes`
- `is_active`
- `created_at`
- `updated_at`

#### products

- `id`
- `organization_id`
- `barcode`
- `reference`
- `name`
- `short_name`
- `supplier_id`
- `group_id`
- `unit_id`
- `tax_rate_id`
- `expiration_date`
- `weight`
- `cost_price`
- `markup_percent`
- `sale_price`
- `promo_price`
- `current_stock`
- `minimum_stock`
- `received_quantity`
- `received_date`
- `is_promo_active`
- `is_deleted_legacy`
- `notes`
- `created_at`
- `updated_at`

Derived, not stored:

- `stock_value = current_stock * cost_price`

#### groups

- `id`
- `organization_id`
- `name`

#### units

- `id`
- `organization_id`
- `name`

#### cities

- `id`
- `name`
- `state_code`

#### vendors

- `id`
- `organization_id`
- `name`
- `is_active`

#### banks

- `id`
- `organization_id`
- `name`

#### cash_accounts

- `id`
- `organization_id`
- `name`
- `is_inactive`

### Sales

#### quotations

- `id`
- `organization_id`
- `customer_id`
- `vendor_id`
- `quotation_date`
- `status`
- `is_completed`
- `notes`
- `item_count`
- `total_amount`
- `created_at`
- `updated_at`

#### quotation_items

- `id`
- `quotation_id`
- `product_id`
- `quantity`
- `cost_price_snapshot`
- `sale_price_snapshot`
- `discount_percent`
- `discount_amount`
- `total_amount`

#### sales

- `id`
- `organization_id`
- `customer_id`
- `vendor_id`
- `sale_date`
- `notes`
- `total_discount`
- `total_amount`
- `is_completed`
- `is_stock_posted`
- `is_canceled`
- `created_at`
- `updated_at`

#### sale_items

- `id`
- `sale_id`
- `product_id`
- `quantity`
- `cost_price_snapshot`
- `sale_price_snapshot`
- `discount_percent`
- `discount_amount`
- `total_amount`
- `commission_percent`
- `commission_amount`

#### sale_receipts

- `id`
- `sale_id`
- `receipt_date`
- `payment_method`
- `amount_received`
- `remaining_amount`

### Purchasing

#### purchases

This can be named `purchase_entries` in the app, even if the legacy calls it `NOTAS_FISCAIS`.

- `id`
- `organization_id`
- `supplier_id`
- `issue_date`
- `entry_date`
- `cfop_code`
- `discount_amount`
- `icms_amount`
- `ipi_amount`
- `freight_amount`
- `other_costs_amount`
- `items_total`
- `total_amount`
- `notes`
- `is_stock_posted`
- `is_completed`
- `is_canceled`
- `created_at`
- `updated_at`

#### purchase_items

- `id`
- `purchase_id`
- `product_id`
- `tax_rate_id`
- `quantity`
- `total_amount`
- `cost_price_snapshot`
- `markup_percent`
- `sale_price_snapshot`
- `ipi_amount`
- `discount_amount`

#### purchase_payments

- `id`
- `purchase_id`
- `payment_date`
- `payment_method`
- `amount_paid`
- `remaining_amount`

### Finance

#### accounts_receivable

- `id`
- `organization_id`
- `customer_id`
- `sale_id`
- `cash_account_id`
- `origin_type`
- `entry_date`
- `due_date`
- `description`
- `document_number`
- `principal_amount`
- `interest_rate`
- `amount_received`
- `interest_received`
- `discount_amount`
- `receipt_date`
- `is_open`
- `is_received`
- `notes`
- `created_at`
- `updated_at`

Derived:

- `delay_days`
- `interest_amount`
- `total_amount`
- `total_received`

#### accounts_payable

- `id`
- `organization_id`
- `supplier_id`
- `purchase_id`
- `cash_account_id`
- `origin_type`
- `entry_date`
- `due_date`
- `description`
- `document_number`
- `principal_amount`
- `interest_rate`
- `amount_paid`
- `interest_paid`
- `discount_amount`
- `payment_date`
- `is_open`
- `is_paid`
- `notes`
- `created_at`
- `updated_at`

Derived:

- `delay_days`
- `interest_amount`
- `total_amount`
- `total_paid`

#### cash_entries

- `id`
- `organization_id`
- `cash_account_id`
- `entry_date`
- `description`
- `document_number`
- `entry_type`
- `amount`
- `source_type`
- `source_id`
- `is_deleted_legacy`
- `created_at`

`entry_type` should be normalized, for example:

- `credit`
- `debit`

#### promotions

- `id`
- `organization_id`
- `product_id`
- `discount_amount`
- `promotional_price`
- `start_date`
- `end_date`
- `created_at`

#### losses

- `id`
- `organization_id`
- `product_id`
- `quantity`
- `unit_price_snapshot`
- `loss_date`
- `reason`
- `notes`

### Settings

#### company_profile

- `organization_id`
- `trade_name`
- `legal_name`
- `document`
- `state_registration`
- `municipal_registration`
- `email`
- `phone`
- `fax`
- `address_line`
- `neighborhood`
- `city_id`
- `state`
- `zip_code`
- `responsible_name`
- `logo_asset_url`

#### business_settings

This should merge the useful parts of `CONFIGURACAO` and `CONFIGURACAOGLOBAL`.

Keep only business rules that still matter:

- default interest rate
- default payment interval
- default installment count
- default customer limit
- default tax rate
- default stock value
- default product discount
- default cash account
- default check cash account
- sales require stock validation
- quotation require stock validation
- warn about open quotations / sales / purchases
- report labels / headers / footer texts

Do not carry over machine-local settings.

---

## Legacy Rule Mapping

### Rule group: stock movement

Current legacy behavior:

- Concluding a sale lowers stock.
- Estorno of a sale returns stock.
- Concluding a purchase raises stock and updates product price snapshots.
- Estorno of a purchase reverses stock changes.
- Registering a loss lowers stock.
- Changing/deleting a loss rebalances stock.
- Inserting/removing promotion updates product promotional fields.

Sources:

- `Movimentos/unVendas.pas`
- `Movimentos/unNotasFiscais.pas`
- Firebird procedures and triggers in `Database/CPR_05-08-2009.sql`

Recommended web implementation:

- Use explicit application services with DB transactions.
- Never rely on UI handlers for stock correctness.
- Store stock changes in an optional stock movement table if auditability is desired.

Suggested service operations:

- `completeSale(saleId)`
- `reopenSale(saleId)`
- `cancelSale(saleId)`
- `completePurchase(purchaseId)`
- `reopenPurchase(purchaseId)`
- `registerLoss(lossId)`
- `reverseLoss(lossId)`
- `activatePromotion(promotionId)`
- `deactivatePromotion(promotionId)`

### Rule group: finance propagation

Current legacy behavior:

- Sale receipts are tied to `RECTOVENDA`.
- Purchase payments are tied to `PAGTOCOMPRA`.
- Deleting receivable/payable may also remove matching cash entries.
- Canceling or estorno of sale/purchase removes linked finance effects from other tables.

Recommended web implementation:

- Model finance relations explicitly.
- Use source references on cash entries:
  - `source_type`
  - `source_id`
- Avoid deleting ledger records when possible.
- Prefer cancellation or reversal records over destructive deletes.

For a modern web ERP, auditability is better if:

- records are soft-canceled or reversed
- cash ledger history remains visible

The legacy deletion logic can still inform the business flow, but should not necessarily be copied exactly.

### Rule group: quotation to sale conversion

Current legacy behavior:

- Quotations can be imported into sales.
- Quotations can remain open and later block clean workflow if not concluded.

Recommended web implementation:

- Add `convertQuotationToSale(quotationId)`
- On conversion:
  - create sale
  - copy item snapshots
  - mark quotation as converted or completed
- Avoid hidden coupling in the UI

### Rule group: overdue/credit visibility

Current legacy behavior:

- Customer situation is checked using total receivables, overdue amount, first due date, and delay days.

Recommended web implementation:

- Provide computed customer finance summary:
  - open receivables total
  - overdue receivables total
  - oldest overdue date
  - delay days
  - available credit

This fits the small-business ERP use case well and should remain.

---

## Suggested Report Set

Render as HTML first, with print styles and optional PDF export later.

### Reports worth keeping in MVP

- Sales by date range
- Sales by customer
- Sales commission by vendor
- Quotations by date range
- Purchases by date range
- Purchases by supplier
- Accounts receivable by date range
- Accounts receivable overdue
- Accounts payable by date range
- Accounts payable overdue
- Cash ledger by period
- Cash flow summary
- Stock list
- Minimum stock products
- Products by group
- Product price list
- Products by expiration date
- Revenue/faturamento

### Reports to move to phase 2

- Label printing layouts
- Bobina-specific layouts
- Duplicata / promissory note forms
- Envelope printing

For the web, these should be redesigned as printable HTML templates instead of Delphi report forms.

---

## MVP Screens

Recommended first web screens:

1. Dashboard
2. Customers list + form
3. Suppliers list + form
4. Products list + form
5. Quotations list + detail
6. Sales list + detail
7. Purchase entries list + detail
8. Accounts receivable list + settlement flow
9. Accounts payable list + payment flow
10. Cash ledger list + manual entry
11. Promotions list + form
12. Losses list + form
13. Company settings
14. Basic reports pages

Supporting admin screens:

- groups
- units
- cities
- vendors
- banks
- cash accounts

---

## Suggested Backend API Shape

This is a reference shape, not a mandatory contract.

### Catalog

- `GET /api/customers`
- `POST /api/customers`
- `GET /api/customers/:id`
- `PUT /api/customers/:id`
- `GET /api/suppliers`
- `GET /api/products`
- `GET /api/groups`
- `GET /api/units`
- `GET /api/cities`
- `GET /api/vendors`
- `GET /api/banks`
- `GET /api/cash-accounts`

### Sales

- `GET /api/quotations`
- `POST /api/quotations`
- `POST /api/quotations/:id/convert-to-sale`
- `GET /api/sales`
- `POST /api/sales`
- `POST /api/sales/:id/complete`
- `POST /api/sales/:id/reopen`
- `POST /api/sales/:id/cancel`
- `POST /api/sales/:id/receive`

### Purchasing

- `GET /api/purchases`
- `POST /api/purchases`
- `POST /api/purchases/:id/complete`
- `POST /api/purchases/:id/reopen`
- `POST /api/purchases/:id/pay`

### Finance

- `GET /api/accounts-receivable`
- `POST /api/accounts-receivable/:id/settle`
- `GET /api/accounts-payable`
- `POST /api/accounts-payable/:id/pay`
- `GET /api/cash-entries`
- `POST /api/cash-entries`

### Reports

- `GET /reports/sales`
- `GET /reports/purchases`
- `GET /reports/accounts-receivable`
- `GET /reports/accounts-payable`
- `GET /reports/cash-flow`
- `GET /reports/stock`

---

## Product Decisions Recommended Now

These decisions would reduce migration risk significantly:

### Decide yes now

- Use PostgreSQL as the source of truth.
- Rebuild workflows as transactional services, not screen logic.
- Keep the ERP focused on small businesses.
- Keep reports as HTML-first.
- Use proper booleans and identities in the new database.
- Drop legacy local-machine settings.

### Decide later

- Whether to keep checks in MVP
- Whether to keep CFOP/tax setup in MVP
- Whether to keep agenda/utilities at all
- Whether to support multi-tenant organizations from day 1
- Whether to add inventory movement history table

---

## Proposed Delivery Phases

### Phase 0: Discovery and schema design

Deliverables:

- final MVP scope
- PostgreSQL logical schema
- workflow definitions
- migration map from Firebird

### Phase 1: Foundation

Deliverables:

- web app scaffold
- auth integration placeholder
- organization model
- PostgreSQL schema
- seed data support
- base UI layout

### Phase 2: Catalog

Deliverables:

- customers
- suppliers
- products
- groups
- units
- cities
- vendors
- banks
- cash accounts

### Phase 3: Sales and quotations

Deliverables:

- quotations
- quotation items
- sales
- sale items
- quotation -> sale conversion
- stock posting for sales

### Phase 4: Purchasing

Deliverables:

- purchase entries
- purchase items
- stock posting for purchases
- payment records

### Phase 5: Finance

Deliverables:

- accounts receivable
- accounts payable
- cash ledger
- settlement flows
- overdue calculations

### Phase 6: Operational extras

Deliverables:

- promotions
- losses
- customer finance summary
- optional check support

### Phase 7: Reports

Deliverables:

- HTML reports
- print-friendly styles
- optional export

### Phase 8: Data migration

Deliverables:

- Firebird extraction scripts
- PostgreSQL import
- validation reports
- reconciliation checks

---

## Data Migration Strategy

Legacy data migration is currently optional and can be skipped.

Because the Delphi system is not in production, the recommended approach is:

- start the web ERP with a clean PostgreSQL database
- create only essential bootstrap/seed records
- avoid spending time on Firebird import tooling unless a real migration need appears later

### If data migration ever becomes necessary

Recommended migration order:

1. cities
2. groups
3. units
4. banks
5. cash accounts
6. vendors
7. suppliers
8. customers
9. products
10. company/settings
11. quotations and quotation items
12. sales and sale items
13. sale receipts
14. purchases and purchase items
15. purchase payments
16. receivables
17. payables
18. cash entries
19. promotions
20. losses

### Migration cautions

- Validate stock totals after importing:
  - product stock
  - purchase effects
  - sale effects
  - loss effects
- Validate financial totals after importing:
  - receivables open balance
  - payables open balance
  - cash ledger balance
- Decide whether canceled legacy records should be imported:
  - usually yes, but clearly marked
- Decide whether old machine-specific configuration should be ignored:
  - recommended yes

### Suggested import approach

- Export Firebird tables to CSV or intermediate SQL
- Import base reference tables first
- Import transactional tables in dependency order
- Recalculate derived fields in PostgreSQL
- Run reconciliation scripts after import

---

## What Should Not Be Ported Literally

These legacy ideas should be translated, not copied:

- Form event handlers
- Stored procedures with side effects hidden from UI
- `max(id)+1` ID generation
- desktop-only config tables
- machine name driven settings
- printer and bobina assumptions
- destructive deletes as the normal way to cancel history

---

## Risks

### High risk

- Losing stock consistency during sale/purchase migration
- Losing finance consistency across sale/purchase/cash relationships
- Copying Firebird behaviors without redesigning for concurrency
- Porting too many desktop-only settings into the new app

### Medium risk

- Customer schema becoming too large for the real business need
- Overbuilding fiscal/tax modules too early
- Migrating legacy reporting formats too literally

### Low risk

- Simple catalog entities like groups, units, banks, cities

---

## Recommended Next Implementation Step

The next concrete step should be:

1. Freeze the MVP scope.
2. Design the PostgreSQL schema for the kept modules.
3. Define the transactional service layer for:
   - complete sale
   - reopen/cancel sale
   - complete purchase
   - reopen purchase
   - settle receivable
   - pay payable
   - create cash entry
   - convert quotation to sale

Only after that should UI implementation begin.

---

## Handoff Notes For A New Session

If this project is reopened in a new session, the next agent should assume:

- The legacy system has already been analyzed at a functional level.
- The rewrite target is a web ERP for small businesses.
- Auth migration is intentionally out of scope.
- PostgreSQL is the target database.
- Reports should be HTML-first.
- Desktop-only features should be actively filtered out.

### Legacy source hotspots already identified

- app/module inventory:
  - `WSCD.dpr`
  - `Principal/unPrincipal.pas`
- database connection:
  - `Principal/unDmPrincipal.pas`
- configuration model:
  - `Configuracoes/unConfiguracao.pas`
  - `Configuracoes/unConfiguracaoGlobal.pas`
  - `Util/uClasses.pas`
- domain entities:
  - `Cadastros/Cliente/Cliente.pas`
  - `Cadastros/Fornecedor/Fornecedor.pas`
  - `Movimentos/ContasReceber/ContasReceber.pas`
  - `Movimentos/ContasPagar/ContasPagar.pas`
  - `Movimentos/Caixa/Caixa.pas`
  - `Configuracoes/ContaCaixa/ContaCaixa.pas`
- critical desktop workflows:
  - `Movimentos/unVendas.pas`
  - `Movimentos/unOrcamentos.pas`
  - `Movimentos/unNotasFiscais.pas`
  - `Movimentos/unCaixa.pas`
- Firebird schema and business rules:
  - `Database/CPR_05-08-2009.sql`

### Best next task after this document

Create a technical specification for the target PostgreSQL schema and service layer, including:

- final table list
- column definitions
- enum/status definitions
- foreign keys
- transaction boundaries
- data migration assumptions

That would be the right base before coding the web application.

---

## Status

Current understanding level: approximately 70-80%.

Enough context exists to proceed into:

- schema design
- service design
- backlog breakdown

Not enough detail yet for:

- perfect data migration scripts
- exact UX flows for every screen
- final decision on fiscal/check-related modules
