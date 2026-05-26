unit Fornecedor.controller;

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
  Fornecedor.repository,
  Fornecedor.service;

type
  TFornecedorEndpointController = class
  private
    FRepository: TFornecedorRepository;
    FService: TFornecedorService;
    function DateJson(AValue: TDateTime): RawUtf8;
    function LoadInput(const AJson: RawUtf8; out AInput: TFornecedorInput): Boolean;
    function OutputJson(const AOutput: TFornecedorOutput): RawUtf8;
    function OutputListJson(const AItems: TFornecedorOutputDynArray): RawUtf8;
    function RequestCidade(Ctxt: TRestServerUriContext): Int64;
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

  TFornecedorController = class(TRestServerDB)
  private
    FEndpoint: TFornecedorEndpointController;
    function RouteFornecedor(Ctxt: TRestServerUriContext): Boolean;
  public
    constructor CreateInMemory(const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithDatabase(const ADbFileName: TFileName;
      const ARoot: RawUtf8 = 'api'); reintroduce;
    destructor Destroy; override;
  end;

implementation

constructor TFornecedorEndpointController.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  FRepository := TFornecedorRepository.Create(AOrm);
  FService := TFornecedorService.Create(FRepository);
end;

destructor TFornecedorEndpointController.Destroy;
begin
  FService.Free;
  FRepository.Free;
  inherited Destroy;
end;

function TFornecedorEndpointController.DateJson(AValue: TDateTime): RawUtf8;
begin
  if AValue <= 0 then
    Result := ''
  else
    Result := DateTimeToIso8601Text(AValue);
end;

function TFornecedorEndpointController.LoadInput(const AJson: RawUtf8;
  out AInput: TFornecedorInput): Boolean;
var
  Body: RawUtf8;
  Text: RawUtf8;
  Values: array[0..17] of TValuePUtf8Char;
begin
  FillChar(AInput, SizeOf(AInput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['Fantazia', 'RazaoSocial', 'DataCad', 'Endereco', 'Cidade', 'Bairro',
     'Cnpj', 'Ie', 'Cep', 'Telefone', 'Fax', 'Email', 'Uf', 'Obs',
     'Vendedor', 'TelefoneVendedor', 'EmailVendedor', 'Tipo'], @Values) <> nil;
  if not Result then
    Exit;

  if Values[0].Text <> nil then
    Values[0].ToUtf8(AInput.Fantazia);
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AInput.RazaoSocial);
  if Values[2].Text <> nil then
  begin
    Values[2].ToUtf8(Text);
    if Text <> '' then
      AInput.DataCad := Values[2].Iso8601ToDateTime;
  end;
  if Values[3].Text <> nil then
    Values[3].ToUtf8(AInput.Endereco);
  if Values[4].Text <> nil then
    AInput.Cidade := Values[4].ToInt64;
  if Values[5].Text <> nil then
    Values[5].ToUtf8(AInput.Bairro);
  if Values[6].Text <> nil then
    Values[6].ToUtf8(AInput.Cnpj);
  if Values[7].Text <> nil then
    Values[7].ToUtf8(AInput.Ie);
  if Values[8].Text <> nil then
    Values[8].ToUtf8(AInput.Cep);
  if Values[9].Text <> nil then
    Values[9].ToUtf8(AInput.Telefone);
  if Values[10].Text <> nil then
    Values[10].ToUtf8(AInput.Fax);
  if Values[11].Text <> nil then
    Values[11].ToUtf8(AInput.Email);
  if Values[12].Text <> nil then
    Values[12].ToUtf8(AInput.Uf);
  if Values[13].Text <> nil then
    Values[13].ToUtf8(AInput.Obs);
  if Values[14].Text <> nil then
    Values[14].ToUtf8(AInput.Vendedor);
  if Values[15].Text <> nil then
    Values[15].ToUtf8(AInput.TelefoneVendedor);
  if Values[16].Text <> nil then
    Values[16].ToUtf8(AInput.EmailVendedor);
  if Values[17].Text <> nil then
    Values[17].ToUtf8(AInput.Tipo);
end;

function TFornecedorEndpointController.OutputJson(
  const AOutput: TFornecedorOutput): RawUtf8;
begin
  Result := JsonEncode([
    'IDFornecedor', AOutput.IDFornecedor,
    'Fantazia', AOutput.Fantazia,
    'RazaoSocial', AOutput.RazaoSocial,
    'DataCad', DateJson(AOutput.DataCad),
    'Endereco', AOutput.Endereco,
    'Cidade', AOutput.Cidade,
    'Bairro', AOutput.Bairro,
    'Cnpj', AOutput.Cnpj,
    'Ie', AOutput.Ie,
    'Cep', AOutput.Cep,
    'Telefone', AOutput.Telefone,
    'Fax', AOutput.Fax,
    'Email', AOutput.Email,
    'Uf', AOutput.Uf,
    'Obs', AOutput.Obs,
    'Vendedor', AOutput.Vendedor,
    'TelefoneVendedor', AOutput.TelefoneVendedor,
    'EmailVendedor', AOutput.EmailVendedor,
    'Tipo', AOutput.Tipo]);
end;

function TFornecedorEndpointController.OutputListJson(
  const AItems: TFornecedorOutputDynArray): RawUtf8;
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

function TFornecedorEndpointController.RequestCidade(
  Ctxt: TRestServerUriContext): Int64;
begin
  Result := Ctxt.InputIntOrVoid['cidade'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['Cidade'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['codcidade'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['CODCIDADE'];
end;

function TFornecedorEndpointController.RequestId(
  Ctxt: TRestServerUriContext): TID;
begin
  Result := Ctxt.InputIntOrVoid['id'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['ID'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['IDFORNECEDOR'];
end;

procedure TFornecedorEndpointController.HandleCreate(
  Ctxt: TRestServerUriContext);
var
  Input: TFornecedorInput;
  Output: TFornecedorOutput;
begin
  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Fornecedor', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.CreateItem(Input);
  Ctxt.Returns(OutputJson(Output), HTTP_CREATED, JSON_CONTENT_TYPE_HEADER);
end;

procedure TFornecedorEndpointController.HandleDelete(
  Ctxt: TRestServerUriContext);
var
  Id: TID;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDFORNECEDOR e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  FService.DeleteItem(Id);
  Ctxt.Success(HTTP_NOCONTENT);
end;

procedure TFornecedorEndpointController.HandleGet(Ctxt: TRestServerUriContext);
var
  Cidade: Int64;
  Id: TID;
  Item: TFornecedorOutput;
  Items: TFornecedorOutputDynArray;
begin
  Id := RequestId(Ctxt);
  if Id > 0 then
  begin
    Item := FService.GetItem(Id);
    Ctxt.Returns(OutputJson(Item), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
  end
  else
  begin
    Cidade := RequestCidade(Ctxt);
    Items := FService.ListItems(Cidade);
    Ctxt.Returns(OutputListJson(Items), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
  end;
end;

procedure TFornecedorEndpointController.HandleUpdate(
  Ctxt: TRestServerUriContext);
var
  Id: TID;
  Input: TFornecedorInput;
  Output: TFornecedorOutput;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDFORNECEDOR e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Fornecedor', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.UpdateItem(Id, Input);
  Ctxt.Returns(OutputJson(Output), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
end;

procedure TFornecedorEndpointController.HandleException(
  Ctxt: TRestServerUriContext; E: Exception);
begin
  if E is EFornecedorValidation then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_BADREQUEST)
  else if E is EFornecedorNotFound then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_NOTFOUND)
  else
    Ctxt.Error(E, 'Erro ao processar Fornecedor', [], HTTP_SERVERERROR);
end;

procedure TFornecedorEndpointController.Handle(Ctxt: TRestServerUriContext);
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
        Ctxt.Error('Metodo nao permitido para Fornecedor', HTTP_NOTALLOWED);
    end;
  except
    on E: Exception do
      HandleException(Ctxt, E);
  end;
end;

constructor TFornecedorController.CreateInMemory(const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmFornecedor],
    {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TFornecedorEndpointController.Create(Orm);
  OnBeforeUri := RouteFornecedor;
end;

constructor TFornecedorController.CreateWithDatabase(
  const ADbFileName: TFileName; const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmFornecedor], ADbFileName,
    {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TFornecedorEndpointController.Create(Orm);
  OnBeforeUri := RouteFornecedor;
end;

destructor TFornecedorController.Destroy;
begin
  FEndpoint.Free;
  inherited Destroy;
end;

function TFornecedorController.RouteFornecedor(
  Ctxt: TRestServerUriContext): Boolean;
begin
  Result := Ctxt.Table <> TOrmFornecedor;
  if not Result then
    FEndpoint.Handle(Ctxt);
end;

end.
