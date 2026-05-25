unit WscdApiServer;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.os,
  mormot.core.text,
  mormot.core.unicode,
  mormot.db.core,
  mormot.db.sql,
  mormot.db.sql.odbc,
  mormot.db.raw.sqlite3,
  mormot.orm.core,
  mormot.orm.sql,
  mormot.rest.core,
  mormot.rest.http.server,
  mormot.rest.server,
  mormot.rest.sqlite3,
  mormot.db.raw.sqlite3.static,
  WscdApiConfig,
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
    FExternalDb: TSqlDBConnectionProperties;
    FReciboController: TReciboEndpointController;
    FVendedorController: TVendedorEndpointController;
    FInheritedCreateCalled: Boolean;
    procedure InitializeApi(ACreateMissingTables: Boolean);
    function RouteApi(Ctxt: TRestServerUriContext): Boolean;
  public
    constructor CreateInMemory(const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithFirebirdOdbc(const AConnectionString: RawUtf8;
      ACreateMissingTables: Boolean = True; const ARoot: RawUtf8 = 'api'); reintroduce;
    destructor Destroy; override;
  published
    procedure Health(Ctxt: TRestServerUriContext);
  end;

  TWscdApiRunner = class
  private
    FHttpServer: TRestHttpServer;
    FServer: TWscdApiServer;
    FSettings: TWscdApiSettings;
    procedure EnsureDatabaseFolder;
  public
    constructor Create;
    procedure Run;
    procedure Start;
    procedure Stop;
  end;

implementation

function CreateWscdModel(const ARoot: RawUtf8): TOrmModel;
begin
  Result := TOrmModel.Create([TOrmAgenda, TOrmRecibo, TOrmVendedor], ARoot);
end;

constructor TWscdApiServer.CreateInMemory(const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmAgenda, TOrmRecibo, TOrmVendedor], {HandleUserAuthentication=}False, ARoot);
  FInheritedCreateCalled := True;
  InitializeApi({ACreateMissingTables=}True);
end;

constructor TWscdApiServer.CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmAgenda, TOrmRecibo, TOrmVendedor], ADbFileName, {HandleUserAuthentication=}False, ARoot);
  FInheritedCreateCalled := True;
  InitializeApi({ACreateMissingTables=}True);
end;

constructor TWscdApiServer.CreateWithFirebirdOdbc(const AConnectionString: RawUtf8;
  ACreateMissingTables: Boolean; const ARoot: RawUtf8);
var
  Model: TOrmModel;
begin
  Model := CreateWscdModel(ARoot);
  try
    FExternalDb := TSqlDBOdbcConnectionProperties.Create('', AConnectionString, '', '');
    FExternalDb.Dbms := dFirebird;
    OrmMapExternalAll(Model, FExternalDb, [regMapAutoKeywordFields]);

    inherited Create(Model, SQLITE_MEMORY_DATABASE_NAME, {HandleUserAuthentication=}False);
    FInheritedCreateCalled := True;
    Model.Owner := Self;
    InitializeApi(ACreateMissingTables);
  except
    FExternalDb.Free;
    FExternalDb := nil;
    if Model.Owner = nil then
      Model.Free;
    raise;
  end;
end;

procedure TWscdApiServer.InitializeApi(ACreateMissingTables: Boolean);
begin
  if ACreateMissingTables then
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
  if FInheritedCreateCalled then
    inherited Destroy;
  FExternalDb.Free;
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

constructor TWscdApiRunner.Create;
begin
  inherited Create;
  FSettings := TWscdApiSettings.Load;
end;

procedure TWscdApiRunner.EnsureDatabaseFolder;
var
  Folder: TFileName;
begin
  if FSettings.DatabaseEngine <> wdeSQLite then
    Exit;

  Folder := ExtractFilePath(FSettings.SQLiteFileName);
  if Folder <> '' then
    ForceDirectories(Folder);
end;

procedure TWscdApiRunner.Start;
begin
  EnsureDatabaseFolder;

  if FSettings.DatabaseEngine = wdeFirebird then
    FServer := TWscdApiServer.CreateWithFirebirdOdbc(
      FSettings.OdbcConnectionString, FSettings.CreateMissingTables, 'api')
  else
    FServer := TWscdApiServer.CreateWithDatabase(FSettings.SQLiteFileName, 'api');

  FHttpServer := TRestHttpServer.Create(FSettings.HttpPort, [FServer], '+', HTTP_DEFAULT_MODE);
  FHttpServer.AccessControlAllowOrigin := '*';
  Writeln('WSCDApi running on port ', Utf8ToString(FSettings.HttpPort),
    ' using ', FSettings.DatabaseDescription);
  Writeln('Config file: ', FSettings.ConfigFileName);
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
