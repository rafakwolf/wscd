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

No ambiente Development, entre em uma organização de testes e acesse **Dados fictícios para testes** na página inicial. A carga garante 10 registros em cada cadastro, 10 compras, 10 orçamentos e 10 vendas (5 rascunhos e 5 concluídos de cada), 10 perdas e 10 promoções. Compras concluídas geram contas a pagar; vendas concluídas baixam estoque e lançam recebimentos fictícios nas contas caixa de demonstração. A carga pode ser repetida, não roda ao iniciar o app e não apaga dados nem cria usuários.

Em **Vendas**, registre dinheiro, Pix, débito ou crédito à vista para cada valor pago. Para deixar um saldo no crediário, informe o vencimento; para deixar a venda toda a prazo, desmarque **Registrar valor recebido agora**. A venda concluída gera uma conta a receber pelo saldo, sem lançar esse valor no Caixa antes da baixa.

Em **Contas a receber**, filtre por cliente, vencimento ou situação e abra o título para registrar um recebimento parcial ou integral em uma conta caixa ativa. O crediário usa um vencimento por venda, sem juros ou bloqueio automático de limite de crédito. O ERP não processa pagamentos nem concilia repasses, taxas ou depósitos.

Em **Caixa**, consulte os recebimentos por conta e período. Cada recebimento aparece com seu meio, mesmo quando vários pertencem à mesma venda. O filtro usa o dia do recebimento no horário de Brasília, independentemente da data da venda. O total é o das entradas encontradas, não o saldo da conta, e pode ser impresso ou salvo em PDF pelo navegador.

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

Atualize o banco até `AddAccountsReceivable` antes de usar **Vendas**, **Caixa**, **Contas a receber** ou a carga de demonstração. Os recebimentos já registrados mantêm seus valores, meios e datas. Voltar ao esquema anterior é bloqueado quando já existem títulos de crediário, pois ele não preserva o histórico dessas contas.

## Build e testes

Execute a partir da raiz do repositório, no Dev Container:

```sh
dotnet build web/Wscd.sln
dotnet test web/Wscd.sln
```

Os testes de integração não dependem do PostgreSQL de desenvolvimento.
