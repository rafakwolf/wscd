# mORMot2/FPCUnit Patterns

Use estes modelos como ponto de partida e adapte aos nomes, units e helpers ja existentes no projeto. Prefira exemplos locais compilaveis quando houver divergencia de API entre versoes do mORMot2.

Substitua `{Modulo}` pelo nome normalizado sem prefixo tecnico. Para `unAgenda`, usar pasta `Agenda/`, units `Agenda.repository`, `Agenda.service`, `Agenda.controller`, e teste `tests/Agenda/test_Agenda_controller.pas`.

## Repository

```pascal
unit {Modulo}.repository;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,
  mormot.orm.core,
  mormot.orm.rest;

type
  T{Modulo}Repository = class
  private
    FOrm: IRestOrm;
  public
    constructor Create(const AOrm: IRestOrm);
    function FindById(const AId: TID): TOrm{Entidade};
    function ListAll: T{Modulo}OutputList; // substituir pela lista/DTO tipado usado no projeto
    function Add(const AEntity: TOrm{Entidade}): TID;
    procedure Update(const AEntity: TOrm{Entidade});
    procedure Delete(const AId: TID);
  end;

implementation

constructor T{Modulo}Repository.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  FOrm := AOrm;
end;

function T{Modulo}Repository.FindById(const AId: TID): TOrm{Entidade};
begin
  Result := TOrm{Entidade}.Create;
  if not FOrm.Retrieve(AId, Result) then
    FreeAndNil(Result);
end;

function T{Modulo}Repository.Add(const AEntity: TOrm{Entidade}): TID;
begin
  Result := FOrm.Add(AEntity, True);
end;

procedure T{Modulo}Repository.Update(const AEntity: TOrm{Entidade});
begin
  if not FOrm.Update(AEntity) then
    raise Exception.Create('{Modulo} nao encontrado para atualizacao');
end;

procedure T{Modulo}Repository.Delete(const AId: TID);
begin
  if not FOrm.Delete(TOrm{Entidade}, AId) then
    raise Exception.Create('{Modulo} nao encontrado para exclusao');
end;

end.
```

## Service

```pascal
unit {Modulo}.service;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,
  {Modulo}.repository;

type
  E{Modulo}Validation = class(Exception);

  T{Modulo}Service = class
  private
    FRepository: T{Modulo}Repository;
    procedure ValidateForSave(const AInput: T{Modulo}Input);
  public
    constructor Create(ARepository: T{Modulo}Repository);
    function CreateItem(const AInput: T{Modulo}Input): T{Modulo}Output;
    function GetItem(const AId: Int64): T{Modulo}Output;
    function UpdateItem(const AId: Int64; const AInput: T{Modulo}Input): T{Modulo}Output;
    procedure DeleteItem(const AId: Int64);
  end;

implementation

constructor T{Modulo}Service.Create(ARepository: T{Modulo}Repository);
begin
  inherited Create;
  FRepository := ARepository;
end;

procedure T{Modulo}Service.ValidateForSave(const AInput: T{Modulo}Input);
begin
  if Trim(AInput.Nome) = '' then
    raise E{Modulo}Validation.Create('Nome e obrigatorio');
end;

end.
```

## Controller

```pascal
unit {Modulo}.controller;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.interfaces,
  mormot.rest.core,
  {Modulo}.service;

type
  T{Modulo}Controller = class
  private
    FService: T{Modulo}Service;
  public
    constructor Create(AService: T{Modulo}Service);
    procedure RegisterRoutes(ARestServer: TRestServer);
    // Adaptar as assinaturas ao padrao mORMot2 usado no projeto.
  end;

implementation

constructor T{Modulo}Controller.Create(AService: T{Modulo}Service);
begin
  inherited Create;
  FService := AService;
end;

procedure T{Modulo}Controller.RegisterRoutes(ARestServer: TRestServer);
begin
  // Registrar:
  // GET    /{modulo}
  // GET    /{modulo}/{id}
  // POST   /{modulo}
  // PUT    /{modulo}/{id}
  // DELETE /{modulo}/{id}
end;

end.
```

## FPCUnit Integration Test

```pascal
unit test_{Modulo}_controller;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  fpcunit,
  testregistry;

type
  T{Modulo}ControllerTest = class(TTestCase)
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure CreateReturnsCreatedPayload;
    procedure GetReturnsPersistedPayload;
    procedure UpdateChangesPersistedPayload;
    procedure DeleteRemovesPayload;
    procedure InvalidPayloadReturnsValidationError;
  end;

implementation

procedure T{Modulo}ControllerTest.SetUp;
begin
  inherited SetUp;
  // Criar modelo mORMot2, banco temporario/in-memory, repository, service,
  // controller e cliente HTTP/REST conforme padrao do projeto.
end;

procedure T{Modulo}ControllerTest.TearDown;
begin
  // Liberar cliente, servidor, banco temporario e fixtures.
  inherited TearDown;
end;

initialization
  RegisterTest(T{Modulo}ControllerTest);

end.
```

## Checklist De Saida

- Confirmar que repository nao contem validacao de negocio nem HTTP.
- Confirmar que service nao contem SQL direto nem dependencia de componentes visuais.
- Confirmar que controller nao contem regra de negocio alem de traducao HTTP/DTO.
- Confirmar que o teste passa por endpoints REST reais do controller.
- Confirmar que `.pas` e `.dfm` antigos foram usados como fonte das regras migradas.
- Confirmar que os novos arquivos estao na pasta do modulo normalizado e os legados em `old/`.
- Confirmar que o teste esta em `tests/{Modulo}/`.
