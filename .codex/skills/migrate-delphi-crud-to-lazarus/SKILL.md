---
name: migrate-delphi-crud-to-lazarus
description: Migrar modulos CRUD Delphi para Lazarus/Free Pascal separando persistencia, regras de negocio e endpoints REST. Use quando o usuario pedir para migrar um modulo Delphi existente a partir de arquivos .pas e .dfm, criar units repository/service/controller com mORMot2 em pasta normalizada do modulo, preservar fontes legados em old, registrar o modulo no projeto API WSCDApi, ou adicionar testes de integracao FPCUnit para controllers REST migrados.
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
6. Criar ou atualizar somente os arquivos do modulo migrado, os fontes legados movidos, os testes correspondentes e os projetos `WSCDApi.lpi`/`tests/WSCDApiTests.lpi`.
7. Registrar o modulo novo no bootstrap da API em `Api/WscdApiServer.pas`, mantendo um unico `TRestServerDB` para todos os modulos ativos.
8. Executar formatacao/compilacao/testes disponiveis no projeto. Se o toolchain nao existir localmente, informar exatamente o que nao foi possivel validar.

## Arquivos

Criar uma pasta para o modulo normalizado e trabalhar dentro dela. Se a pasta nao existir, cria-la. Exemplo: a migracao de `Utilitarios/unAgenda.pas` e `Utilitarios/unAgenda.dfm` deve produzir `Utilitarios/Agenda/`.

Dentro da pasta do modulo normalizado:

- `[Modulo].repository.pas`: unit de acesso a dados usando mORMot2. Expor metodos CRUD e consultas necessarias; nao colocar regra de negocio, endpoint REST ou dependencia de UI.
- `[Modulo].service.pas`: unit de regras de negocio. Orquestrar repository, validar entradas, aplicar calculos, controlar transacoes quando o padrao do projeto pedir; nao expor HTTP nem SQL direto.
- `[Modulo].controller.pas`: unit REST usando mORMot2. Definir DTOs/contratos, parse de parametros, respostas e codigos HTTP; delegar regras ao service. Deve seguir o padrao atual de `T[Modulo]EndpointController`, com um metodo publico `Handle(Ctxt: TRestServerUriContext)` e metodos privados para `GET`, `POST`, `PUT` e `DELETE`.
- `old/`: subpasta com os arquivos `.pas` e `.dfm` legados que serviram de base para a migracao, preservando seus nomes originais.

Criar o teste em `tests/[Modulo]/test_[Modulo]_controller.pas`. Criar `tests` e a subpasta do modulo se nao existirem. Se o projeto ja usa outra nomenclatura de testes FPCUnit, seguir o padrao existente mantendo a separacao por `tests/[Modulo]/`.

Quando mover os legados para `old/`, atualizar referencias explicitas do projeto (`.dpr`, `.dproj`, `.lpi`, manifests ou rotas locais) para o novo caminho quando isso for necessario para manter o build antigo navegavel.

## Padrao Atual De Controller/API

Cada modulo migrado deve seguir o desenho confirmado em `Agenda` e `Recibo`:

- O controller do modulo deve expor uma classe `T[Modulo]EndpointController = class`, nao acoplada a `TRestServerDB`.
- `T[Modulo]EndpointController` deve receber `IRestOrm` no construtor, criar repository/service internamente e expor `Handle(Ctxt: TRestServerUriContext)`.
- O `Handle` deve despachar por `Ctxt.Method` para `HandleGet`, `HandleCreate`, `HandleUpdate` e `HandleDelete`.
- Erros de validacao do service devem virar `HTTP_BADREQUEST`; registros nao encontrados devem virar `HTTP_NOTFOUND`; erros inesperados devem virar `HTTP_SERVERERROR`.
- Para payloads de `POST` e `PUT`, nao depender de `RecordLoadJson(Input, Ctxt.Call.InBody, TypeInfo(T[Modulo]Input))` no controller. Criar um helper privado `LoadInput(const AJson: RawUtf8; out AInput: T[Modulo]Input): Boolean` e preencher o record explicitamente via `JsonDecode`/`TValuePUtf8Char` com os nomes JSON publicos do contrato. Isso evita falso `JSON invalido` em payloads validos enviados por clientes externos.
- Para respostas de `POST`, `GET` e `PUT`, nao depender de `RecordSaveJson(Output, TypeInfo(T[Modulo]Output))` nem `DynArraySaveJson` para DTOs packed record. Criar helpers privados `OutputJson(const AOutput: T[Modulo]Output): RawUtf8` e `OutputListJson(const AItems: T[Modulo]OutputDynArray): RawUtf8`, usando `JsonEncode` para objetos e concatenando arrays de objetos. Isso evita respostas como arrays de blobs/base64 em vez de JSON publico.
- Para obter IDs opcionais em `GET` de listagem, usar `Ctxt.InputIntOrVoid['id']`, `Ctxt.InputIntOrVoid['ID']` e `Ctxt.InputIntOrVoid['ID[MODULO]']`. Nao usar `Ctxt.InputInt[...]` em helper de ID opcional, porque o mORMot2 lanca excecao quando o parametro esta ausente e transforma `GET /api/[Modulo]` em erro 500.
- O controller pode manter uma classe wrapper `T[Modulo]Controller = class(TRestServerDB)` apenas para testes legados ou compatibilidade, mas ela deve registrar a rota via `OnBeforeUri`, nao por metodo `published` com o mesmo nome da tabela.
- Nao declarar `procedure [Modulo](Ctxt: TRestServerUriContext)` em `published` quando existir uma tabela `TOrm[Modulo]` no mesmo model. O mORMot2 acusa conflito entre nome de metodo publicado e tabela.
- O bootstrap `Api/WscdApiServer.pas` deve manter um unico `TRestServerDB` com todas as tabelas ativas, criar um endpoint controller por modulo e delegar via `OnBeforeUri`.
- Em `Api/WscdApiServer.pas`, adicionar `TOrm[Modulo]` ao model e interceptar `Ctxt.Table = TOrm[Modulo]` para chamar `F[Modulo]Controller.Handle(Ctxt)`.
- Nao usar `RootRedirectGet` para health check se isso puder redirecionar `GET` de tabelas. Preferir endpoint explicito como `/api/Health`.
- A rota publica do modulo deve permanecer `/api/[Modulo]`.

