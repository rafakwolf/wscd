# Repository Guidelines

## Project Structure

WSCD is a legacy Delphi VCL ERP being migrated to a browser-based ASP.NET Core app. The Delphi entry point and project remain `WSCD.dpr` and `WSCD.dproj`; its business areas are in `Cadastros/`, `Movimentos/`, `Configuracoes/`, and `Utilitarios/`, with shared code in `Comuns/`, `Padrao/`, and `Util/`. Firebird scripts and database files are in `Database/`. The new web app lives in `web/Wscd.Web/`; keep it separate from the Delphi source during the incremental migration.

## Build and Development

Open the repository in its Dev Container to use .NET 10 and Node without installing them on macOS. PostgreSQL runs on the network server `wolf-server.local`; credentials are intentionally not stored in the repository. The container forwards the web app on port 5080. In separate container terminals, run:

```sh
npm run css:watch --prefix web/Wscd.Web
dotnet run --project web/Wscd.Web
```

Build the Tailwind asset with `npm run css:build --prefix web/Wscd.Web`. Keep local PostgreSQL credentials in the ignored `.devcontainer/.env`; do not put secrets in Compose or commit them. The app connection string currently names the server and planned database, but the data layer is not wired yet. The Delphi project still requires RAD Studio/MSBuild on Windows; it cannot be built in this container. No automated test suite is present yet; build and manually check the affected web workflow.

## Coding Style

For Delphi changes, follow surrounding Object Pascal style and keep paired `.pas` and `.dfm` forms consistent. For the new app, use standard C# and Razor Pages conventions, and keep features in `web/Wscd.Web/`.

## Data and Configuration

Use `Database/` scripts and `Database/Conexao.ini` as project-specific context, but do not commit local credentials, machine-specific paths, or modified database snapshots. Treat backup, restore, and data-cleanup changes carefully; verify the target database before running destructive SQL.

## Change Reviews

Recent Git history uses short, lowercase summaries; write a concise message describing the change. For review, explain the affected workflow and include build results; add screenshots for visible UI changes. Do not create commits or open pull requests; those are handled manually.
