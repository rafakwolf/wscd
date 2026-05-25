unit Vendedor.controller;

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
  Vendedor.repository,
  Vendedor.service;

type
  TVendedorEndpointController = class
  private
    FRepository: TVendedorRepository;
    FService: TVendedorService;
    function LoadInput(const AJson: RawUtf8; out AInput: TVendedorInput): boolean;
    function OutputJson(const AOutput: TVendedorOutput): RawUtf8;
    function OutputListJson(const AItems: TVendedorOutputDynArray): RawUtf8;
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

  TVendedorController = class(TRestServerDB)
  private
    FEndpoint: TVendedorEndpointController;
    function RouteVendedor(Ctxt: TRestServerUriContext): boolean;
  public
    constructor CreateInMemory(const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithDatabase(const ADbFileName: TFileName;
      const ARoot: RawUtf8 = 'api'); reintroduce;
    destructor Destroy; override;
  end;

implementation

constructor TVendedorEndpointController.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  FRepository := TVendedorRepository.Create(AOrm);
  FService := TVendedorService.Create(FRepository);
end;

destructor TVendedorEndpointController.Destroy;
begin
  FService.Free;
  FRepository.Free;
  inherited Destroy;
end;

function TVendedorEndpointController.LoadInput(const AJson: RawUtf8;
  out AInput: TVendedorInput): boolean;
var
  Body: RawUtf8;
  Values: array[0..1] of TValuePUtf8Char;
begin
  FillChar(AInput, SizeOf(AInput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)), ['Vendedor', 'Ativo'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    Values[0].ToUtf8(AInput.Vendedor);
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AInput.Ativo);
end;

function TVendedorEndpointController.OutputJson(const AOutput: TVendedorOutput): RawUtf8;
begin
  Result := JsonEncode([
    'IDVendedor', AOutput.IDVendedor,
    'Vendedor', AOutput.Vendedor,
    'Ativo', AOutput.Ativo]);
end;

function TVendedorEndpointController.OutputListJson(const AItems: TVendedorOutputDynArray): RawUtf8;
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

function TVendedorEndpointController.RequestId(Ctxt: TRestServerUriContext): TID;
begin
  Result := Ctxt.InputIntOrVoid['id'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['ID'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['IDVENDEDOR'];
end;

procedure TVendedorEndpointController.HandleCreate(Ctxt: TRestServerUriContext);
var
  Input: TVendedorInput;
  Output: TVendedorOutput;
begin
  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Vendedor', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.CreateItem(Input);
  Ctxt.Returns(OutputJson(Output), HTTP_CREATED, JSON_CONTENT_TYPE_HEADER);
end;

procedure TVendedorEndpointController.HandleDelete(Ctxt: TRestServerUriContext);
var
  Id: TID;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDVENDEDOR e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  FService.DeleteItem(Id);
  Ctxt.Success(HTTP_NOCONTENT);
end;

procedure TVendedorEndpointController.HandleGet(Ctxt: TRestServerUriContext);
var
  Id: TID;
  Item: TVendedorOutput;
  Items: TVendedorOutputDynArray;
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

procedure TVendedorEndpointController.HandleUpdate(Ctxt: TRestServerUriContext);
var
  Id: TID;
  Input: TVendedorInput;
  Output: TVendedorOutput;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDVENDEDOR e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Vendedor', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.UpdateItem(Id, Input);
  Ctxt.Returns(OutputJson(Output), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
end;

procedure TVendedorEndpointController.HandleException(Ctxt: TRestServerUriContext;
  E: Exception);
begin
  if E is EVendedorValidation then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_BADREQUEST)
  else if E is EVendedorNotFound then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_NOTFOUND)
  else
    Ctxt.Error(E, 'Erro ao processar Vendedor', [], HTTP_SERVERERROR);
end;

procedure TVendedorEndpointController.Handle(Ctxt: TRestServerUriContext);
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
        Ctxt.Error('Metodo nao permitido para Vendedor', HTTP_NOTALLOWED);
    end;
  except
    on E: Exception do
      HandleException(Ctxt, E);
  end;
end;

constructor TVendedorController.CreateInMemory(const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmVendedor], {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TVendedorEndpointController.Create(Orm);
  OnBeforeUri := RouteVendedor;
end;

constructor TVendedorController.CreateWithDatabase(const ADbFileName: TFileName;
  const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmVendedor], ADbFileName,
    {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TVendedorEndpointController.Create(Orm);
  OnBeforeUri := RouteVendedor;
end;

destructor TVendedorController.Destroy;
begin
  FEndpoint.Free;
  inherited Destroy;
end;

function TVendedorController.RouteVendedor(Ctxt: TRestServerUriContext): boolean;
begin
  Result := Ctxt.Table <> TOrmVendedor;
  if not Result then
    FEndpoint.Handle(Ctxt);
end;

end.
