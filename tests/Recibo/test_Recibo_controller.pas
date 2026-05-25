unit test_Recibo_controller;

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
  Recibo.controller,
  Recibo.service;

type
  TReciboControllerTest = class(TTestCase)
  private
    FServer: TReciboController;
    FClient: TRestClientDB;
    function LoadReciboOutput(const AJson: RawUtf8; out AOutput: TReciboOutput): Boolean;
    function ReciboPayload(const ARecebedor, AReferente: RawUtf8; AValor: Currency): RawUtf8;
    function CreateRecibo(const ARecebedor, AReferente: RawUtf8; AValor: Currency): TReciboOutput;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure CreateReturnsCreatedPayload;
    procedure GetWithoutIdReturnsList;
    procedure GetReturnsPersistedPayload;
    procedure UpdateChangesPersistedPayload;
    procedure DeleteRemovesPayload;
    procedure InvalidPayloadReturnsValidationError;
  end;

implementation

function TReciboControllerTest.ReciboPayload(const ARecebedor, AReferente: RawUtf8; AValor: Currency): RawUtf8;
begin
  Result := FormatUtf8('{'#10 +
    '  "Data": "2026-05-25",'#10 +
    '  "Recebedor": "%",'#10 +
    '  "Referente": "%",'#10 +
    '  "Valor": %'#10 +
    '}', [ARecebedor, AReferente, Double(AValor)]);
end;

function TReciboControllerTest.CreateRecibo(const ARecebedor, AReferente: RawUtf8; AValor: Currency): TReciboOutput;
var
  Response: RawUtf8;
  Status: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);
  Status := FClient.CallBack(mPOST, 'Recibo', ReciboPayload(ARecebedor, AReferente, AValor), Response);
  CheckEquals(HTTP_CREATED, Status);
  CheckTrue(LoadReciboOutput(Response, Result));
  CheckTrue(Result.IDRecibo > 0);
end;

function TReciboControllerTest.LoadReciboOutput(const AJson: RawUtf8;
  out AOutput: TReciboOutput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..5] of TValuePUtf8Char;
begin
  FillChar(AOutput, SizeOf(AOutput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['IDRecibo', 'Data', 'Recebedor', 'Referente', 'Valor', 'ValorExtenso'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    AOutput.IDRecibo := Values[0].ToInt64;
  if Values[1].Text <> nil then
    AOutput.Data := Values[1].Iso8601ToDateTime;
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AOutput.Recebedor);
  if Values[3].Text <> nil then
    Values[3].ToUtf8(AOutput.Referente);
  if Values[4].Text <> nil then
    AOutput.Valor := Values[4].ToDouble;
  if Values[5].Text <> nil then
    Values[5].ToUtf8(AOutput.ValorExtenso);
end;

procedure TReciboControllerTest.SetUp;
begin
  inherited SetUp;
  FServer := TReciboController.CreateInMemory('api');
  FClient := TRestClientDB.Create(FServer);
end;

procedure TReciboControllerTest.TearDown;
begin
  FClient.Free;
  FServer.Free;
  inherited TearDown;
end;

procedure TReciboControllerTest.CreateReturnsCreatedPayload;
var
  Created: TReciboOutput;
begin
  Created := CreateRecibo('Rafael Kaciano Wolf', 'Pagamento de servicos', 120);
  CheckEquals('Rafael Kaciano Wolf', Utf8ToString(Created.Recebedor));
  CheckEquals('Pagamento de servicos', Utf8ToString(Created.Referente));
  CheckEquals(120.0, Double(Created.Valor), 0.001);
end;

procedure TReciboControllerTest.GetWithoutIdReturnsList;
var
  Response: RawUtf8;
begin
  CreateRecibo('Recebedor lista', 'Referente lista', 15);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Recibo', [], Response));
  CheckTrue(Pos('"Recebedor":"Recebedor lista"', Utf8ToString(Response)) > 0);
end;

procedure TReciboControllerTest.GetReturnsPersistedPayload;
var
  Created: TReciboOutput;
  Found: TReciboOutput;
  Response: RawUtf8;
begin
  Created := CreateRecibo('SUPERMERCADO ALVORADA', 'Compra mensal', 32.10);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Recibo', ['id', Created.IDRecibo], Response));
  CheckTrue(LoadReciboOutput(Response, Found));
  CheckEquals(Created.IDRecibo, Found.IDRecibo);
  CheckEquals('SUPERMERCADO ALVORADA', Utf8ToString(Found.Recebedor));
end;

procedure TReciboControllerTest.UpdateChangesPersistedPayload;
var
  Created: TReciboOutput;
  Updated: TReciboOutput;
  Response: RawUtf8;
begin
  Created := CreateRecibo('Recebedor antigo', 'Referente antigo', 100);

  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT, 'Recibo?id=' + Int64ToUtf8(Created.IDRecibo),
    ReciboPayload('Recebedor atualizado', 'Referente atualizado', 250), Response));
  CheckTrue(LoadReciboOutput(Response, Updated));
  CheckEquals(Created.IDRecibo, Updated.IDRecibo);
  CheckEquals('Recebedor atualizado', Utf8ToString(Updated.Recebedor));
  CheckEquals(250.0, Double(Updated.Valor), 0.001);
end;

procedure TReciboControllerTest.DeleteRemovesPayload;
var
  Created: TReciboOutput;
  Response: RawUtf8;
begin
  Created := CreateRecibo('Recebedor para excluir', 'Referente', 10);

  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE, 'Recibo?id=' + Int64ToUtf8(Created.IDRecibo), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Recibo', ['id', Created.IDRecibo], Response));
end;

procedure TReciboControllerTest.InvalidPayloadReturnsValidationError;
var
  Response: RawUtf8;
begin
  CheckEquals(HTTP_BADREQUEST, FClient.CallBack(mPOST, 'Recibo',
    ReciboPayload(StringToUtf8(StringOfChar('X', 251)), 'Referente', 44), Response));
end;

initialization
  RegisterTest(TReciboControllerTest);

end.
