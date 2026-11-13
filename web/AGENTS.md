# Orientações do projeto web

## Stack e estrutura

O app usa ASP.NET Core 10 com Razor Pages, C# e Tailwind CSS. A aplicação está em `Wscd.Web/`; os class libraries `Wscd.Domain`, `Wscd.Services` e `Wscd.Data` compõem as camadas de domínio, negócio e persistência, conforme `../MIGRATION_PLAN.md`.

Mantenha as páginas focadas em apresentação e fluxo HTTP. Regras de negócio ficam em Services; persistência, EF Core e Npgsql ficam em Data; entidades e conceitos do negócio ficam em Domain. Razor Pages não deve acessar o banco diretamente.

## Interface

Preserve a organização e os fluxos úteis da interface Delphi. Não faça redesenho amplo sem necessidade para a migração. Use Tailwind; não adicione Bootstrap nem jQuery. JavaScript deve ser vanilla. Edite `Styles/input.css` para mudar a entrada do Tailwind; `wwwroot/css/app.css` é gerado e não deve ser editado manualmente. A interface e mensagens para o usuário devem permanecer em português.

Use apenas a parte necessária do ASP.NET Core Identity. Não gere nem altere a UI padrão do Identity; implemente telas próprias em português quando o fluxo de autenticação entrar no escopo.

## Ambiente, dados e comandos

Execute .NET e Node no Dev Container, nunca exigindo SDK no macOS. PostgreSQL está no servidor `wolf-server.local`; o banco `wscd` ainda precisa ser criado. Mantenha credenciais apenas em `.devcontainer/.env`, ignorado pelo Git; não as imprima nem as inclua em arquivos versionados. Consulte `../MIGRATION_PLAN.md` antes de adicionar módulos ou fluxos para confirmar que estão no escopo.

No Dev Container:

```sh
dotnet build web/Wscd.sln
dotnet test web/Wscd.sln
dotnet run --project web/Wscd.Web
npm run css:build --prefix web/Wscd.Web
```

Use `npm run css:watch --prefix web/Wscd.Web` durante alterações de CSS. Os projetos de teste usam xUnit v3: coloque testes unitários de Domain/Services em `Wscd.UnitTests` e testes do pipeline HTTP em `Wscd.IntegrationTests`, usando `WebApplicationFactory` sem depender do PostgreSQL de desenvolvimento. O `global.json` seleciona Microsoft Testing Platform para o `dotnet test` do SDK 10.
