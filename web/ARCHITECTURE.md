# Arquitetura do WSCD Web

Este diagrama segue o [plano de migração](../MIGRATION_PLAN.md). Autenticação, organizações e isolamento da gestão de membros estão implementados; os módulos de negócio ainda serão migrados. Linhas contínuas mostram o fluxo em execução; pontilhadas mostram referências entre projetos. Toda regra de negócio, inclusive a hoje existente em stored procedures ou triggers Firebird, será implementada em `Wscd.Services`, não no PostgreSQL.

## Aplicação e projetos

```mermaid
flowchart LR
    User[Usuário]
    Browser[Navegador<br/>Tailwind CSS<br/>JavaScript vanilla]
    Web[Wscd.Web<br/>ASP.NET Core 10<br/>Razor Pages e Identity]
    Services[Wscd.Services<br/>Casos de uso e regras]
    Domain[Wscd.Domain<br/>Modelos de negócio]
    Data[Wscd.Data<br/>EF Core, Npgsql<br/>Identity store]
    PostgreSQL[(PostgreSQL<br/>Desenvolvimento: wolf-server.local)]

    User --> Browser
    Browser -->|HTTP| Web
    Web -->|operações do ERP| Services
    Services --> Domain
    Web -->|composição e Identity| Data
    Data -->|consultas e gravações| PostgreSQL

    Data -. referência de projeto .-> Services
    Data -. referência de projeto .-> Domain
    Services -. referência de projeto .-> Domain

    UnitTests[Wscd.UnitTests<br/>Domain e Services] -.-> Domain
    UnitTests -.-> Services
    IntegrationTests[Wscd.IntegrationTests<br/>WebApplicationFactory] -.-> Web
```

O Dev Container fornece .NET e Node no desenvolvimento; o PostgreSQL fica fora do container. A aplicação deverá ser publicada como container Docker em uma VPS gerenciada. Credenciais são locais e não fazem parte deste documento. Os testes de integração não dependem do banco de desenvolvimento.

## Organizações e módulos

```mermaid
flowchart LR
    ExistingAdmin[Conta administradora atual<br/>sem organização até configurar]
    InitialOrg[Organização inicial]
    ExistingSetup[Configuração única<br/>nome da organização]
    Onboarding[Autoatendimento público<br/>organização + primeiro usuário]
    NewOrg[Organização]
    FirstAdmin[Primeiro usuário<br/>administrador da organização]
    MemberManagement[Adicionar ou remover membros]
    OtherMember[Demais membros da organização]
    Boundary[Contexto da organização<br/>+ autorização por organização]

    ExistingAdmin --> ExistingSetup
    ExistingSetup -->|associa como fundador| InitialOrg
    Onboarding -->|cria junto, atomicamente| NewOrg
    Onboarding -->|cria junto, atomicamente| FirstAdmin
    FirstAdmin --> NewOrg
    MemberManagement --> OtherMember
    FirstAdmin --> Boundary
    OtherMember --> Boundary
    FirstAdmin --> MemberManagement
    OtherMember -. sem permissão .-> MemberManagement

    Boundary --> Cadastros[Cadastros]
    Boundary --> Compras[Compras e estoque]
    Boundary --> Vendas[Vendas e financeiro]
    Boundary --> Relatorios[Relatórios]
```

O autoatendimento cria a organização junto com seu primeiro administrador em uma transação. A conta administrativa inicial já concluiu a configuração da organização. Somente o fundador pode adicionar membros ou remover seu acesso; remoção desativa a conta para manter referências históricas. A gestão de usuários filtra pelo vínculo da organização. Toda entidade de negócio deve implementar `IOrganizationScoped`, que recebe filtro global pelo contexto da organização autenticada. O banco contém as migrations `AddOrganizations` e `AddCatalogs`.

## Módulos e relações de negócio planejadas

```mermaid
flowchart LR
    Org[Organização ativa<br/>limite de acesso aos dados]
    Config[Configuração<br/>dados da empresa, bancos<br/>e contas caixa]
    Records[Cadastros<br/>produtos, grupos, unidades<br/>clientes, fornecedores, vendedores]
    Purchases[Compras<br/>listagem, status e filtros<br/>rascunhos e conclusão]
    Inventory[Estoque<br/>entradas, saídas, mínimos,<br/>perdas e promoções]
    Sales[Vendas<br/>orçamentos e venda de balcão]
    Finance[Financeiro<br/>caixa, contas a pagar/receber,<br/>pagamentos e recebimentos]
    Reports[Relatórios<br/>consulta dos dados operacionais]

    Org --> Config
    Org --> Records
    Org --> Purchases
    Org --> Inventory
    Org --> Sales
    Org --> Finance
    Org --> Reports

    Records -->|fornecedor, produto e unidade| Purchases
    Records -->|produto, grupo e unidade| Inventory
    Records -->|produto, cliente e vendedor| Sales
    Config -->|contas disponíveis| Finance

    Purchases -->|ao concluir: entrada de mercadorias| Inventory
    Purchases -->|ao concluir: fluxo de pagamento| Finance
    Sales -->|concluir venda: baixa de estoque| Inventory
    Sales -->|pagamentos e saldo a prazo| Finance
    Sales -->|cancelar/devolver: estornar movimentos| Inventory
    Sales -->|cancelar/devolver: estornar movimentos| Finance

    Config -. consulta .-> Reports
    Records -. consulta .-> Reports
    Purchases -. consulta .-> Reports
    Inventory -. consulta .-> Reports
    Sales -. consulta .-> Reports
    Finance -. consulta .-> Reports
```

As setas representam o fluxo alvo. Orçamentos e rascunhos de compra não movimentam estoque nem financeiro; a compra movimenta os dois ao ser concluída. Concluir uma venda de balcão baixa o estoque e lança pagamentos e eventual saldo a prazo de forma atômica. Cancelar ou devolver estorna os movimentos correspondentes, repõe apenas mercadorias efetivamente devolvidas e preserva o histórico. A branch `delphi` contém as telas e procedures antigas; elas servem para inventário, não para copiar regras de negócio ao banco novo. O relatório de comissão por vendedor permanece no escopo. Relatórios consultam os módulos e não são fonte de alteração operacional.

Os oito cadastros da Fase 5 já têm modelos, serviços, persistência e páginas Razor. O produto tem FKs compostas com `IDOrganization`, `IDSupplier`, `IDProductGroup` e `IDUnit`, impedindo referências cruzadas entre organizações. A tela de cliente e fornecedor ainda usa cidade como texto; a referência fixa de cidades e a regra de idade mínima dependente da configuração global permanecem pendentes nesta fase.
