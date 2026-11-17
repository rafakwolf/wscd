# WSCD Web

Aplicação web do WSCD, construída com ASP.NET Core 10, Razor Pages, EF Core, PostgreSQL e Tailwind CSS. A solução mantém a aplicação, as regras de negócio, o domínio e a persistência em projetos separados.

## Projetos

- `Wscd.Web`: páginas Razor, autenticação e composição da aplicação.
- `Wscd.Services`: casos de uso e regras de negócio.
- `Wscd.Domain`: entidades e conceitos do negócio.
- `Wscd.Data`: EF Core, PostgreSQL, Identity e migrations.
- `Wscd.UnitTests`: testes unitários de domínio e serviços.
- `Wscd.IntegrationTests`: testes HTTP com `WebApplicationFactory`.

## Ambiente de desenvolvimento

Abra o repositório no Dev Container. Ele fornece .NET 10 e Node.js e encaminha a aplicação pela porta `5080`. O PostgreSQL de desenvolvimento fica em `wolf-server.local`; configure a connection string `ConnectionStrings__DefaultConnection` em `.devcontainer/.env`, que não deve ser versionado nem ter seus valores registrados neste README.

Ao criar o container, o comando de configuração restaura a solução, restaura a ferramenta EF Core local, instala as dependências do Tailwind e gera o CSS.

No terminal do container, a partir da raiz do repositório, inicie a aplicação:

```sh
dotnet run --project web/Wscd.Web
```

Para recompilar o CSS automaticamente durante alterações de estilo, use outro terminal:

```sh
npm run css:watch --prefix web/Wscd.Web
```

O CSS pode ser gerado uma vez com:

```sh
npm run css:build --prefix web/Wscd.Web
```

## Dados de demonstração

No ambiente Development, entre no app e acesse **Dados fictícios para testes** na página inicial. A carga garante 10 registros em cada cadastro e cria 10 compras (5 rascunhos e 5 concluídas), 10 perdas e 10 promoções na organização da sessão. Compras concluídas geram contas a pagar. A carga pode ser repetida sem duplicar os registros de demonstração; ela não roda ao iniciar o app, não apaga dados e não cria usuários. Vendas ainda não estão implementadas.

## Banco de dados e migrations

Os comandos abaixo usam a connection string configurada no ambiente. Execute-os dentro do Dev Container e confira que ela aponta para o banco desejado antes de aplicar alterações.

Na primeira utilização da ferramenta, restaure o manifesto local e atualize o banco:

```sh
cd /workspace/web
dotnet tool restore --tool-manifest .config/dotnet-tools.json
dotnet ef database update --project Wscd.Data --startup-project Wscd.Web
```

Para criar uma migration depois de alterar o modelo, a partir de `web/`:

```sh
dotnet ef migrations add NomeDaMigration --project Wscd.Data --startup-project Wscd.Web --output-dir Migrations
```

Em seguida, aplique-a com `dotnet ef database update --project Wscd.Data --startup-project Wscd.Web`.

## Build e testes

Execute a partir da raiz do repositório, no Dev Container:

```sh
dotnet build web/Wscd.sln
dotnet test web/Wscd.sln
```

Os testes de integração não dependem do PostgreSQL de desenvolvimento.
