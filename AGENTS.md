# Repository Guidelines

## Project Structure

WSCD is a legacy Delphi VCL ERP being migrated to a browser-based ASP.NET Core app. The Delphi entry point and project remain `WSCD.dpr` and `WSCD.dproj`; its business areas are in `Cadastros/`, `Movimentos/`, `Configuracoes/`, and `Utilitarios/`, with shared code in `Comuns/`, `Padrao/`, and `Util/`. Firebird scripts and database files are in `Database/`. The new app is in `web/`: `Wscd.Web` (Razor Pages), `Wscd.Domain`, `Wscd.Services`, `Wscd.Data` (EF Core/Npgsql), plus unit and integration test projects. Keep it separate from the Delphi source during migration.

## Build and Development

Open the repository in its Dev Container to use .NET 10 and Node without installing them on macOS. PostgreSQL database `wscd` runs on `wolf-server.local`; credentials are read from ignored `.devcontainer/.env` and must never be printed or committed. The container forwards the web app on port 5080. In container terminals, run:

```sh
npm run css:watch --prefix web/Wscd.Web
dotnet run --project web/Wscd.Web
```

Build Tailwind with `npm run css:build --prefix web/Wscd.Web`. Run tests with `dotnet test web/Wscd.sln`; unit and integration tests live in separate projects. EF migrations use the pinned local tool: from `web/`, run `dotnet tool restore --tool-manifest .config/dotnet-tools.json`, then `dotnet ef migrations add <Name> --project Wscd.Data --startup-project Wscd.Web --output-dir Migrations` or `dotnet ef database update --project Wscd.Data --startup-project Wscd.Web`. The Identity schema and initial development admin are already configured in the current database; do not add a startup-time admin bootstrap. Public self-service must create an organization with its first user; that administrator is the only member allowed to add or remove other users. The production target is a managed VPS running the app as a Docker container. The Delphi project still requires RAD Studio/MSBuild on Windows.

## Coding Style

For Delphi changes, follow surrounding Object Pascal style and keep paired `.pas` and `.dfm` forms consistent. For the new app, use C# and Razor Pages conventions; keep UI in `web/Wscd.Web/`, domain entities in `web/Wscd.Domain/`, business rules in `web/Wscd.Services/`, and persistence in `web/Wscd.Data/`. Move all legacy stored-procedure and trigger business rules into Services; do not add business rules to PostgreSQL procedures or triggers.

## Data and Configuration

Use `Database/` scripts and `Database/Conexao.ini` as project-specific context, but do not commit local credentials, machine-specific paths, or modified database snapshots. Treat backup, restore, and data-cleanup changes carefully; verify the target database before running destructive SQL.

## Change Reviews

Recent Git history uses short, lowercase summaries; write a concise message describing the change. For review, explain the affected workflow and include build results; add screenshots for visible UI changes. Do not create commits or open pull requests; those are handled manually.
