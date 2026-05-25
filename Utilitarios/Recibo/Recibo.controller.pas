unit Recibo.controller;

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
  Recibo.repository,
  Recibo.service;

type
  TReciboEndpointController = class
  private
    FRepository: TReciboRepository;
    FService: TReciboService;
    function LoadInput(const AJson: RawUtf8; out AInput: TReciboInput): Boolean;
    function OutputJson(const AOutput: TReciboOutput): RawUtf8;
    function OutputListJson(const AItems: TReciboOutputDynArray): RawUtf8;
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

  TReciboController = class(TRestServerDB)
  private
    FEndpoint: TReciboEndpointController;
    function RouteRecibo(Ctxt: TRestServerUriContext): Boolean;
  public
    constructor CreateInMemory(const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8 = 'api'); reintroduce;
    destructor Destroy; override;
  end;

implementation

constructor TReciboEndpointController.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  FRepository := TReciboRepository.Create(AOrm);
  FService := TReciboService.Create(FRepository);
end;

destructor TReciboEndpointController.Destroy;
begin
  FService.Free;
  FRepository.Free;
  inherited Destroy;
end;

function TReciboEndpointController.LoadInput(const AJson: RawUtf8;
  out AInput: TReciboInput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..3] of TValuePUtf8Char;
begin
  FillChar(AInput, SizeOf(AInput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['Data', 'Recebedor', 'Referente', 'Valor'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    AInput.Data := Values[0].Iso8601ToDateTime;
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AInput.Recebedor);
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AInput.Referente);
  if Values[3].Text <> nil then
    AInput.Valor := Values[3].ToDouble;
end;

function TReciboEndpointController.OutputJson(const AOutput: TReciboOutput): RawUtf8;
begin
  Result := JsonEncode([
    'IDRecibo', AOutput.IDRecibo,
    'Data', DateTimeToIso8601Text(AOutput.Data),
    'Recebedor', AOutput.Recebedor,
    'Referente', AOutput.Referente,
    'Valor', Double(AOutput.Valor),
    'ValorExtenso', AOutput.ValorExtenso]);
end;

function TReciboEndpointController.OutputListJson(const AItems: TReciboOutputDynArray): RawUtf8;
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

function TReciboEndpointController.RequestId(Ctxt: TRestServerUriContext): TID;
begin
  Result := Ctxt.InputIntOrVoid['id'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['ID'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['IDRECIBO'];
end;

procedure TReciboEndpointController.HandleCreate(Ctxt: TRestServerUriContext);
var
  Input: TReciboInput;
  Output: TReciboOutput;
begin
  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Recibo', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.CreateItem(Input);
  Ctxt.Returns(OutputJson(Output), HTTP_CREATED, JSON_CONTENT_TYPE_HEADER);
end;

procedure TReciboEndpointController.HandleDelete(Ctxt: TRestServerUriContext);
var
  Id: TID;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDRECIBO e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  FService.DeleteItem(Id);
  Ctxt.Success(HTTP_NOCONTENT);
end;

procedure TReciboEndpointController.HandleGet(Ctxt: TRestServerUriContext);
var
  Id: TID;
  Item: TReciboOutput;
  Items: TReciboOutputDynArray;
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

procedure TReciboEndpointController.HandleUpdate(Ctxt: TRestServerUriContext);
var
  Id: TID;
  Input: TReciboInput;
  Output: TReciboOutput;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDRECIBO e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Recibo', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.UpdateItem(Id, Input);
  Ctxt.Returns(OutputJson(Output), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
end;

procedure TReciboEndpointController.HandleException(Ctxt: TRestServerUriContext; E: Exception);
begin
  if E is EReciboValidation then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_BADREQUEST)
  else if E is EReciboNotFound then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_NOTFOUND)
  else
    Ctxt.Error(E, 'Erro ao processar Recibo', [], HTTP_SERVERERROR);
end;

procedure TReciboEndpointController.Handle(Ctxt: TRestServerUriContext);
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
      Ctxt.Error('Metodo nao permitido para Recibo', HTTP_NOTALLOWED);
    end;
  except
    on E: Exception do
      HandleException(Ctxt, E);
  end;
end;

constructor TReciboController.CreateInMemory(const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmRecibo], {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TReciboEndpointController.Create(Orm);
  OnBeforeUri := RouteRecibo;
end;

constructor TReciboController.CreateWithDatabase(const ADbFileName: TFileName; const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmRecibo], ADbFileName, {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TReciboEndpointController.Create(Orm);
  OnBeforeUri := RouteRecibo;
end;

destructor TReciboController.Destroy;
begin
  FEndpoint.Free;
  inherited Destroy;
end;

function TReciboController.RouteRecibo(Ctxt: TRestServerUriContext): Boolean;
begin
  Result := Ctxt.Table <> TOrmRecibo;
  if not Result then
    FEndpoint.Handle(Ctxt);
end;

end.
