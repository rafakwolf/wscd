# WSCD

ERP originalmente desenvolvido em Delphi para desktop, em processo de migração para Lazarus/Free Pascal e para uma API REST em mORMot2.

## Estado atual

- O projeto desktop principal permanece em `WSCD.lpr`/`WSCD.lpi` como referência da migração.
- A API nova fica separada em `WSCDApi.lpr`/`WSCDApi.lpi`, sem LCL, Forms, Horse, telas ou datamodules.
- Os módulos migrados por enquanto são `Utilitarios/Agenda` e `Utilitarios/Recibo`.
- Cada módulo segue o padrão `repository`, `service` e `controller`.
- `Api/WscdApiServer.pas` cria um único `TRestServerDB` com `TOrmAgenda` e `TOrmRecibo` e delega as rotas para os controllers.
- Os endpoints atuais são `/api/Health`, `/api/Agenda` e `/api/Recibo`.
- A API usa `PORT` com padrão `3001` e `WSCD_DB` com padrão `data/wscd-api.db3`.
- Em Linux, o runner usa `RunUntilSigTerminated`, preparando o processo para execução futura em container.

## Dependências

- Free Pascal/Lazarus.
- mORMot2 em `libs/mORMot2`.
- Objetos estáticos do mORMot2 em `libs/mORMot2/static/$(TargetCPU)-$(TargetOS)`, usados para SQLite estático.

## Build e testes

Build da API:

```sh
lazbuild WSCDApi.lpi
```

Build dos testes:

```sh
lazbuild tests/WSCDApiTests.lpi
```

Execução dos testes:

```sh
./tests/WSCDApiTests --all --format=plain
```

Na validação atual, o runner executa testes integrados de `Health`, `Agenda` e `Recibo`.

## Próximos passos

- Migrar novos módulos seguindo o mesmo padrão dos controllers atuais.
- Adicionar cada novo módulo em `WSCDApi.lpi` e `tests/WSCDApiTests.lpi`.
- Criar um Dockerfile multi-stage para compilar com FPC/Lazarus e copiar apenas o binário e dados necessários para o runtime.
