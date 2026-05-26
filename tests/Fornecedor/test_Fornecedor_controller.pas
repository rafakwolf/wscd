unit test_Fornecedor_controller;

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
  Fornecedor.controller,
  Fornecedor.service;

type
  TFornecedorControllerTest = class(TTestCase)
  private
    FServer: TFornecedorController;
    FClient: TRestClientDB;
    function FornecedorPayload(const ARazaoSocial, ACnpj: RawUtf8;
      ACidade: Integer): RawUtf8;
    function CreateFornecedor(const ARazaoSocial, ACnpj: RawUtf8;
      ACidade: Integer): TFornecedorOutput;
    function LoadFornecedorOutput(const AJson: RawUtf8;
      out AOutput: TFornecedorOutput): Boolean;
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
    procedure DuplicateCnpjReturnsValidationError;
  end;

implementation

function TFornecedorControllerTest.FornecedorPayload(const ARazaoSocial,
  ACnpj: RawUtf8; ACidade: Integer): RawUtf8;
begin
  Result := FormatUtf8('{'#10 +
    '  "Fantazia": "% Fantasia",'#10 +
    '  "RazaoSocial": "%",'#10 +
    '  "DataCad": "2026-05-25",'#10 +
    '  "Endereco": "Rua Industrial, 100",'#10 +
    '  "Cidade": %,'#10 +
    '  "Bairro": "Centro",'#10 +
    '  "Cnpj": "%",'#10 +
    '  "Ie": "IE001",'#10 +
    '  "Cep": "85501-010",'#10 +
    '  "Telefone": "4635551071",'#10 +
    '  "Email": "fornecedor@example.com",'#10 +
    '  "Uf": "pr",'#10 +
    '  "Obs": "Fornecedor migrado do modulo Delphi",'#10 +
    '  "Vendedor": "Representante API",'#10 +
    '  "TelefoneVendedor": "46999990000",'#10 +
    '  "EmailVendedor": "representante@example.com",'#10 +
    '  "Tipo": "J"'#10 +
    '}', [ARazaoSocial, ARazaoSocial, ACidade, ACnpj]);
end;

function TFornecedorControllerTest.CreateFornecedor(const ARazaoSocial,
  ACnpj: RawUtf8; ACidade: Integer): TFornecedorOutput;
var
  Response: RawUtf8;
  Status: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);
  Status := FClient.CallBack(mPOST, 'Fornecedor',
    FornecedorPayload(ARazaoSocial, ACnpj, ACidade), Response);
  CheckEquals(HTTP_CREATED, Status);
  CheckTrue(LoadFornecedorOutput(Response, Result));
  CheckTrue(Result.IDFornecedor > 0);
end;

function TFornecedorControllerTest.LoadFornecedorOutput(const AJson: RawUtf8;
  out AOutput: TFornecedorOutput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..7] of TValuePUtf8Char;
