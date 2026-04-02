# WSCD Web Implementation Blueprint

## Purpose

This document turns the analysis and PostgreSQL draft schema into an implementation-oriented blueprint for building the web version of WSCD.

It is intentionally written for a greenfield rebuild:

- no legacy auth migration
- no legacy data migration
- no attempt to preserve Delphi/VCL UI structure

This should be the main handoff document for starting the real web application.

Related documents:

- [web-migration-plan.md](/Users/rafakwolf/Developer/p/wscd/docs/web-migration-plan.md)
- [postgresql-schema-and-services-spec.md](/Users/rafakwolf/Developer/p/wscd/docs/postgresql-schema-and-services-spec.md)
- [001_initial_schema.sql](/Users/rafakwolf/Developer/p/wscd/Database/postgresql/001_initial_schema.sql)
- [002_reporting_views.sql](/Users/rafakwolf/Developer/p/wscd/Database/postgresql/002_reporting_views.sql)

---

## Delivery Model

Recommended approach:

- build a fresh web product
- use the Delphi project as a business-rules reference
- ignore legacy desktop UI structure
- ignore legacy machine-local behavior
- seed only enough initial data to use the system

This is not a migration project in the ETL sense.
It is a controlled rewrite of domain behavior.

---

## Recommended Stack

### Application

- `Next.js`
- `TypeScript`
- App Router
- server actions or route handlers for internal mutations

### Database

- `PostgreSQL`

### Auth

- `Clerk`

### ORM / query layer

One of:

- `Prisma`
- `Drizzle`
- SQL-first with a light query layer

Recommendation:

- choose `Drizzle` if you want close alignment with the SQL-first schema already drafted
- choose `Prisma` if you want faster CRUD scaffolding and familiar tooling

### Validation

- `Zod`

### UI

- React
- a lightweight component layer
- avoid overengineering design system work at the start

### Reports

- server-rendered HTML pages
- print CSS
- optional PDF export later

---

## Recommended Repository Structure

If the web app will live in this same repository, a clean starting structure would be:

```text
apps/
  web/
    src/
      app/
      components/
      features/
      lib/
      server/
      styles/
packages/
  db/
    schema/
    migrations/
    seeds/
docs/
Database/postgresql/
```

If you prefer a single app only, a simpler structure is enough:

```text
web/
  src/
    app/
    components/
    features/
    lib/
    server/
    styles/
```

---

## Recommended Feature Modules

Each feature should own:

- domain types
- validation schemas
- database access
- service functions
- UI pages/components

Suggested feature modules:

- `features/catalog/customers`
- `features/catalog/suppliers`
- `features/catalog/products`
- `features/catalog/groups`
- `features/catalog/units`
- `features/catalog/cities`
- `features/catalog/vendors`
- `features/catalog/banks`
- `features/catalog/cash-accounts`
- `features/sales/quotations`
- `features/sales/sales`
- `features/purchasing/purchases`
- `features/finance/receivables`
- `features/finance/payables`
- `features/finance/cash`
- `features/inventory/promotions`
- `features/inventory/losses`
- `features/settings/company`
- `features/settings/business`
- `features/reports`

---

## Layering Recommendation

Keep the implementation split into 4 explicit layers.

### 1. Persistence layer

Responsibilities:

- database schema
- query functions
- repository-style helpers

Examples:

- `getCustomerById`
- `listProducts`
- `insertSale`
- `updateProductStock`

### 2. Service layer

Responsibilities:

- transaction boundaries
- business rules
- orchestration across multiple tables

Examples:

- `completeSale`
- `cancelSale`
- `convertQuotationToSale`
- `completePurchase`
- `settleReceivable`

This layer is where the old Firebird procedures/triggers are reborn in a web-safe way.

### 3. HTTP / action layer

Responsibilities:

- request parsing
- auth/session lookup
- organization resolution
- input validation
- calling services

Examples:

- route handlers
- server actions

### 4. UI layer

Responsibilities:

- forms
- lists
- filters
- dashboards
- report pages

The UI must not contain hidden business logic.

---

## Recommended Initial Seeds

Since there is no legacy data migration, the app should start with lightweight seed support.

Seed at least:

- one `organization`
- one `app_user`
- one `organization_membership`
- one `company_profile`
- one `business_settings`
- one default `cash_account`
- one default `tax_rate`
- a few `units`
- a few `product_groups`
- optional demo `vendor`

This replaces the value that legacy default configuration procedures once provided.

---

## First Build Slice

The fastest meaningful vertical slice is:

1. organization bootstrap
2. company profile
3. business settings
4. product groups
5. units
6. suppliers
7. products
8. cash accounts
9. quotations
10. sales with stock posting

Why this order:

- products need reference data
- sales are the core value loop
- quotations and sales exercise the most important domain patterns

---

## Backend Service Contract Draft

These are not framework-specific signatures. They are domain-level contracts.

### Catalog

```ts
createCustomer(input)
updateCustomer(id, input)
archiveCustomer(id)
listCustomers(filters)

createSupplier(input)
updateSupplier(id, input)
archiveSupplier(id)
listSuppliers(filters)

createProduct(input)
updateProduct(id, input)
archiveProduct(id)
listProducts(filters)
```

### Quotations

