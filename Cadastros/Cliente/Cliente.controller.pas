unit Cliente.controller;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.buffers,
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
  Cliente.repository,
  Cliente.service;

type
  TClienteEndpointController = class
  private
    FRepository: TClienteRepository;
    FService: TClienteService;
    function DateJson(AValue: TDateTime): RawUtf8;
    function LoadInput(const AJson: RawUtf8; out AInput: TClienteInput): Boolean;
    function OutputJson(const AOutput: TClienteOutput): RawUtf8;
    function OutputListJson(const AItems: TClienteOutputDynArray): RawUtf8;
    function RequestCodCidade(Ctxt: TRestServerUriContext): Int64;
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

  TClienteController = class(TRestServerDB)
  private
    FEndpoint: TClienteEndpointController;
    function RouteCliente(Ctxt: TRestServerUriContext): Boolean;
  public
    constructor CreateInMemory(const ARoot: RawUtf8 = 'api'); reintroduce;
    constructor CreateWithDatabase(const ADbFileName: TFileName;
      const ARoot: RawUtf8 = 'api'); reintroduce;
    destructor Destroy; override;
  end;

implementation

constructor TClienteEndpointController.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  FRepository := TClienteRepository.Create(AOrm);
  FService := TClienteService.Create(FRepository);
end;

destructor TClienteEndpointController.Destroy;
begin
  FService.Free;
  FRepository.Free;
  inherited Destroy;
end;

function TClienteEndpointController.DateJson(AValue: TDateTime): RawUtf8;
begin
  if AValue <= 0 then
    Result := ''
  else
    Result := DateTimeToIso8601Text(AValue);
end;

function TClienteEndpointController.LoadInput(const AJson: RawUtf8;
  out AInput: TClienteInput): Boolean;
var
  Body: RawUtf8;
  FotoBase64: RawUtf8;
  Text: RawUtf8;
  Values: array[0..31] of TValuePUtf8Char;
begin
  FillChar(AInput, SizeOf(AInput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['Tipo', 'Nome', 'Endereco', 'Cep', 'Bairro', 'Telefone', 'Fax',
     'CodCidade', 'Uf', 'TempoMoradia', 'EndAnterior', 'Email', 'Trabalho',
     'Cargo', 'DataInicio', 'Salario', 'EstadoCivil', 'Conjugue',
     'LocalTrab', 'DataNasc', 'Pai', 'Mae', 'CpfCnpj', 'RgIe', 'ReferPes',
     'ReferCom', 'FoneCom', 'Cadastro', 'Obs', 'Naturalidade', 'Limite',
     'Foto'], @Values) <> nil;
  if not Result then
    Exit;

  if Values[0].Text <> nil then
    Values[0].ToUtf8(AInput.Tipo);
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AInput.Nome);
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AInput.Endereco);
  if Values[3].Text <> nil then
    Values[3].ToUtf8(AInput.Cep);
  if Values[4].Text <> nil then
    Values[4].ToUtf8(AInput.Bairro);
  if Values[5].Text <> nil then
    Values[5].ToUtf8(AInput.Telefone);
  if Values[6].Text <> nil then
    Values[6].ToUtf8(AInput.Fax);
  if Values[7].Text <> nil then
    AInput.CodCidade := Values[7].ToInt64;
  if Values[8].Text <> nil then
    Values[8].ToUtf8(AInput.Uf);
  if Values[9].Text <> nil then
    Values[9].ToUtf8(AInput.TempoMoradia);
  if Values[10].Text <> nil then
    Values[10].ToUtf8(AInput.EndAnterior);
  if Values[11].Text <> nil then
    Values[11].ToUtf8(AInput.Email);
  if Values[12].Text <> nil then
    Values[12].ToUtf8(AInput.Trabalho);
  if Values[13].Text <> nil then
    Values[13].ToUtf8(AInput.Cargo);
  if Values[14].Text <> nil then
  begin
    Values[14].ToUtf8(Text);
    if Text <> '' then
      AInput.DataInicio := Values[14].Iso8601ToDateTime;
  end;
  if Values[15].Text <> nil then
    AInput.Salario := Values[15].ToDouble;
  if Values[16].Text <> nil then
    Values[16].ToUtf8(AInput.EstadoCivil);
  if Values[17].Text <> nil then
    Values[17].ToUtf8(AInput.Conjugue);
  if Values[18].Text <> nil then
    Values[18].ToUtf8(AInput.LocalTrab);
  if Values[19].Text <> nil then
  begin
    Values[19].ToUtf8(Text);
    if Text <> '' then
      AInput.DataNasc := Values[19].Iso8601ToDateTime;
  end;
  if Values[20].Text <> nil then
    Values[20].ToUtf8(AInput.Pai);
  if Values[21].Text <> nil then
    Values[21].ToUtf8(AInput.Mae);
  if Values[22].Text <> nil then
    Values[22].ToUtf8(AInput.CpfCnpj);
  if Values[23].Text <> nil then
    Values[23].ToUtf8(AInput.RgIe);
  if Values[24].Text <> nil then
    Values[24].ToUtf8(AInput.ReferPes);
  if Values[25].Text <> nil then
    Values[25].ToUtf8(AInput.ReferCom);
  if Values[26].Text <> nil then
    Values[26].ToUtf8(AInput.FoneCom);
  if Values[27].Text <> nil then
  begin
    Values[27].ToUtf8(Text);
    if Text <> '' then
      AInput.Cadastro := Values[27].Iso8601ToDateTime;
  end;
  if Values[28].Text <> nil then
    Values[28].ToUtf8(AInput.Obs);
  if Values[29].Text <> nil then
    Values[29].ToUtf8(AInput.Naturalidade);
  if Values[30].Text <> nil then
    AInput.Limite := Values[30].ToDouble;
  if Values[31].Text <> nil then
  begin
    Values[31].ToUtf8(FotoBase64);
    if FotoBase64 <> '' then
      AInput.Foto := Base64ToBin(FotoBase64);
  end;