begin
  FillChar(AOutput, SizeOf(AOutput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['IDFornecedor', 'Fantazia', 'RazaoSocial', 'Cidade', 'Cnpj', 'DataCad',
     'Uf', 'Tipo'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    AOutput.IDFornecedor := Values[0].ToInt64;
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AOutput.Fantazia);
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AOutput.RazaoSocial);
  if Values[3].Text <> nil then
    AOutput.Cidade := Values[3].ToInt64;
  if Values[4].Text <> nil then
    Values[4].ToUtf8(AOutput.Cnpj);
  if Values[5].Text <> nil then
    AOutput.DataCad := Values[5].Iso8601ToDateTime;
  if Values[6].Text <> nil then
    Values[6].ToUtf8(AOutput.Uf);
  if Values[7].Text <> nil then
    Values[7].ToUtf8(AOutput.Tipo);
end;

procedure TFornecedorControllerTest.SetUp;
begin
  inherited SetUp;
  FServer := TFornecedorController.CreateInMemory('api');
  FClient := TRestClientDB.Create(FServer);
end;

procedure TFornecedorControllerTest.TearDown;
begin
  FClient.Free;
  FServer.Free;
  inherited TearDown;
end;

procedure TFornecedorControllerTest.CreateReturnsCreatedPayload;
var
  Created: TFornecedorOutput;
begin
  Created := CreateFornecedor('Fornecedor API', '11222333000144', 10);
  CheckEquals('Fornecedor API', Utf8ToString(Created.RazaoSocial));
  CheckEquals(10, Created.Cidade);
  CheckEquals('PR', Utf8ToString(Created.Uf));
  CheckEquals('J', Utf8ToString(Created.Tipo));
end;

procedure TFornecedorControllerTest.GetWithoutIdReturnsList;
var
  Response: RawUtf8;
begin
  CreateFornecedor('Fornecedor lista', '11222333000145', 10);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Fornecedor', [], Response));
  CheckTrue(Pos('"RazaoSocial":"Fornecedor lista"', Utf8ToString(Response)) > 0);
end;

procedure TFornecedorControllerTest.GetWithCidadeFilterReturnsMatchingList;
var
  Response: RawUtf8;
begin
  CreateFornecedor('Fornecedor cidade 10', '11222333000146', 10);
  CreateFornecedor('Fornecedor cidade 20', '11222333000147', 20);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Fornecedor',
    ['codcidade', 10], Response));
  CheckTrue(Pos('"RazaoSocial":"Fornecedor cidade 10"', Utf8ToString(Response)) > 0);
  CheckEquals(0, Pos('"RazaoSocial":"Fornecedor cidade 20"', Utf8ToString(Response)));
end;

procedure TFornecedorControllerTest.GetReturnsPersistedPayload;
var
  Created: TFornecedorOutput;
  Found: TFornecedorOutput;
  Response: RawUtf8;
begin
  Created := CreateFornecedor('Fornecedor consulta', '11222333000148', 11);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Fornecedor',
    ['id', Created.IDFornecedor], Response));
  CheckTrue(LoadFornecedorOutput(Response, Found));
  CheckEquals(Created.IDFornecedor, Found.IDFornecedor);
  CheckEquals('Fornecedor consulta', Utf8ToString(Found.RazaoSocial));
end;

procedure TFornecedorControllerTest.UpdateChangesPersistedPayload;
var
  Created: TFornecedorOutput;
  Updated: TFornecedorOutput;
  Response: RawUtf8;
begin
  Created := CreateFornecedor('Fornecedor antigo', '11222333000149', 12);

  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT,
    'Fornecedor?id=' + Int64ToUtf8(Created.IDFornecedor),
    FornecedorPayload('Fornecedor atualizado', '11222333000149', 13), Response));
  CheckTrue(LoadFornecedorOutput(Response, Updated));
  CheckEquals(Created.IDFornecedor, Updated.IDFornecedor);
  CheckEquals('Fornecedor atualizado', Utf8ToString(Updated.RazaoSocial));
  CheckEquals(13, Updated.Cidade);
end;

procedure TFornecedorControllerTest.DeleteRemovesPayload;
var
  Created: TFornecedorOutput;
  Response: RawUtf8;
begin
  Created := CreateFornecedor('Fornecedor excluir', '11222333000150', 14);

  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE,
    'Fornecedor?id=' + Int64ToUtf8(Created.IDFornecedor), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Fornecedor',
    ['id', Created.IDFornecedor], Response));
end;

procedure TFornecedorControllerTest.InvalidPayloadReturnsValidationError;
var
  Response: RawUtf8;
begin
  CheckEquals(HTTP_BADREQUEST, FClient.CallBack(mPOST, 'Fornecedor',
    FornecedorPayload('', '11222333000151', 15), Response));
end;

procedure TFornecedorControllerTest.DuplicateCnpjReturnsValidationError;
var
  Response: RawUtf8;
begin
  CreateFornecedor('Fornecedor original', '11222333000152', 16);
  CheckEquals(HTTP_BADREQUEST, FClient.CallBack(mPOST, 'Fornecedor',
    FornecedorPayload('Fornecedor duplicado', '11222333000152', 16), Response));
end;

initialization
  RegisterTest(TFornecedorControllerTest);

end.
