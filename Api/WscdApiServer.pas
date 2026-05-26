unit WscdApiServer;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.os,
  mormot.core.text,
  mormot.core.unicode,
  mormot.rest.core,
  mormot.rest.http.server,
  mormot.rest.server,
  mormot.rest.sqlite3,
  mormot.db.raw.sqlite3.static,
  Cliente.repository,
  Cliente.controller,
  Agenda.repository,
  Agenda.controller,
  Fornecedor.repository,
  Fornecedor.controller,
  Recibo.repository,
  Recibo.controller,
  Vendedor.repository,
  Vendedor.controller;

type
  TWscdApiServer = class(TRestServerDB)
  private
    FAgendaController: TAgendaEndpointController;
    FClienteController: TClienteEndpointController;
    FFornecedorController: TFornecedorEndpointController;
    FReciboController: TReciboEndpointController;
    FVendedorController: TVendedorEndpointController;
    procedure InitializeApi;
    function RouteApi(Ctxt: TRestServerUriContext): Boolean;
  public
    constructor CreateInMemory(const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8 = 'api'); reintroduce;
    destructor Destroy; override;
  published
    procedure Health(Ctxt: TRestServerUriContext);
    procedure OpenAPI(Ctxt: TRestServerUriContext);
  end;

  TWscdApiRunner = class
  private
    FDbFileName: TFileName;
    FHttpServer: TRestHttpServer;
    FPort: RawUtf8;
    FServer: TWscdApiServer;
    class function EnvOrDefault(const AName, ADefault: string): string; static;
    procedure EnsureDatabaseFolder;
  public
    constructor Create;
    procedure Run;
    procedure Start;
    procedure Stop;
  end;

implementation

