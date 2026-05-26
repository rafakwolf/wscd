unit test_Cliente_controller;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  fpcunit,
  testregistry,
  mormot.core.base,
  mormot.core.datetime,
  mormot.core.json,
  mormot.core.os,
  mormot.core.text,
  mormot.core.unicode,
  mormot.rest.client,
  mormot.rest.sqlite3,
  Cliente.controller,
  Cliente.service;

type
  TClienteControllerTest = class(TTestCase)
  private
    FServer: TClienteController;
    FClient: TRestClientDB;
    function ClientePayload(const ANome, ACpfCnpj, ARgIe: RawUtf8;
      ACodCidade: Integer): RawUtf8;
    function CreateCliente(const ANome, ACpfCnpj, ARgIe: RawUtf8;
      ACodCidade: Integer): TClienteOutput;
    function LoadClienteOutput(const AJson: RawUtf8;
      out AOutput: TClienteOutput): Boolean;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure CreateReturnsCreatedPayload;
    procedure GetWithoutIdReturnsList;
    procedure GetWithCidadeFilterReturnsMatchingList;
    procedure GetReturnsPersistedPayload;
    procedure UpdateChangesPersistedPayload;
    procedure DeleteRemovesPayload;
    procedure InvalidPayloadReturnsValidationError;
    procedure DuplicateDocumentReturnsValidationError;
  end;

implementation

function TClienteControllerTest.ClientePayload(const ANome, ACpfCnpj,
  ARgIe: RawUtf8; ACodCidade: Integer): RawUtf8;
begin
  Result := FormatUtf8('{'#10 +
    '  "Tipo": "F",'#10 +
    '  "Nome": "%",'#10 +
    '  "Endereco": "Rua das Flores, 100",'#10 +
    '  "Cep": "85501-010",'#10 +
    '  "Bairro": "Centro",'#10 +
    '  "Telefone": "4635551071",'#10 +
    '  "CodCidade": %,'#10 +
    '  "Uf": "PR",'#10 +
    '  "DataNasc": "1990-01-10",'#10 +
    '  "CpfCnpj": "%",'#10 +
    '  "RgIe": "%",'#10 +
    '  "Limite": 150.75,'#10 +
    '  "Obs": "Cliente migrado do modulo Delphi"'#10 +
    '}', [ANome, ACodCidade, ACpfCnpj, ARgIe]);
end;

function TClienteControllerTest.CreateCliente(const ANome, ACpfCnpj,
  ARgIe: RawUtf8; ACodCidade: Integer): TClienteOutput;
var
  Response: RawUtf8;
  Status: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);
  Status := FClient.CallBack(mPOST, 'Cliente',
    ClientePayload(ANome, ACpfCnpj, ARgIe, ACodCidade), Response);
  CheckEquals(HTTP_CREATED, Status);
  CheckTrue(LoadClienteOutput(Response, Result));
  CheckTrue(Result.IDCliente > 0);
end;

function TClienteControllerTest.LoadClienteOutput(const AJson: RawUtf8;
  out AOutput: TClienteOutput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..8] of TValuePUtf8Char;
