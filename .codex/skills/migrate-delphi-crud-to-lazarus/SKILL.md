---
name: migrate-delphi-crud-to-lazarus
description: Migrar modulos CRUD Delphi para Lazarus/Free Pascal separando persistencia, regras de negocio e endpoints REST. Use quando o usuario pedir para migrar um modulo Delphi existente a partir de arquivos .pas e .dfm, criar units repository/service/controller com mORMot2 em pasta normalizada do modulo, preservar fontes legados em old, ou adicionar testes de integracao FPCUnit para controllers REST migrados.
---

# Migrate Delphi CRUD To Lazarus

## Fluxo

1. Localizar o par `.pas` e `.dfm` do modulo solicitado.
2. Ler os dois arquivos antes de editar qualquer coisa. Extrair tabelas, campos, datasets, SQL, componentes de tela, eventos, validacoes, estados, mensagens e operacoes CRUD.
3. Normalizar o nome do modulo antes de criar arquivos. Remover prefixos tecnicos comuns como `un`, `u`, `frm`, `dm`, `udm` e similares quando forem apenas convencao de arquivo/classe. Exemplo: `unAgenda` vira `Agenda`.
4. Classificar cada comportamento:
   - Persistencia e consultas: mover para `[modulo].repository.pas`.
   - Validacoes, calculos, transicoes de estado e regras de negocio: mover para `[modulo].service.pas`.
   - Rotas, serializacao HTTP, codigos de status e contratos REST: mover para `[modulo].controller.pas`.
   - Comportamento puramente visual ou de navegacao de tela: descartar ou registrar como nao migrado, salvo se revelar regra de negocio.
5. Antes de criar codigo, inspecionar units Lazarus/mORMot2 ja existentes no projeto para seguir nomes, rotas, modelo ORM, injecao de dependencias, runner de testes e estilo local.
6. Criar ou atualizar somente os arquivos do modulo migrado, os fontes legados movidos e os testes correspondentes.
7. Executar formatacao/compilacao/testes disponiveis no projeto. Se o toolchain nao existir localmente, informar exatamente o que nao foi possivel validar.

## Arquivos

Criar uma pasta para o modulo normalizado e trabalhar dentro dela. Se a pasta nao existir, cria-la. Exemplo: a migracao de `Utilitarios/unAgenda.pas` e `Utilitarios/unAgenda.dfm` deve produzir `Utilitarios/Agenda/`.

Dentro da pasta do modulo normalizado:

- `[Modulo].repository.pas`: unit de acesso a dados usando mORMot2. Expor metodos CRUD e consultas necessarias; nao colocar regra de negocio, endpoint REST ou dependencia de UI.
- `[Modulo].service.pas`: unit de regras de negocio. Orquestrar repository, validar entradas, aplicar calculos, controlar transacoes quando o padrao do projeto pedir; nao expor HTTP nem SQL direto.
- `[Modulo].controller.pas`: unit REST usando mORMot2. Definir endpoints, DTOs/contratos, parse de parametros, respostas e codigos HTTP; delegar regras ao service.
- `old/`: subpasta com os arquivos `.pas` e `.dfm` legados que serviram de base para a migracao, preservando seus nomes originais.

Criar o teste em `tests/[Modulo]/test_[Modulo]_controller.pas`. Criar `tests` e a subpasta do modulo se nao existirem. Se o projeto ja usa outra nomenclatura de testes FPCUnit, seguir o padrao existente mantendo a separacao por `tests/[Modulo]/`.

Quando mover os legados para `old/`, atualizar referencias explicitas do projeto (`.dpr`, `.dproj`, `.lpi`, manifests ou rotas locais) para o novo caminho quando isso for necessario para manter o build antigo navegavel.

## Heuristicas De Migracao

- Tratar eventos de botoes como pistas: `Incluir`, `Alterar`, `Salvar`, `Excluir`, `Pesquisar` e similares indicam operacoes CRUD e endpoints esperados.
- Tratar `TDataSource`, `TClientDataSet`, `TQuery`, `TFDQuery`, `TADOQuery`, `TZQuery`, SQL embutido e bindings do `.dfm` como origem do mapeamento repository/ORM.
- Transformar validacoes de campos obrigatorios, limites, unicidade, permissao, dependencias entre campos e calculos financeiros/quantitativos em metodos do service.
- Manter mensagens de erro sem acoplar a UI: converter `ShowMessage`, `MessageDlg` e excecoes visuais em erros de dominio ou respostas REST.
- Preservar semantica de transacao quando houver sequencia de updates/inserts/deletes no modulo antigo.
- Preferir DTOs explicitos no controller quando entidades mORMot2 expuserem campos internos ou quando a tela antiga combinar dados de varias tabelas.
- Nao inventar campos, tabelas ou regras ausentes. Quando uma regra ficar ambigua, deixar uma nota curta no codigo ou no resumo final com o ponto que precisa de confirmacao.

## Testes

Escrever testes de integracao FPCUnit que exercitem o controller REST, nao apenas o service:

- Inicializar servidor/controlador mORMot2 em memoria ou banco temporario, conforme padrao do projeto.
- Popular dados minimos via repository ou fixture.
- Testar criar, consultar, atualizar, excluir e pelo menos um erro de validacao/regra de negocio.
- Verificar codigo HTTP, payload e efeito persistido.
- Isolar dados do teste para permitir execucao repetida.

## Referencias

Ler `references/mormot2-fpcunit-patterns.md` quando precisar de esqueletos de units Pascal, separacao CRUD/service/controller ou estrutura de teste FPCUnit.
