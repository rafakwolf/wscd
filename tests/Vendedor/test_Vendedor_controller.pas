unit test_Vendedor_controller;

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
  Vendedor.controller,
  Vendedor.service;

type
  TVendedorControllerTest = class(TTestCase)
  private
    FServer: TVendedorController;
    FClient: TRestClientDB;
    function CreateVendedor(const ANome, AAtivo: RawUtf8): TVendedorOutput;
    function LoadVendedorOutput(const AJson: RawUtf8; out AOutput: TVendedorOutput): Boolean;
    function VendedorPayload(const ANome, AAtivo: RawUtf8): RawUtf8;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure CreateReturnsCreatedPayloadWithDefaultAtivo;
    procedure GetWithoutIdReturnsList;
    procedure GetReturnsPersistedPayload;
    procedure UpdateChangesPersistedPayload;
    procedure DeleteRemovesPayload;
    procedure InvalidPayloadReturnsValidationError;
  end;

implementation

function TVendedorControllerTest.CreateVendedor(const ANome, AAtivo: RawUtf8): TVendedorOutput;
var
  Response: RawUtf8;
  Status: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);
  Status := FClient.CallBack(mPOST, 'Vendedor', VendedorPayload(ANome, AAtivo), Response);
  CheckEquals(HTTP_CREATED, Status);
  CheckTrue(LoadVendedorOutput(Response, Result));
  CheckTrue(Result.IDVendedor > 0);
end;

function TVendedorControllerTest.LoadVendedorOutput(const AJson: RawUtf8;
  out AOutput: TVendedorOutput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..2] of TValuePUtf8Char;
begin
  FillChar(AOutput, SizeOf(AOutput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['IDVendedor', 'Vendedor', 'Ativo'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    AOutput.IDVendedor := Values[0].ToInt64;
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AOutput.Vendedor);
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AOutput.Ativo);
end;

function TVendedorControllerTest.VendedorPayload(const ANome, AAtivo: RawUtf8): RawUtf8;
begin
  Result := '{' + #10 +
    '  "Vendedor": "' + ANome + '",' + #10 +
    '  "Ativo": "' + AAtivo + '"' + #10 +
    '}';
end;

procedure TVendedorControllerTest.SetUp;
begin
  inherited SetUp;
  FServer := TVendedorController.CreateInMemory('api');
  FClient := TRestClientDB.Create(FServer);
end;

procedure TVendedorControllerTest.TearDown;
begin
  FClient.Free;
  FServer.Free;
  inherited TearDown;
end;

procedure TVendedorControllerTest.CreateReturnsCreatedPayloadWithDefaultAtivo;
var
  Created: TVendedorOutput;
begin
  Created := CreateVendedor('Vendedor API', '');
  CheckEquals('Vendedor API', Utf8ToString(Created.Vendedor));
  CheckEquals('S', Utf8ToString(Created.Ativo));
end;

procedure TVendedorControllerTest.GetWithoutIdReturnsList;
var
  Response: RawUtf8;
begin
  CreateVendedor('Vendedor lista', 'S');

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Vendedor', [], Response));
  CheckTrue(Pos('"Vendedor":"Vendedor lista"', Utf8ToString(Response)) > 0);
end;

procedure TVendedorControllerTest.GetReturnsPersistedPayload;
var
  Created: TVendedorOutput;
  Found: TVendedorOutput;
  Response: RawUtf8;
begin
  Created := CreateVendedor('Vendedor consulta', 'S');

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Vendedor', ['id', Created.IDVendedor], Response));
  CheckTrue(LoadVendedorOutput(Response, Found));
  CheckEquals(Created.IDVendedor, Found.IDVendedor);
  CheckEquals('Vendedor consulta', Utf8ToString(Found.Vendedor));
end;

procedure TVendedorControllerTest.UpdateChangesPersistedPayload;
var
  Created: TVendedorOutput;
  Updated: TVendedorOutput;
  Response: RawUtf8;
begin
  Created := CreateVendedor('Vendedor antigo', 'S');

  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT, 'Vendedor?id=' + Int64ToUtf8(Created.IDVendedor),
    VendedorPayload('Vendedor atualizado', 'N'), Response));
  CheckTrue(LoadVendedorOutput(Response, Updated));
  CheckEquals(Created.IDVendedor, Updated.IDVendedor);
  CheckEquals('Vendedor atualizado', Utf8ToString(Updated.Vendedor));
  CheckEquals('N', Utf8ToString(Updated.Ativo));
end;

procedure TVendedorControllerTest.DeleteRemovesPayload;
var
  Created: TVendedorOutput;
  Response: RawUtf8;
begin
  Created := CreateVendedor('Vendedor para excluir', 'S');

  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE, 'Vendedor?id=' + Int64ToUtf8(Created.IDVendedor), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Vendedor', ['id', Created.IDVendedor], Response));
end;

procedure TVendedorControllerTest.InvalidPayloadReturnsValidationError;
var
  Response: RawUtf8;
begin
  CheckEquals(HTTP_BADREQUEST, FClient.CallBack(mPOST, 'Vendedor', VendedorPayload('', 'S'), Response));
  CheckEquals(HTTP_BADREQUEST, FClient.CallBack(mPOST, 'Vendedor', VendedorPayload('Vendedor invalido', 'X'), Response));
end;

initialization
  RegisterTest(TVendedorControllerTest);

end.
