# Repository Guidelines

## Project Structure

The current WSCD app is in `web/`: `Wscd.Web` (Razor Pages), `Wscd.Domain`, `Wscd.Services`, `Wscd.Data` (EF Core/Npgsql), and unit/integration test projects. The previous Pascal/Lazarus ERP, its business areas, Firebird scripts, project files, editor settings, and Delphi inventory are preserved under `_legacy/`. Migration decisions and current progress are in `MIGRATION_PLAN.md`.

## Build and Development

Open the repository in its Dev Container to use .NET 10 and Node without installing them on macOS. PostgreSQL database `wscd` runs on `wolf-server.local`; credentials come from ignored `.devcontainer/.env` and must never be printed or committed. The container forwards the app on port 5080. From the repository root in the container, run:

```sh
npm run css:watch --prefix web/Wscd.Web
dotnet run --project web/Wscd.Web
```

Build Tailwind with `npm run css:build --prefix web/Wscd.Web`. Run tests with `dotnet test web/Wscd.sln`; unit and integration tests live in separate projects. EF migrations use the pinned local tool: from `web/`, run `dotnet tool restore --tool-manifest .config/dotnet-tools.json`, then `dotnet ef migrations add <Name> --project Wscd.Data --startup-project Wscd.Web --output-dir Migrations` or `dotnet ef database update --project Wscd.Data --startup-project Wscd.Web`. The Identity schema and initial development admin are already configured in the current database; do not add a startup-time admin bootstrap. Public self-service must create an organization with its first user; that administrator is the only member allowed to add or remove other users. The production target is a managed VPS running the app as a Docker container.

## Coding Style

For the web app, use C# and Razor Pages conventions; keep UI in `web/Wscd.Web/`, domain entities in `web/Wscd.Domain/`, business rules in `web/Wscd.Services/`, and persistence in `web/Wscd.Data/`. Keep business rules out of PostgreSQL procedures and triggers. Make changes to `_legacy/` only when legacy source work is requested; follow the surrounding Pascal conventions and keep paired form/resource files together.

## Data and Configuration

Legacy Firebird scripts and snapshots are under `_legacy/Database/`; use them only as project context. Do not commit local credentials, machine-specific paths, or modified database snapshots. Treat backup, restore, and data-cleanup changes carefully; verify the target database before running destructive SQL. PostgreSQL connection details remain in ignored `.devcontainer/.env`.

## Change Reviews

Recent Git history uses short, lowercase summaries. For review, explain the affected workflow and include build results; add screenshots for visible UI changes. Do not create commits or open pull requests; those are handled manually.
