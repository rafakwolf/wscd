unit test_Recibo_controller;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  fpcunit,
  testregistry,
  mormot.core.base,
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
    function ReciboPayload(const ARecebedor, AReferente: RawUtf8; AValor: Currency): RawUtf8;
    function CreateRecibo(const ARecebedor, AReferente: RawUtf8; AValor: Currency): TReciboOutput;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure CreateReturnsCreatedPayload;
    procedure GetReturnsPersistedPayload;
    procedure UpdateChangesPersistedPayload;
    procedure DeleteRemovesPayload;
    procedure InvalidPayloadReturnsValidationError;
  end;

implementation

function TReciboControllerTest.ReciboPayload(const ARecebedor, AReferente: RawUtf8; AValor: Currency): RawUtf8;
var
  Input: TReciboInput;
begin
  FillChar(Input, SizeOf(Input), 0);
  Input.Data := EncodeDate(2026, 5, 25);
  Input.Recebedor := ARecebedor;
  Input.Referente := AReferente;
  Input.Valor := AValor;
  Result := RecordSaveJson(Input, TypeInfo(TReciboInput));
end;

function TReciboControllerTest.CreateRecibo(const ARecebedor, AReferente: RawUtf8; AValor: Currency): TReciboOutput;
var
  Response: RawUtf8;
  Status: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);
  Status := FClient.CallBack(mPOST, 'Recibo', ReciboPayload(ARecebedor, AReferente, AValor), Response);
  CheckEquals(HTTP_CREATED, Status);
  CheckTrue(RecordLoadJson(Result, Response, TypeInfo(TReciboOutput)));
  CheckTrue(Result.IDRecibo > 0);
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

procedure TReciboControllerTest.GetReturnsPersistedPayload;
var
  Created: TReciboOutput;
  Found: TReciboOutput;
  Response: RawUtf8;
begin
  Created := CreateRecibo('SUPERMERCADO ALVORADA', 'Compra mensal', 32.10);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Recibo', ['id', Created.IDRecibo], Response));
  CheckTrue(RecordLoadJson(Found, Response, TypeInfo(TReciboOutput)));
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
  CheckTrue(RecordLoadJson(Updated, Response, TypeInfo(TReciboOutput)));
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
