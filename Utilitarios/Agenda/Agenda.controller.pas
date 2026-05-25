unit Agenda.controller;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.datetime,
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
    function LoadInput(const AJson: RawUtf8; out AInput: TAgendaInput): Boolean;
    function OutputJson(const AOutput: TAgendaOutput): RawUtf8;
    function OutputListJson(const AItems: TAgendaOutputDynArray): RawUtf8;
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

function TAgendaEndpointController.LoadInput(const AJson: RawUtf8;
  out AInput: TAgendaInput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..5] of TValuePUtf8Char;
begin
  FillChar(AInput, SizeOf(AInput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['Nome', 'Telefone', 'Telefone2', 'Telefone3', 'Fax', 'Obs'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    Values[0].ToUtf8(AInput.Nome);
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AInput.Telefone);
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AInput.Telefone2);
  if Values[3].Text <> nil then
    Values[3].ToUtf8(AInput.Telefone3);
  if Values[4].Text <> nil then
    Values[4].ToUtf8(AInput.Fax);
  if Values[5].Text <> nil then
    Values[5].ToUtf8(AInput.Obs);
end;

function TAgendaEndpointController.OutputJson(const AOutput: TAgendaOutput): RawUtf8;
begin
  Result := JsonEncode([
    'IDAgenda', AOutput.IDAgenda,
    'Nome', AOutput.Nome,
    'Telefone', AOutput.Telefone,
    'Telefone2', AOutput.Telefone2,
    'Telefone3', AOutput.Telefone3,
    'Fax', AOutput.Fax,
    'Obs', AOutput.Obs]);
end;

function TAgendaEndpointController.OutputListJson(const AItems: TAgendaOutputDynArray): RawUtf8;
var
  I: PtrInt;
begin
  Result := '[';
  for I := 0 to High(AItems) do
  begin
    if I > 0 then
      Result := Result + ',';
    Result := Result + OutputJson(AItems[I]);
  end;
  Result := Result + ']';
end;

function TAgendaEndpointController.RequestId(Ctxt: TRestServerUriContext): TID;
begin
  Result := Ctxt.InputIntOrVoid['id'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['ID'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['IDAGENDA'];
end;

procedure TAgendaEndpointController.HandleCreate(Ctxt: TRestServerUriContext);
var
  Input: TAgendaInput;
  Output: TAgendaOutput;
begin
  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Agenda', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.CreateItem(Input);
  Ctxt.Returns(OutputJson(Output), HTTP_CREATED, JSON_CONTENT_TYPE_HEADER);
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
    Ctxt.Returns(OutputJson(Item), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
  end
  else
  begin
    Items := FService.ListItems;
    Ctxt.Returns(OutputListJson(Items), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
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

  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Agenda', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.UpdateItem(Id, Input);
  Ctxt.Returns(OutputJson(Output), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
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