function WscdOpenApiJson: RawUtf8;
begin
  Result :=
    '{' +
    '"openapi":"3.0.3",' +
    '"info":{"title":"WSCD API","version":"1.0.0","description":"API REST do ERP WSCD em mORMot2."},' +
    '"servers":[{"url":"/api"}],' +
    '"tags":[' +
      '{"name":"Health"},' +
      '{"name":"Agenda"},' +
      '{"name":"Cliente"},' +
      '{"name":"Fornecedor"},' +
      '{"name":"Recibo"},' +
      '{"name":"Vendedor"}' +
    '],' +
    '"paths":{' +
      '"/Health":{' +
        '"get":{"tags":["Health"],"operationId":"getHealth","responses":{"200":{"description":"Servidor disponivel","content":{"application/json":{"schema":{"$ref":"#/components/schemas/HealthStatus"}}}}}}' +
      '},' +
      '"/Agenda":{' +
        '"get":{"tags":["Agenda"],"operationId":"listAgenda","parameters":[{"$ref":"#/components/parameters/id"}],"responses":{"200":{"description":"Agenda encontrada ou lista de agendas","content":{"application/json":{"schema":{"oneOf":[{"$ref":"#/components/schemas/Agenda"},{"type":"array","items":{"$ref":"#/components/schemas/Agenda"}}]}}}},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"post":{"tags":["Agenda"],"operationId":"createAgenda","requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/AgendaInput"}}}},"responses":{"201":{"description":"Agenda criada","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Agenda"}}}},"400":{"$ref":"#/components/responses/BadRequest"}}},' +
        '"put":{"tags":["Agenda"],"operationId":"updateAgenda","parameters":[{"$ref":"#/components/parameters/id"}],"requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/AgendaInput"}}}},"responses":{"200":{"description":"Agenda atualizada","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Agenda"}}}},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"delete":{"tags":["Agenda"],"operationId":"deleteAgenda","parameters":[{"$ref":"#/components/parameters/id"}],"responses":{"204":{"description":"Agenda excluida"},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}}' +
      '},' +
      '"/Cliente":{' +
        '"get":{"tags":["Cliente"],"operationId":"listCliente","parameters":[{"$ref":"#/components/parameters/id"},{"name":"codcidade","in":"query","required":false,"schema":{"type":"integer","format":"int64"}}],"responses":{"200":{"description":"Cliente encontrado ou lista de clientes","content":{"application/json":{"schema":{"oneOf":[{"$ref":"#/components/schemas/Cliente"},{"type":"array","items":{"$ref":"#/components/schemas/Cliente"}}]}}}},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"post":{"tags":["Cliente"],"operationId":"createCliente","requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/ClienteInput"}}}},"responses":{"201":{"description":"Cliente criado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Cliente"}}}},"400":{"$ref":"#/components/responses/BadRequest"}}},' +
        '"put":{"tags":["Cliente"],"operationId":"updateCliente","parameters":[{"$ref":"#/components/parameters/id"}],"requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/ClienteInput"}}}},"responses":{"200":{"description":"Cliente atualizado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Cliente"}}}},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"delete":{"tags":["Cliente"],"operationId":"deleteCliente","parameters":[{"$ref":"#/components/parameters/id"}],"responses":{"204":{"description":"Cliente excluido"},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}}' +
      '},' +
      '"/Fornecedor":{' +
        '"get":{"tags":["Fornecedor"],"operationId":"listFornecedor","parameters":[{"$ref":"#/components/parameters/id"},{"name":"codcidade","in":"query","required":false,"schema":{"type":"integer","format":"int64"}}],"responses":{"200":{"description":"Fornecedor encontrado ou lista de fornecedores","content":{"application/json":{"schema":{"oneOf":[{"$ref":"#/components/schemas/Fornecedor"},{"type":"array","items":{"$ref":"#/components/schemas/Fornecedor"}}]}}}},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"post":{"tags":["Fornecedor"],"operationId":"createFornecedor","requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/FornecedorInput"}}}},"responses":{"201":{"description":"Fornecedor criado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Fornecedor"}}}},"400":{"$ref":"#/components/responses/BadRequest"}}},' +
        '"put":{"tags":["Fornecedor"],"operationId":"updateFornecedor","parameters":[{"$ref":"#/components/parameters/id"}],"requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/FornecedorInput"}}}},"responses":{"200":{"description":"Fornecedor atualizado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Fornecedor"}}}},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"delete":{"tags":["Fornecedor"],"operationId":"deleteFornecedor","parameters":[{"$ref":"#/components/parameters/id"}],"responses":{"204":{"description":"Fornecedor excluido"},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}}' +
      '},' +
      '"/Recibo":{' +
        '"get":{"tags":["Recibo"],"operationId":"listRecibo","parameters":[{"$ref":"#/components/parameters/id"}],"responses":{"200":{"description":"Recibo encontrado ou lista de recibos","content":{"application/json":{"schema":{"oneOf":[{"$ref":"#/components/schemas/Recibo"},{"type":"array","items":{"$ref":"#/components/schemas/Recibo"}}]}}}},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"post":{"tags":["Recibo"],"operationId":"createRecibo","requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/ReciboInput"}}}},"responses":{"201":{"description":"Recibo criado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Recibo"}}}},"400":{"$ref":"#/components/responses/BadRequest"}}},' +
        '"put":{"tags":["Recibo"],"operationId":"updateRecibo","parameters":[{"$ref":"#/components/parameters/id"}],"requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/ReciboInput"}}}},"responses":{"200":{"description":"Recibo atualizado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Recibo"}}}},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"delete":{"tags":["Recibo"],"operationId":"deleteRecibo","parameters":[{"$ref":"#/components/parameters/id"}],"responses":{"204":{"description":"Recibo excluido"},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}}' +
      '},' +
      '"/Vendedor":{' +
        '"get":{"tags":["Vendedor"],"operationId":"listVendedor","parameters":[{"$ref":"#/components/parameters/id"}],"responses":{"200":{"description":"Vendedor encontrado ou lista de vendedores","content":{"application/json":{"schema":{"oneOf":[{"$ref":"#/components/schemas/Vendedor"},{"type":"array","items":{"$ref":"#/components/schemas/Vendedor"}}]}}}},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"post":{"tags":["Vendedor"],"operationId":"createVendedor","requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/VendedorInput"}}}},"responses":{"201":{"description":"Vendedor criado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Vendedor"}}}},"400":{"$ref":"#/components/responses/BadRequest"}}},' +
        '"put":{"tags":["Vendedor"],"operationId":"updateVendedor","parameters":[{"$ref":"#/components/parameters/id"}],"requestBody":{"required":true,"content":{"application/json":{"schema":{"$ref":"#/components/schemas/VendedorInput"}}}},"responses":{"200":{"description":"Vendedor atualizado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Vendedor"}}}},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}},' +
        '"delete":{"tags":["Vendedor"],"operationId":"deleteVendedor","parameters":[{"$ref":"#/components/parameters/id"}],"responses":{"204":{"description":"Vendedor excluido"},"400":{"$ref":"#/components/responses/BadRequest"},"404":{"$ref":"#/components/responses/NotFound"}}}' +
      '},' +
      '"/OpenAPI":{' +
        '"get":{"tags":["Health"],"operationId":"getOpenApi","responses":{"200":{"description":"Especificacao OpenAPI 3.0","content":{"application/json":{"schema":{"type":"object"}}}}}}' +
      '}' +
    '},' +
    '"components":{' +
      '"parameters":{' +
        '"id":{"name":"id","in":"query","required":false,"schema":{"type":"integer","format":"int64"}}' +
      '},' +
      '"responses":{' +
        '"BadRequest":{"description":"Requisicao invalida","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Error"}}}},' +
        '"NotFound":{"description":"Registro nao encontrado","content":{"application/json":{"schema":{"$ref":"#/components/schemas/Error"}}}}' +
      '},' +
      '"schemas":{' +
        '"HealthStatus":{"type":"object","properties":{"status":{"type":"string","example":"ok"}},"required":["status"]},' +
        '"Error":{"type":"object","properties":{"error":{"type":"string"}}},' +
        '"AgendaInput":{"type":"object","properties":{"Nome":{"type":"string","maxLength":80},"Telefone":{"type":"string","maxLength":20},"Telefone2":{"type":"string","maxLength":20},"Telefone3":{"type":"string","maxLength":20},"Fax":{"type":"string","maxLength":20},"Obs":{"type":"string"}},"required":["Nome","Telefone"]},' +
        '"Agenda":{"allOf":[{"$ref":"#/components/schemas/AgendaInput"},{"type":"object","properties":{"IDAgenda":{"type":"integer","format":"int64"}},"required":["IDAgenda"]}]},' +
        '"ClienteInput":{"type":"object","properties":{"Tipo":{"type":"string","maxLength":1},"Nome":{"type":"string"},"Endereco":{"type":"string"},"Cep":{"type":"string"},"Bairro":{"type":"string"},"Telefone":{"type":"string"},"Fax":{"type":"string"},"CodCidade":{"type":"integer","format":"int64"},"Uf":{"type":"string","maxLength":2},"TempoMoradia":{"type":"string"},"EndAnterior":{"type":"string"},"Email":{"type":"string"},"Trabalho":{"type":"string"},"Cargo":{"type":"string"},"DataInicio":{"type":"string","format":"date-time"},"Salario":{"type":"number","format":"double"},"EstadoCivil":{"type":"string","maxLength":1},"Conjugue":{"type":"string"},"LocalTrab":{"type":"string"},"DataNasc":{"type":"string","format":"date-time"},"Pai":{"type":"string"},"Mae":{"type":"string"},"CpfCnpj":{"type":"string"},"RgIe":{"type":"string"},"ReferPes":{"type":"string"},"ReferCom":{"type":"string"},"FoneCom":{"type":"string"},"Cadastro":{"type":"string","format":"date-time"},"Obs":{"type":"string"},"Naturalidade":{"type":"string"},"Limite":{"type":"number","format":"double"},"Foto":{"type":"string","format":"byte"}},"required":["Tipo","Nome","CodCidade","CpfCnpj","RgIe"]},' +
        '"Cliente":{"allOf":[{"$ref":"#/components/schemas/ClienteInput"},{"type":"object","properties":{"IDCliente":{"type":"integer","format":"int64"}},"required":["IDCliente"]}]},' +
        '"FornecedorInput":{"type":"object","properties":{"Fantazia":{"type":"string","maxLength":80},"RazaoSocial":{"type":"string","maxLength":80},"DataCad":{"type":"string","format":"date-time"},"Endereco":{"type":"string","maxLength":80},"Cidade":{"type":"integer","format":"int64"},"Bairro":{"type":"string","maxLength":80},"Cnpj":{"type":"string","maxLength":20},"Ie":{"type":"string","maxLength":20},"Cep":{"type":"string","maxLength":10},"Telefone":{"type":"string","maxLength":20},"Fax":{"type":"string","maxLength":20},"Email":{"type":"string","maxLength":80},"Uf":{"type":"string","maxLength":2},"Obs":{"type":"string"},"Vendedor":{"type":"string","maxLength":80},"TelefoneVendedor":{"type":"string","maxLength":20},"EmailVendedor":{"type":"string","maxLength":80},"Tipo":{"type":"string","enum":["F","J"],"maxLength":1}},"required":["RazaoSocial","Cidade","Cnpj","Telefone","Vendedor","TelefoneVendedor"]},' +
        '"Fornecedor":{"allOf":[{"$ref":"#/components/schemas/FornecedorInput"},{"type":"object","properties":{"IDFornecedor":{"type":"integer","format":"int64"}},"required":["IDFornecedor"]}]},' +
        '"ReciboInput":{"type":"object","properties":{"Data":{"type":"string","format":"date-time"},"Recebedor":{"type":"string","maxLength":250},"Referente":{"type":"string"},"Valor":{"type":"number","format":"double"}},"required":["Data","Recebedor","Valor"]},' +
        '"Recibo":{"allOf":[{"$ref":"#/components/schemas/ReciboInput"},{"type":"object","properties":{"IDRecibo":{"type":"integer","format":"int64"},"ValorExtenso":{"type":"string"}},"required":["IDRecibo"]}]},' +
        '"VendedorInput":{"type":"object","properties":{"Vendedor":{"type":"string","maxLength":80},"Ativo":{"type":"string","enum":["S","N"]}},"required":["Vendedor"]},' +
        '"Vendedor":{"allOf":[{"$ref":"#/components/schemas/VendedorInput"},{"type":"object","properties":{"IDVendedor":{"type":"integer","format":"int64"}},"required":["IDVendedor"]}]}' +
      '}' +
    '}' +
    '}';
