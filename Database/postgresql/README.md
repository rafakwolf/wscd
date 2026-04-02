# PostgreSQL Draft Migrations

These files are the first executable draft of the target PostgreSQL model for the WSCD web migration.

## Files

- `001_initial_schema.sql`
  - base schema
  - enums
  - tables
  - indexes
  - `updated_at` trigger function
- `002_reporting_views.sql`
  - reporting and summary views used by the future web ERP

## Intended order

Apply in this order:

1. `001_initial_schema.sql`
2. `002_reporting_views.sql`
3. `003_seed_bootstrap.sql`

## Applying from the repository root

With `DATABASE_URL` available in the environment:

```bash
pnpm db:apply
```

To apply a specific subset:

```bash
pnpm db:apply Database/postgresql/001_initial_schema.sql
```

The root command delegates to the web workspace script so it can reuse the installed
`postgres` client dependency without duplicating packages at the monorepo root.

## Notes

- This is a draft migration set derived from:
  - [../../docs/web-migration-plan.md](/Users/rafakwolf/Developer/p/wscd/docs/web-migration-plan.md)
  - [../../docs/postgresql-schema-and-services-spec.md](/Users/rafakwolf/Developer/p/wscd/docs/postgresql-schema-and-services-spec.md)
- Same-organization ownership is still expected to be enforced in the service layer.
- Some modules remain intentionally optional for MVP, especially:
  - checks
  - deeper fiscal features
  - advanced audit extensions
- Before production use, the next step should be validating these SQL files against a real PostgreSQL instance and adjusting any naming/type decisions the implementation stack requires.
