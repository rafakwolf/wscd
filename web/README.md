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

Em **Vendas → Vendas por período**, consulte vendas concluídas e não canceladas pela data da venda, com filtros opcionais de cliente e vendedor. O relatório separa os descontos originais, o total após descontos e as devoluções, mesmo feitas depois do período. A venda totalmente devolvida continua listada com valor líquido zero. Use **Imprimir / Salvar PDF** para levar a consulta; os totais não representam recebimentos no Caixa.

No rascunho, salve o percentual de **Comissão (%)** em cada item aplicável. Depois da conclusão, consulte **Comissão por vendedor** em Vendas: filtre pelo vendedor e pela data da venda, confira o total líquido e imprima ou salve como PDF. Cancelamentos são excluídos e devoluções reduzem a base mesmo quando registradas depois do período selecionado. O relatório não lança o pagamento da comissão.

Para desfazer uma venda concluída, abra **Consultar** e selecione **Cancelar venda**. Confira os recebimentos, receba os produtos de volta e devolva os valores aplicáveis fora do ERP antes de confirmar com o motivo. O cancelamento recompõe o estoque, encerra o crediário e lança a contrapartida dos recebimentos não estornados. A venda continua disponível para consulta, como **Cancelada**.

Para devolver itens sem apagar a venda, abra **Consultar → Registrar devolução**. Informe as quantidades, o motivo e quais itens podem voltar ao estoque. Na conferência, o ERP mostra o abatimento do saldo do crediário e, se sobrar valor, quanto devolver ao cliente. Efetue o reembolso fora do ERP e informe o meio e a conta caixa usados (uma conta por devolução). Depois da primeira devolução, use esse mesmo fluxo para os itens restantes em vez de cancelar a venda.

Em **Contas a receber** e **Contas a pagar**, use **Nova conta** para registrar um título manual, sem venda ou compra vinculada. Informe cliente ou fornecedor, descrição, emissão, vencimento e valor; o documento é opcional. Títulos manuais e automáticos ficam na mesma listagem. No detalhe, registre uma baixa parcial ou integral em uma conta caixa ativa. O título só movimenta o Caixa quando baixado.

Nos dois módulos, **Posição de contas** lista os títulos em aberto e separa os saldos vencidos, os que vencem hoje e os que ainda vão vencer. Filtre por cliente ou fornecedor, intervalo de vencimentos ou somente vencidas, e use **Imprimir / Salvar PDF**. A consulta usa o saldo de hoje, já descontadas as baixas e os abatimentos; não é uma posição histórica.

Abra **Relatório de baixas** para conferir pagamentos ou recebimentos de títulos por período, cliente ou fornecedor e conta caixa. O líquido é o total de baixas menos os estornos do período. Cada estorno aparece em sua própria data, inclusive quando decorre do cancelamento de uma venda no crediário. Recebimentos de balcão e reembolsos por devolução de itens não entram nessa consulta; consulte o **Caixa** para esses movimentos.

Para corrigir uma baixa, abra o título e selecione **Estornar** no histórico. Informe o motivo e confirme. O estorno recompõe o saldo pelo valor integral daquela baixa, preserva o lançamento original e aparece no Caixa na data em que foi registrado. Isso não cancela vendas ou compras e não movimenta dinheiro fora do ERP.

Em **Caixa**, consulte entradas e saídas por conta e período, no horário de Brasília. A diferença entre entradas e saídas não é saldo da conta. A consulta pode ser impressa ou salva em PDF pelo navegador. O ERP não processa os pagamentos nem concilia repasses, taxas ou depósitos.

Na tela inicial, abra **Posição de estoque** para conferir a quantidade atual, o mínimo e a unidade de cada produto. Filtre por nome ou código de barras, grupo, fornecedor ou situação. **No mínimo ou abaixo** também inclui os produtos sem estoque que atendam ao limite cadastrado. A consulta pode ser impressa ou salva em PDF e não reconstitui quantidades históricas.

Na tela inicial, abra **Lista de preços** para consultar o preço de venda cadastrado de cada produto. Ordene por descrição ou preço de venda e use **Imprimir / Salvar PDF**.

Abra **Produtos por grupo** e selecione um grupo para consultar código de barras, produto, fornecedor, custo, margem, preço de venda cadastrado e estoque atual. O relatório inclui produtos sem estoque e pode ser impresso ou salvo em PDF.

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

Atualize o banco até `AddSaleItemCommission`. Itens de vendas existentes ficam com comissão de 0%, sem cálculo retroativo do percentual. As migrações bloqueiam a volta a um esquema que não preserve o histórico já registrado.

## Build e testes

Execute a partir da raiz do repositório, no Dev Container:

```sh
dotnet build web/Wscd.sln
dotnet test web/Wscd.sln
```

Os testes de integração não dependem do PostgreSQL de desenvolvimento.

O [GitHub Actions](../.github/workflows/unit-tests.yml) roda apenas os testes unitários a cada push e pull request, sem PostgreSQL ou segredos.
