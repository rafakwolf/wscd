unit Recibo.controller;

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
  Recibo.repository,
  Recibo.service;

type
  TReciboEndpointController = class
  private
    FRepository: TReciboRepository;
    FService: TReciboService;
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

function TReciboEndpointController.RequestId(Ctxt: TRestServerUriContext): TID;
begin
  Result := Ctxt.InputInt['id'];
  if Result = 0 then
    Result := Ctxt.InputInt['ID'];
  if Result = 0 then
    Result := Ctxt.InputInt['IDRECIBO'];
end;

procedure TReciboEndpointController.HandleCreate(Ctxt: TRestServerUriContext);
var
  Input: TReciboInput;
  Output: TReciboOutput;
begin
  FillChar(Input, SizeOf(Input), 0);
  if not RecordLoadJson(Input, Ctxt.Call.InBody, TypeInfo(TReciboInput)) then
  begin
    Ctxt.Error('JSON invalido para Recibo', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.CreateItem(Input);
  Ctxt.Returns(RecordSaveJson(Output, TypeInfo(TReciboOutput)), HTTP_CREATED, JSON_CONTENT_TYPE_HEADER);
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
    Ctxt.Returns(RecordSaveJson(Item, TypeInfo(TReciboOutput)), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
  end
  else
  begin
    Items := FService.ListItems;
    Ctxt.Returns(DynArraySaveJson(Items, TypeInfo(TReciboOutputDynArray)), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
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

  FillChar(Input, SizeOf(Input), 0);
  if not RecordLoadJson(Input, Ctxt.Call.InBody, TypeInfo(TReciboInput)) then
  begin
    Ctxt.Error('JSON invalido para Recibo', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.UpdateItem(Id, Input);
  Ctxt.Returns(RecordSaveJson(Output, TypeInfo(TReciboOutput)), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
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