begin
  FillChar(AOutput, SizeOf(AOutput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['IDCliente', 'Tipo', 'Nome', 'CodCidade', 'DataNasc', 'CpfCnpj',
     'RgIe', 'Limite', 'Cadastro'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    AOutput.IDCliente := Values[0].ToInt64;
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AOutput.Tipo);
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AOutput.Nome);
  if Values[3].Text <> nil then
    AOutput.CodCidade := Values[3].ToInt64;
  if Values[4].Text <> nil then
    AOutput.DataNasc := Values[4].Iso8601ToDateTime;
  if Values[5].Text <> nil then
    Values[5].ToUtf8(AOutput.CpfCnpj);
  if Values[6].Text <> nil then
    Values[6].ToUtf8(AOutput.RgIe);
  if Values[7].Text <> nil then
    AOutput.Limite := Values[7].ToDouble;
  if Values[8].Text <> nil then
    AOutput.Cadastro := Values[8].Iso8601ToDateTime;
end;

procedure TClienteControllerTest.SetUp;
begin
  inherited SetUp;
  FServer := TClienteController.CreateInMemory('api');
  FClient := TRestClientDB.Create(FServer);
end;

procedure TClienteControllerTest.TearDown;
begin
  FClient.Free;
  FServer.Free;
  inherited TearDown;
end;

procedure TClienteControllerTest.CreateReturnsCreatedPayload;
var
  Created: TClienteOutput;
begin
  Created := CreateCliente('Cliente API', '11122233344', 'RG001', 10);
  CheckEquals('F', Utf8ToString(Created.Tipo));
  CheckEquals('Cliente API', Utf8ToString(Created.Nome));
  CheckEquals(10, Created.CodCidade);
  CheckTrue(Created.Cadastro > 0);
end;

procedure TClienteControllerTest.GetWithoutIdReturnsList;
var
  Response: RawUtf8;
begin
  CreateCliente('Cliente lista', '11122233345', 'RG002', 10);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Cliente', [], Response));
  CheckTrue(Pos('"Nome":"Cliente lista"', Utf8ToString(Response)) > 0);
end;

procedure TClienteControllerTest.GetWithCidadeFilterReturnsMatchingList;
var
  Response: RawUtf8;
begin
  CreateCliente('Cliente cidade 10', '11122233346', 'RG003', 10);
  CreateCliente('Cliente cidade 20', '11122233347', 'RG004', 20);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Cliente',
    ['codCidade', 10], Response));
  CheckTrue(Pos('"Nome":"Cliente cidade 10"', Utf8ToString(Response)) > 0);
  CheckEquals(0, Pos('"Nome":"Cliente cidade 20"', Utf8ToString(Response)));
end;

procedure TClienteControllerTest.GetReturnsPersistedPayload;
var
  Created: TClienteOutput;
  Found: TClienteOutput;
  Response: RawUtf8;
begin
  Created := CreateCliente('Cliente consulta', '11122233348', 'RG005', 11);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Cliente',
    ['id', Created.IDCliente], Response));
  CheckTrue(LoadClienteOutput(Response, Found));
  CheckEquals(Created.IDCliente, Found.IDCliente);
  CheckEquals('Cliente consulta', Utf8ToString(Found.Nome));
end;

procedure TClienteControllerTest.UpdateChangesPersistedPayload;
var
  Created: TClienteOutput;
  Updated: TClienteOutput;
  Response: RawUtf8;
begin
  Created := CreateCliente('Cliente antigo', '11122233349', 'RG006', 12);

  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT,
    'Cliente?id=' + Int64ToUtf8(Created.IDCliente),
    ClientePayload('Cliente atualizado', '11122233349', 'RG006', 13), Response));
  CheckTrue(LoadClienteOutput(Response, Updated));
  CheckEquals(Created.IDCliente, Updated.IDCliente);
  CheckEquals('Cliente atualizado', Utf8ToString(Updated.Nome));
  CheckEquals(13, Updated.CodCidade);
end;

procedure TClienteControllerTest.DeleteRemovesPayload;
var
  Created: TClienteOutput;
  Response: RawUtf8;
begin
  Created := CreateCliente('Cliente excluir', '11122233350', 'RG007', 14);

  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE,
    'Cliente?id=' + Int64ToUtf8(Created.IDCliente), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Cliente',
    ['id', Created.IDCliente], Response));
end;

procedure TClienteControllerTest.InvalidPayloadReturnsValidationError;
var
  Response: RawUtf8;
begin
  CheckEquals(HTTP_BADREQUEST, FClient.CallBack(mPOST, 'Cliente',
    ClientePayload('', '11122233351', 'RG008', 15), Response));
end;

procedure TClienteControllerTest.DuplicateDocumentReturnsValidationError;
var
  Response: RawUtf8;
begin
  CreateCliente('Cliente original', '11122233352', 'RG009', 16);
  CheckEquals(HTTP_BADREQUEST, FClient.CallBack(mPOST, 'Cliente',
    ClientePayload('Cliente duplicado', '11122233352', 'RG010', 16), Response));
end;

initialization
  RegisterTest(TClienteControllerTest);

end.