```ts
createQuotation(input)
updateQuotation(id, input)
deleteDraftQuotation(id)
convertQuotationToSale(id)
listQuotations(filters)
```

### Sales

```ts
createSale(input)
updateSale(id, input)
completeSale(id)
reopenSale(id)
cancelSale(id)
receiveSalePayment(id, input)
listSales(filters)
getSaleSummary(id)
```

### Purchases

```ts
createPurchase(input)
updatePurchase(id, input)
completePurchase(id)
reopenPurchase(id)
cancelPurchase(id)
recordPurchasePayment(id, input)
listPurchases(filters)
```

### Finance

```ts
createReceivable(input)
settleReceivable(id, input)
listReceivables(filters)

createPayable(input)
payPayable(id, input)
listPayables(filters)

createCashEntry(input)
listCashEntries(filters)
getCashBalance(filters)
```

### Inventory extras

```ts
activatePromotion(input)
deactivatePromotion(id)
listPromotions(filters)

registerInventoryLoss(input)
updateInventoryLoss(id, input)
deleteInventoryLoss(id)
listInventoryLosses(filters)
```

---

## Route Structure Suggestion

If using route handlers:

```text
/api/bootstrap
/api/customers
/api/customers/[id]
/api/suppliers
/api/suppliers/[id]
/api/products
/api/products/[id]
/api/quotations
/api/quotations/[id]
/api/quotations/[id]/convert-to-sale
/api/sales
/api/sales/[id]
/api/sales/[id]/complete
/api/sales/[id]/reopen
/api/sales/[id]/cancel
/api/sales/[id]/receive
/api/purchases
/api/purchases/[id]
/api/purchases/[id]/complete
/api/purchases/[id]/reopen
/api/purchases/[id]/cancel
/api/purchases/[id]/pay
/api/accounts-receivable
/api/accounts-receivable/[id]/settle
/api/accounts-payable
/api/accounts-payable/[id]/pay
/api/cash-entries
/api/reports/*
```

If using server actions heavily, keep the same service boundaries even if HTTP routes are thinner.

---

## UI Screen Order

This is the most practical build order.

### Phase 1

- app shell
- auth wiring
- organization bootstrap
- company profile page
- business settings page

### Phase 2

- groups CRUD
- units CRUD
- banks CRUD
- cash accounts CRUD
- vendors CRUD
- cities CRUD

### Phase 3

- suppliers CRUD
- customers CRUD
- products CRUD

### Phase 4

- quotations list
- quotation create/edit page
- quotation detail page

### Phase 5

- sales list
- sales create/edit page
- sale detail page
- sale completion flow
- quotation -> sale conversion

### Phase 6

- purchases list
- purchase create/edit page
- purchase detail page
- purchase completion flow

### Phase 7

- receivables list
- receivable settlement flow
- payables list
- payable payment flow
- cash ledger list
- manual cash entry

### Phase 8

- promotions
- losses
- reports
- dashboard summaries

---

## Validation Rules Worth Implementing Early

These should become reusable schemas/helpers early in the codebase.

### Product

- `name` required
- `sale_price >= 0`
- `cost_price >= 0`
- `minimum_stock >= 0`
- `current_stock >= 0` at creation

### Quotation items

- product must exist in same organization
- quantity > 0
- total must be recomputed on server

### Sale completion

- sale must not be canceled
- sale must have at least one item
- if stock validation enabled, every item must have stock

### Purchase completion

- purchase must not be canceled
- purchase must have at least one item

### Receivable/payable settlement

- amount must be positive
- settlement date required
- overpayment blocked unless explicitly supported

---

## Ownership Enforcement Pattern

One of the biggest practical risks is cross-organization data leakage.

Recommended pattern:

- every query in repositories receives `organizationId`
- fetches always filter by `organization_id`
- services never work with naked ids alone

Preferred service style:

```ts
completeSale({
  organizationId,
  saleId,
  actorUserId
})
```

Avoid:

```ts
completeSale(saleId)
```

unless the service itself always resolves organization context internally.

---

## What Can Be Seeded Instead of Migrated

Since the legacy data will not be imported, these can be recreated manually or with simple seeds:

- units
- groups
- banks
- cash accounts
- vendors
- tax rates
- CFOP codes if needed
- settings defaults

This is much cheaper than building a Firebird import path.

---

## Technical Backlog

### Now

- choose stack details
- scaffold web app
- convert SQL draft into actual migration system
- build bootstrap flow
- build seed script

### Soon after

- implement catalog CRUD
- implement quotation and sale flows
- implement stock posting

### After that

- implement purchases
- implement receivables/payables
- implement cash ledger

### Later

- promotions
- losses
- reports
- dashboard
- optional checks support

---

## Recommended Next Concrete Step

The best next practical step is:

1. scaffold the web application structure
2. choose the DB/migration tool
3. import the PostgreSQL draft schema into that tool
4. create the bootstrap seed flow

If implementation is going to start immediately, the next coding task should be:

- create the app shell plus `organization`, `company_profile`, `business_settings`, and `cash_accounts` as the first usable foundation

---

## Handoff

The current state of project planning is now enough to begin actual implementation without reopening the Delphi analysis.

A new session should assume:

- no legacy data import is needed
- no legacy auth import is needed
- PostgreSQL draft schema already exists
- business rules were extracted at a useful level
- the first real coding milestone should be app scaffold + foundational modules