end;

function TClienteEndpointController.OutputJson(
  const AOutput: TClienteOutput): RawUtf8;
begin
  Result := JsonEncode([
    'IDCliente', AOutput.IDCliente,
    'Tipo', AOutput.Tipo,
    'Nome', AOutput.Nome,
    'Endereco', AOutput.Endereco,
    'Cep', AOutput.Cep,
    'Bairro', AOutput.Bairro,
    'Telefone', AOutput.Telefone,
    'Fax', AOutput.Fax,
    'CodCidade', AOutput.CodCidade,
    'Uf', AOutput.Uf,
    'TempoMoradia', AOutput.TempoMoradia,
    'EndAnterior', AOutput.EndAnterior,
    'Email', AOutput.Email,
    'Trabalho', AOutput.Trabalho,
    'Cargo', AOutput.Cargo,
    'DataInicio', DateJson(AOutput.DataInicio),
    'Salario', Double(AOutput.Salario),
    'EstadoCivil', AOutput.EstadoCivil,
    'Conjugue', AOutput.Conjugue,
    'LocalTrab', AOutput.LocalTrab,
    'DataNasc', DateJson(AOutput.DataNasc),
    'Pai', AOutput.Pai,
    'Mae', AOutput.Mae,
    'CpfCnpj', AOutput.CpfCnpj,
    'RgIe', AOutput.RgIe,
    'ReferPes', AOutput.ReferPes,
    'ReferCom', AOutput.ReferCom,
    'FoneCom', AOutput.FoneCom,
    'Cadastro', DateJson(AOutput.Cadastro),
    'Obs', AOutput.Obs,
    'Naturalidade', AOutput.Naturalidade,
    'Limite', Double(AOutput.Limite),
    'Foto', BinToBase64(AOutput.Foto)]);
end;

function TClienteEndpointController.OutputListJson(
  const AItems: TClienteOutputDynArray): RawUtf8;
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

function TClienteEndpointController.RequestCodCidade(
  Ctxt: TRestServerUriContext): Int64;
