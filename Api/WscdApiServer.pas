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
  Agenda.repository,
  Agenda.controller,
  Recibo.repository,
  Recibo.controller,
  Vendedor.repository,
  Vendedor.controller;

type
  TWscdApiServer = class(TRestServerDB)
  private
    FAgendaController: TAgendaEndpointController;
    FReciboController: TReciboEndpointController;
    FVendedorController: TVendedorEndpointController;
    function RouteApi(Ctxt: TRestServerUriContext): Boolean;
  public
    constructor CreateInMemory(const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8 = 'api'); reintroduce;
    destructor Destroy; override;
  published
    procedure Health(Ctxt: TRestServerUriContext);
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

constructor TWscdApiServer.CreateInMemory(const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmAgenda, TOrmRecibo, TOrmVendedor], {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;

  FAgendaController := TAgendaEndpointController.Create(Orm);
  FReciboController := TReciboEndpointController.Create(Orm);
  FVendedorController := TVendedorEndpointController.Create(Orm);
  OnBeforeUri := RouteApi;
end;

constructor TWscdApiServer.CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmAgenda, TOrmRecibo, TOrmVendedor], ADbFileName, {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;

  FAgendaController := TAgendaEndpointController.Create(Orm);
  FReciboController := TReciboEndpointController.Create(Orm);
  FVendedorController := TVendedorEndpointController.Create(Orm);
  OnBeforeUri := RouteApi;
end;

destructor TWscdApiServer.Destroy;
begin
  FVendedorController.Free;
  FReciboController.Free;
  FAgendaController.Free;
  inherited Destroy;
end;

procedure TWscdApiServer.Health(Ctxt: TRestServerUriContext);
begin
  Ctxt.Returns('{"status":"ok"}', HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
end;

function TWscdApiServer.RouteApi(Ctxt: TRestServerUriContext): Boolean;
begin
  Result := False;

  if Ctxt.Table = TOrmAgenda then
    FAgendaController.Handle(Ctxt)
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