## Projetos API E Testes

Ao concluir uma migracao de modulo:

- Adicionar `Utilitarios/[Modulo]/[Modulo].repository.pas`, `.service.pas` e `.controller.pas` em `WSCDApi.lpi`.
- Adicionar os mesmos arquivos, mais `tests/[Modulo]/test_[Modulo]_controller.pas`, em `tests/WSCDApiTests.lpi`.
- Adicionar a unit de teste no `uses` de `tests/WSCDApiTests.lpr`.
- Atualizar `Api/WscdApiServer.pas` para incluir o novo repository/controller no `uses`, o novo `TOrm[Modulo]` no model e o novo endpoint controller no roteamento.
- Manter `WSCDApi.lpi` livre de `LCL`, `Forms`, `Application`, `Horse`, `Routes.pas`, `.dfm`, `.lfm` e units desktop fora das dependencias reais do modulo.

## Heuristicas De Migracao

- Tratar eventos de botoes como pistas: `Incluir`, `Alterar`, `Salvar`, `Excluir`, `Pesquisar` e similares indicam operacoes CRUD e endpoints esperados.
- Tratar `TDataSource`, `TClientDataSet`, `TQuery`, `TFDQuery`, `TADOQuery`, `TZQuery`, SQL embutido e bindings do `.dfm` como origem do mapeamento repository/ORM.
- Transformar validacoes de campos obrigatorios, limites, unicidade, permissao, dependencias entre campos e calculos financeiros/quantitativos em metodos do service.
- Manter mensagens de erro sem acoplar a UI: converter `ShowMessage`, `MessageDlg` e excecoes visuais em erros de dominio ou respostas REST.
- Preservar semantica de transacao quando houver sequencia de updates/inserts/deletes no modulo antigo.
- Preferir DTOs explicitos no controller quando entidades mORMot2 expuserem campos internos ou quando a tela antiga combinar dados de varias tabelas.
- Tratar IDs/chaves primarias como auto-incrementais. Nao exigir ID nos payloads de `POST` ou `PUT`; receber ID apenas pela rota/query quando a operacao precisar identificar um registro (`GET` unico, `PUT`, `DELETE`) e retornar o ID somente nos DTOs de saida.
- Nao inventar campos, tabelas ou regras ausentes. Quando uma regra ficar ambigua, deixar uma nota curta no codigo ou no resumo final com o ponto que precisa de confirmacao.

## Testes

Escrever testes de integracao FPCUnit que exercitem o controller REST, nao apenas o service:

- Inicializar servidor/controlador mORMot2 em memoria ou banco temporario, conforme padrao do projeto.
- Popular dados minimos via repository ou fixture.
- Testar criar, consultar, atualizar, excluir e pelo menos um erro de validacao/regra de negocio.
- Confirmar que o teste de criacao envia payload sem ID e valida que o ID retornado foi gerado.
- Nos testes de controller, enviar pelo menos um payload JSON literal com os nomes publicos do contrato, em vez de gerar todos os bodies com `RecordSaveJson`, para cobrir o mesmo formato enviado por clientes HTTP reais.
- Nos testes de controller, validar respostas JSON publicas por campo usando `JsonDecode`/`TValuePUtf8Char` ou assercoes de texto JSON, nao `RecordLoadJson` sobre os DTOs, para nao mascarar problemas de contrato HTTP.
- Testar `GET /api/[Modulo]` sem `id` e validar que retorna lista com `HTTP_SUCCESS`.
- Verificar codigo HTTP, payload e efeito persistido.
- Isolar dados do teste para permitir execucao repetida.
- Testar tambem o servidor unificado em `tests/Api/test_WscdApiServer.pas`, cobrindo pelo menos um fluxo CRUD basico do modulo novo via `TWscdApiServer.CreateInMemory`.
- Rodar `lazbuild WSCDApi.lpi`, `lazbuild tests/WSCDApiTests.lpi` e `./tests/WSCDApiTests --all --format=plain` quando o toolchain estiver disponivel.
- Verificar que o projeto API novo nao referencia LCL, Forms, Horse, Routes, telas ou units desktop fora das dependencias explicitamente migradas.

## Referencias

Ler `references/mormot2-fpcunit-patterns.md` quando precisar de esqueletos de units Pascal, separacao CRUD/service/controller ou estrutura de teste FPCUnit.