begin
  Result := Ctxt.InputIntOrVoid['codCidade'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['CodCidade'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['CODCIDADE'];
end;

function TClienteEndpointController.RequestId(Ctxt: TRestServerUriContext): TID;
begin
  Result := Ctxt.InputIntOrVoid['id'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['ID'];
  if Result = 0 then
    Result := Ctxt.InputIntOrVoid['IDCLIENTE'];
end;

procedure TClienteEndpointController.HandleCreate(Ctxt: TRestServerUriContext);
var
  Input: TClienteInput;
  Output: TClienteOutput;
begin
  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Cliente', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.CreateItem(Input);
  Ctxt.Returns(OutputJson(Output), HTTP_CREATED, JSON_CONTENT_TYPE_HEADER);
end;

procedure TClienteEndpointController.HandleDelete(Ctxt: TRestServerUriContext);
var
  Id: TID;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDCLIENTE e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  FService.DeleteItem(Id);
  Ctxt.Success(HTTP_NOCONTENT);
end;

procedure TClienteEndpointController.HandleGet(Ctxt: TRestServerUriContext);
var
  CodCidade: Int64;
  Id: TID;
  Item: TClienteOutput;
  Items: TClienteOutputDynArray;
begin
  Id := RequestId(Ctxt);
  if Id > 0 then
  begin
    Item := FService.GetItem(Id);
    Ctxt.Returns(OutputJson(Item), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
  end
  else
  begin
    CodCidade := RequestCodCidade(Ctxt);
    Items := FService.ListItems(CodCidade);
    Ctxt.Returns(OutputListJson(Items), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
  end;
end;

procedure TClienteEndpointController.HandleUpdate(Ctxt: TRestServerUriContext);
var
  Id: TID;
  Input: TClienteInput;
  Output: TClienteOutput;
begin
  Id := RequestId(Ctxt);
  if Id <= 0 then
  begin
    Ctxt.Error('IDCLIENTE e obrigatorio', HTTP_BADREQUEST);
    Exit;
  end;

  if not LoadInput(Ctxt.Call.InBody, Input) then
  begin
    Ctxt.Error('JSON invalido para Cliente', HTTP_BADREQUEST);
    Exit;
  end;

  Output := FService.UpdateItem(Id, Input);
  Ctxt.Returns(OutputJson(Output), HTTP_SUCCESS, JSON_CONTENT_TYPE_HEADER);
end;

procedure TClienteEndpointController.HandleException(
  Ctxt: TRestServerUriContext; E: Exception);
begin
  if E is EClienteValidation then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_BADREQUEST)
  else if E is EClienteNotFound then
    Ctxt.Error(StringToUtf8(E.Message), HTTP_NOTFOUND)
  else
    Ctxt.Error(E, 'Erro ao processar Cliente', [], HTTP_SERVERERROR);
end;

procedure TClienteEndpointController.Handle(Ctxt: TRestServerUriContext);
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
        Ctxt.Error('Metodo nao permitido para Cliente', HTTP_NOTALLOWED);
    end;
  except
    on E: Exception do
      HandleException(Ctxt, E);
  end;
end;

constructor TClienteController.CreateInMemory(const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmCliente], {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TClienteEndpointController.Create(Orm);
  OnBeforeUri := RouteCliente;
end;

constructor TClienteController.CreateWithDatabase(const ADbFileName: TFileName;
  const ARoot: RawUtf8);
begin
  inherited CreateWithOwnModel([TOrmCliente], ADbFileName,
    {HandleUserAuthentication=}False, ARoot);
  Server.CreateMissingTables;
  FEndpoint := TClienteEndpointController.Create(Orm);
  OnBeforeUri := RouteCliente;
end;

destructor TClienteController.Destroy;
begin
  FEndpoint.Free;
  inherited Destroy;
end;

function TClienteController.RouteCliente(Ctxt: TRestServerUriContext): Boolean;
begin
  Result := Ctxt.Table <> TOrmCliente;
  if not Result then
    FEndpoint.Handle(Ctxt);
end;

end.
