unit Agenda.controller;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.json,
  mormot.core.os,
  mormot.core.text,
  mormot.core.unicode,
  mormot.orm.core,
  mormot.orm.rest,
  mormot.rest.core,
  mormot.rest.server,
  mormot.rest.sqlite3,
  mormot.db.raw.sqlite3.static,
  Agenda.repository,
  Agenda.service;

type
  TAgendaEndpointController = class
  private
    FRepository: TAgendaRepository;
    FService: TAgendaService;
    function RequestId(Ctxt: TRestServerUriContext): TID;
    procedure HandleCreate(Ctxt: TRestServerUriContext);
    procedure HandleDelete(Ctxt: TRestServerUriContext);
    procedure HandleGet(Ctxt: TRestServerUriContext);
    procedure HandleUpdate(Ctxt: TRestServerUriContext);
    procedure HandleException(Ctxt: TRestServerUriContext; E: Exception);
  public
    constructor Create(const AOrm: IRestOrm);
    destructor Destroy; override;
    procedure Handle(Ctxt: TRestServerUriContext);
  end;

  TAgendaController = class(TRestServerDB)
  private
    FEndpoint: TAgendaEndpointController;
    function RouteAgenda(Ctxt: TRestServerUriContext): Boolean;
  public
    constructor CreateInMemory(const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8 = 'api'); reintroduce;
    destructor Destroy; override;
  end;

implementation

constructor TAgendaEndpointController.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  FRepository := TAgendaRepository.Create(AOrm);
  FService := TAgendaService.Create(FRepository);
end;

destructor TAgendaEndpointController.Destroy;
begin
  FService.Free;
  FRepository.Free;
  inherited Destroy;
end;

function TAgendaEndpointController.RequestId(Ctxt: TRestServerUriContext): TID;
begin
  Result := Ctxt.InputInt['id'];
  if Result = 0 then
    Result := Ctxt.InputInt['ID'];
  if Result = 0 then
    Result := Ctxt.InputInt['IDAGENDA'];
end;

procedure TAgendaEndpointController.HandleCreate(Ctxt: TRestServerUriContext);
var
  Input: TAgendaInput;
  Output: TAgendaOutput;
begin
  FillChar(Input, SizeOf(Input), 0);
  if not RecordLoadJson(Input, Ctxt.Call.InBody, TypeInfo(TAgendaInput)) then
  begin
    Ctxt.Error('JSON invalido para Agenda', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.CreateItem(Input);
  Ctxt.Returns(RecordSaveJson(Output, TypeInfo(TAgendaOutput)), HTTP_CREATED, JSON_CONTENT_TYPE_HEADER);
end;

procedure TAgendaEndpointController.HandleDelete(Ctxt: TRestServerUriContext);
var
  Id: TID;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDAGENDA e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  FService.DeleteItem(Id);
  Ctxt.Success(HTTP_NOCONTENT);
end;

procedure TAgendaEndpointController.HandleGet(Ctxt: TRestServerUriContext);
var
  Id: TID;
  Item: TAgendaOutput;
  Items: TAgendaOutputDynArray;
begin
  Id := RequestId(Ctxt);
  if Id > 0 then
  begin
    Item := FService.GetItem(Id);
    Ctxt.Returns(RecordSaveJson(Item, TypeInfo(TAgendaOutput)), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
  end
  else
  begin
    Items := FService.ListItems;
    Ctxt.Returns(DynArraySaveJson(Items, TypeInfo(TAgendaOutputDynArray)), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
  end;
end;

procedure TAgendaEndpointController.HandleUpdate(Ctxt: TRestServerUriContext);
var
  Id: TID;
  Input: TAgendaInput;
  Output: TAgendaOutput;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDAGENDA e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  FillChar(Input, SizeOf(Input), 0);
  if not RecordLoadJson(Input, Ctxt.Call.InBody, TypeInfo(TAgendaInput)) then
  begin
    Ctxt.Error('JSON invalido para Agenda', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.UpdateItem(Id, Input);
  Ctxt.Returns(RecordSaveJson(Output, TypeInfo(TAgendaOutput)), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
end;

procedure TAgendaEndpointController.HandleException(Ctxt: TRestServerUriContext; E: Exception);
begin
  if E is EAgendaValidation then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_BADREQUEST)
  else if E is EAgendaNotFound then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_NOTFOUND)
  else
    Ctxt.Error(E, 'Erro ao processar Agenda', [], HTTP_SERVERERROR);
end;

procedure TAgendaEndpointController.Handle(Ctxt: TRestServerUriContext);
begin
  try
    case Ctxt.Method of
      mGET:
        HandleGet(Ctxt);
      mPOST:
        HandleCreate(Ctxt);
      mPUT:
        HandleUpdate(Ctxt);
      mDELETE:
        HandleDelete(Ctxt);
    else
      Ctxt.Error('Metodo nao permitido para Agenda', HTTP_NOTALLOWED);
    end;
  except
    on E: Exception do
      HandleException(Ctxt, E);
  end;
end;

constructor TAgendaController.CreateInMemory(const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmAgenda], {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TAgendaEndpointController.Create(Orm);
  OnBeforeUri := RouteAgenda;
end;

constructor TAgendaController.CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmAgenda], ADbFileName, {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TAgendaEndpointController.Create(Orm);
  OnBeforeUri := RouteAgenda;
end;

destructor TAgendaController.Destroy;
begin
  FEndpoint.Free;
  inherited Destroy;
end;

function TAgendaController.RouteAgenda(Ctxt: TRestServerUriContext): Boolean;
begin
  Result := Ctxt.Table <> TOrmAgenda;
  if not Result then
    FEndpoint.Handle(Ctxt);
end;

end.
