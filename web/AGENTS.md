# Orientações do projeto web

## Stack e estrutura

O app usa ASP.NET Core 10 com Razor Pages, C# e Tailwind CSS. A aplicação está em `Wscd.Web/`; os class libraries `Wscd.Domain`, `Wscd.Services` e `Wscd.Data` compõem as camadas de domínio, negócio e persistência, conforme `../MIGRATION_PLAN.md`.

Mantenha as páginas focadas em apresentação e fluxo HTTP. Todas as regras de negócio, inclusive as que hoje estão em stored procedures ou triggers Firebird, ficam em Services; persistência, EF Core e Npgsql ficam em Data; entidades e conceitos do negócio ficam em Domain. Não implemente regras de negócio em procedures ou triggers PostgreSQL. Razor Pages não deve acessar o banco diretamente.

## Interface

Preserve a organização e os fluxos úteis da interface Delphi. Não faça redesenho amplo sem necessidade para a migração. Use Tailwind; não adicione Bootstrap nem jQuery. JavaScript deve ser vanilla. Edite `Styles/input.css` para mudar a entrada do Tailwind; `wwwroot/css/app.css` é gerado e não deve ser editado manualmente. A interface e mensagens para o usuário devem permanecer em português.

Use apenas os serviços necessários do ASP.NET Core Identity. Não gere nem altere a UI padrão: as telas próprias em português de login, logout e administração de usuários ficam em `Pages/Account/` e `Pages/Admin/Users/`.

## Ambiente, dados e comandos

Execute .NET e Node no Dev Container, nunca exigindo SDK no macOS. PostgreSQL está no servidor `wolf-server.local`; o banco `wscd` já existe. Mantenha credenciais apenas em `.devcontainer/.env`, ignorado pelo Git; não as imprima nem as inclua em arquivos versionados. Consulte `../MIGRATION_PLAN.md` antes de adicionar módulos ou fluxos para confirmar que estão no escopo.

No Dev Container (workspace em `/workspace`):

```sh
dotnet build web/Wscd.sln
dotnet test web/Wscd.sln
dotnet run --project web/Wscd.Web
npm run css:build --prefix web/Wscd.Web
```

Use `npm run css:watch --prefix web/Wscd.Web` durante alterações de CSS. Os projetos de teste usam xUnit v3: coloque testes unitários de Domain/Services em `Wscd.UnitTests` e testes do pipeline HTTP em `Wscd.IntegrationTests`, usando `WebApplicationFactory` sem depender do PostgreSQL de desenvolvimento. O `global.json` seleciona Microsoft Testing Platform para o `dotnet test` do SDK 10.

## Persistência e identidade

`Wscd.Data` contém `WscdDbContext`, Identity e as migrações PostgreSQL. O banco `wscd` fica em `wolf-server.local`; a connection string vem somente de `.devcontainer/.env` (ignorado pelo Git). A ferramenta `dotnet-ef` é fixada em `.config/dotnet-tools.json`. Para criar/aplicar migrações, entre em `web/`, restaure o manifesto e use `dotnet ef ... --project Wscd.Data --startup-project Wscd.Web`. Nunca imprima nem registre valores de conexão.

O esquema inicial de Identity e a conta administrativa de desenvolvimento já existem no banco atual. Não adicione bootstrap de administrador ao início da aplicação. O autoatendimento cria organização e primeiro administrador atomicamente; a conta existente sem organização conclui uma configuração única informando o nome da organização. Somente o fundador pode adicionar membros ou remover seu acesso. Remoção desativa a conta para preservar referências e histórico. Toda entidade de negócio deve implementar `IOrganizationScoped` para receber o filtro global do `WscdDbContext`; consultas de usuários devem filtrar explicitamente por `OrganizationId` e nunca confiar em um ID de organização recebido do formulário. A produção está prevista para uma VPS gerenciada, com a aplicação em Docker. Não crie autenticação ou telas padrão adicionais sem necessidade do escopo.
