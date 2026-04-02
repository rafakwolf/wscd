# WSCD Web App

This is the first scaffold for the WSCD web rebuild.

## Current state

Already created:

- Next.js app structure
- root workspace wiring with `pnpm`
- app shell and navigation
- landing page and internal dashboard
- placeholder routes for the first implementation slice
- bootstrap and health API endpoints
- PostgreSQL environment wiring and database health probe
- bootstrap readiness check backed by the real database

Still pending:

- dependency installation
- actual database wiring
- auth integration
- CRUD screens
- transactional services

## Suggested commands

From the repository root:

```bash
pnpm install
pnpm dev
```

Or directly inside this app:

```bash
pnpm install
pnpm dev
```

## First implementation target

Build in this order:

1. organization bootstrap
2. company profile
3. business settings
4. cash accounts
5. groups
6. units
7. suppliers
8. products
9. quotations
10. sales with stock posting

## Database

The app now expects PostgreSQL environment variables.

Local defaults were prepared in the repository root `.env.local` and a safe template exists in `.env.example`.

The health endpoint returns database status at:

```text
/api/health
```

The bootstrap endpoint returns whether the initial database seed is ready at:

```text
/api/bootstrap
```

## Related references

- [../../docs/web-implementation-blueprint.md](/Users/rafakwolf/Developer/p/wscd/docs/web-implementation-blueprint.md)
- [../../docs/postgresql-schema-and-services-spec.md](/Users/rafakwolf/Developer/p/wscd/docs/postgresql-schema-and-services-spec.md)
- [../../Database/postgresql/001_initial_schema.sql](/Users/rafakwolf/Developer/p/wscd/Database/postgresql/001_initial_schema.sql)