end;

constructor TWscdApiServer.CreateInMemory(const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmAgenda, TOrmCliente, TOrmFornecedor,
    TOrmRecibo, TOrmVendedor], {HandleUserAuthentication=}False, ARoot);
  InitializeApi;
end;

constructor TWscdApiServer.CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmAgenda, TOrmCliente, TOrmFornecedor,
    TOrmRecibo, TOrmVendedor], ADbFileName, {HandleUserAuthentication=}False,
    ARoot);
  InitializeApi;
end;

procedure TWscdApiServer.InitializeApi;
begin
  Server.CreateMissingTables;

  FAgendaController := TAgendaEndpointController.Create(Orm);
  FClienteController := TClienteEndpointController.Create(Orm);
  FFornecedorController := TFornecedorEndpointController.Create(Orm);
  FReciboController := TReciboEndpointController.Create(Orm);
  FVendedorController := TVendedorEndpointController.Create(Orm);
  OnBeforeUri := RouteApi;
end;

destructor TWscdApiServer.Destroy;
begin
  FVendedorController.Free;
  FReciboController.Free;
  FFornecedorController.Free;
  FClienteController.Free;
  FAgendaController.Free;
  inherited Destroy;
end;

procedure TWscdApiServer.Health(Ctxt: TRestServerUriContext);
begin
  Ctxt.Returns('{"status":"ok"}', HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
end;

procedure TWscdApiServer.OpenAPI(Ctxt: TRestServerUriContext);
begin
  Ctxt.Returns(WscdOpenApiJson, HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
end;

function TWscdApiServer.RouteApi(Ctxt: TRestServerUriContext): Boolean;
begin
  Result := False;

  if Ctxt.Table = TOrmAgenda then
    FAgendaController.Handle(Ctxt)
  else if Ctxt.Table = TOrmCliente then
    FClienteController.Handle(Ctxt)
  else if Ctxt.Table = TOrmFornecedor then
    FFornecedorController.Handle(Ctxt)
  else if Ctxt.Table = TOrmRecibo then
    FReciboController.Handle(Ctxt)
  else if Ctxt.Table = TOrmVendedor then
    FVendedorController.Handle(Ctxt)
  else
    Result := True;
end;

class function TWscdApiRunner.EnvOrDefault(const AName, ADefault: string): string;
begin
  Result := GetEnvironmentVariable(AName);
  if Result = '' then
    Result := ADefault;
end;

constructor TWscdApiRunner.Create;
begin
  inherited Create;
  FPort := StringToUtf8(EnvOrDefault('PORT', '3001'));
  FDbFileName := EnvOrDefault('WSCD_DB', 'data/wscd-api.db3');
end;

procedure TWscdApiRunner.EnsureDatabaseFolder;
var
  Folder: TFileName;
begin
  Folder := ExtractFilePath(FDbFileName);
  if Folder <> '' then
    ForceDirectories(Folder);
end;

procedure TWscdApiRunner.Start;
begin
  EnsureDatabaseFolder;
  FServer := TWscdApiServer.CreateWithDatabase(FDbFileName, 'api');
  FHttpServer := TRestHttpServer.Create(FPort, [FServer], '+', HTTP_DEFAULT_MODE);
  FHttpServer.AccessControlAllowOrigin := '*';
  Writeln('WSCDApi running on port ', Utf8ToString(FPort), ' using database ', FDbFileName);
end;

procedure TWscdApiRunner.Stop;
begin
  FreeAndNil(FHttpServer);
  FreeAndNil(FServer);
end;

procedure TWscdApiRunner.Run;
begin
  {$ifdef OSWINDOWS}
  Start;
  try
    ConsoleWaitForEnterKey;
  finally
    Stop;
  end;
  {$else}
  RunUntilSigTerminated(Self, {dofork=}False, Start, Stop, nil, 'WSCDApi');
  {$endif OSWINDOWS}
end;

end.
