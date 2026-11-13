# Plano de Migração do WSCD

## Objetivo e princípios

Criar um ERP web simples para pequenos comércios, desenvolvido no Mac e usado pelo navegador. A interface deve conservar a organização, os campos e os fluxos atuais quando forem úteis. A migração será gradual: reconstruir cada módulo na aplicação nova, corrigir regras que não funcionam e adiar melhorias visuais amplas.

O sistema não está em produção. O PostgreSQL começa vazio: não haverá importação de cadastros, movimentos, usuários ou senhas do Firebird. Os arquivos e scripts Delphi servem apenas para entender os comportamentos atuais; não são uma fonte de dados a carregar.

## Stack e decisões confirmadas

- **Aplicação**: ASP.NET Core 10 LTS com Razor Pages, em um monólito modular. A documentação recomenda Razor Pages para aplicações centradas em páginas e formulários; .NET 10 está em suporte LTS ([Razor Pages](https://learn.microsoft.com/en-us/aspnet/core/razor-pages/?view=aspnetcore-10.0), [suporte do .NET](https://dotnet.microsoft.com/en-us/platform/support/policy)).
- **Ambiente**: .NET e Node usado pelo Tailwind ficam no Dev Container; PostgreSQL roda no servidor de rede `wolf-server.local`. O SDK não será instalado no macOS. Usuário e senha não ficam registrados no repositório.
- **Interface**: Tailwind CSS via CLI e JavaScript vanilla. Remover Bootstrap, jQuery e seus arquivos do template. Manter formulários e fluxo conhecidos; não iniciar um redesenho geral ([Tailwind CLI](https://tailwindcss.com/docs/installation/tailwind-cli)).
- **Dados**: criar o esquema PostgreSQL do zero com EF Core/Npgsql. Reimplementar as regras úteis em operações do servidor e transações do banco; não traduzir procedures e triggers Firebird mecanicamente.
- **Arquitetura**: organizar a solução em quatro projetos: `Wscd.Domain` para entidades e conceitos do negócio, `Wscd.Services` para casos de uso e regras, `Wscd.Data` para EF Core/Npgsql e persistência, e `Wscd.Web` para Razor Pages. `Domain` não depende das outras camadas; `Services` depende de `Domain`; `Data` implementa os contratos de persistência usados por `Services`; `Web` compõe e registra as camadas via injeção de dependência.
- **Autenticação**: usar os serviços essenciais do ASP.NET Core Identity para hashes de senha, autenticação por cookie e autorização, sem gerar ou ejetar a UI padrão. Criar apenas as telas necessárias em português ([Identity no ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/identity?view=aspnetcore-10.0)). Criar a conta administrativa inicial de forma segura; não migrar usuários ou senhas antigos.

## Módulos que o ERP terá

| Área | Módulos incluídos |
| --- | --- |
| Cadastros | Produtos, grupos, unidades, clientes, fornecedores e vendedores. Cidades ficam como consulta fixa de referência para endereços, sem cadastro editável. |
| Configuração e acesso | Dados da empresa, configurações operacionais necessárias, bancos, contas caixa, usuários, perfis e permissões. Remover opções fiscais, de cheque, etiquetas e as configurações sem uso nos fluxos mantidos. |
| Compras e estoque | Compra simples de mercadorias com rascunho, consulta de compras não concluídas, conclusão da compra, entrada de itens no estoque, controle de estoque mínimo, perdas e promoções. Não haverá lançamento fiscal de nota de fornecedor nem cálculo de tributos. |
| Vendas | Orçamentos e vendas. Manter os fluxos existentes de itens e preços, retirando cheque como forma de recebimento. |
| Financeiro | Caixa, contas a pagar e a receber, pagamentos, recebimentos e seus relatórios. Manter apenas formas de pagamento ainda usadas, sem cheque. |
| Relatórios | Consultas e relatórios associados aos módulos acima: vendas, compras, estoque, preços, caixa, contas, clientes, fornecedores e vendedores. Etiquetas e documentos avulsos ficam fora. |

## Fora do escopo

- **Fiscal**: cadastro de alíquotas de ICMS, CFOP, configuração de notas e entrada fiscal de fornecedor. A antiga tela de compras será substituída por compra simples.
- **Cheques**: controle de cheques e qualquer opção de cheque em vendas, pagamentos, recebimentos ou configurações.
- **Utilitários, documentos e fluxos descontinuados**: agenda, busca de telefones, documentos avulsos, auditoria, envelopes, duplicatas e configuração, promissórias, calendário, etiquetas, visualizador de dados, reparação de índices, backup e restauração, tela separada de troca de senha, vendas não concluídas, calculadora, editor de texto, dica do dia, Post-it/e-mail, ajuda, informações do sistema, renovação de chave e atualização automática.
- **Dados legados**: nenhuma carga do Firebird e nenhuma migração de credenciais. A aplicação começa com banco e usuários novos.

A exclusão das telas de backup e restauração não elimina a necessidade operacional de backups do PostgreSQL antes de produção; isso será configurado fora da interface do ERP. A tela separada de troca de senha também não impede o administrador de redefinir o acesso de um usuário quando necessário.

## Fases

| Fase | Entrega | Critério de conclusão |
| --- | --- | --- |
| 0. Fechar o escopo | Inventariar formulários, consultas, relatórios e regras dos módulos incluídos; registrar as decisões de exclusão e retirar as unidades removidas do inventário da nova aplicação. | Cada item legado está marcado como migrar, reduzir ou excluir; não há módulo ausente sendo recriado por suposição. |
| 1. Preparar o Dev Container — concluída | Adicionar Node ao ambiente; configurar a conexão ao PostgreSQL em `wolf-server.local`; remover os arquivos Bootstrap/jQuery do app; configurar Tailwind CLI e a execução ASP.NET no container. | Build e execução local funcionam no Dev Container, sem instalar SDK ou banco no Mac; credenciais são fornecidas localmente. |
| 2. Separar a arquitetura e preparar testes — concluída | Criar `web/Wscd.sln`, os class libraries `Wscd.Domain`, `Wscd.Services`, `Wscd.Data` e projetos separados `Wscd.UnitTests` e `Wscd.IntegrationTests`. Manter entidades no domínio, regras/casos de uso em Services, persistência em Data, e a apresentação em Web. | A solução compila e os testes passam; regras ficam fora de Razor Pages e o teste HTTP não depende do banco real. |
| 3. Base do app e acesso | Aplicar as primeiras migrações EF Core ao PostgreSQL vazio; criar login em português, usuários, perfis e permissões mínimas. Preparar apenas dados fixos de referência, como cidades e unidades iniciais necessárias. | Um administrador novo entra, cria usuários e acessa somente operações autorizadas. |
| 4. Cadastros | Implementar produtos, grupos, unidades, clientes, fornecedores, vendedores, bancos e contas caixa, mantendo os campos úteis e relações existentes. | Cadastros podem ser criados, consultados, editados e usados pelos módulos seguintes. |
| 5. Compra e estoque | Implementar rascunho de compra simples, lista de compras não concluídas e ação de concluir; incluir atualização de estoque, estoque mínimo, perdas e promoções. | Rascunhos podem ser retomados; concluir aplica a entrada de estoque e inicia o fluxo financeiro sem cheque; relatórios refletem as operações. |
| 6. Venda e financeiro | Implementar orçamentos, vendas, pagamentos, recebimentos, caixa e contas a pagar/receber. Cada operação relacionada deve gravar ou reverter seus itens e efeitos financeiros juntos. | Fluxos conferidos com dados novos de demonstração; saldos e consultas correspondem aos movimentos realizados. |
| 7. Relatórios e transição | Completar relatórios dos módulos incluídos, validar impressão no navegador e retirar do menu as funções fora do escopo. | O comerciante consegue conferir operações e totais antes de iniciar uso real. |

## Decisões adiadas

- `unCompNConc` será adaptada para listar rascunhos de compra simples; `unVendaNaoConc` está fora do escopo.
- Definir o destino de produção antes da implantação. A Microsoft documenta macOS para desenvolvimento e serviços locais, mas recomenda Windows ou Linux para carga de produção ([Kestrel e plataformas](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel?view=aspnetcore-10.0)).
