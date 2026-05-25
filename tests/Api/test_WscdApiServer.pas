unit test_WscdApiServer;

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
  WscdApiServer,
  Agenda.service,
  Recibo.service;

type
  TWscdApiServerTest = class(TTestCase)
  private
    FClient: TRestClientDB;
    FServer: TWscdApiServer;
    function AgendaPayload(const ANome, ATelefone: RawUtf8): RawUtf8;
    function ReciboPayload(const ARecebedor: RawUtf8; AValor: Currency): RawUtf8;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure HealthReturnsOk;
    procedure AgendaCrudRunsOnUnifiedServer;
    procedure ReciboCrudRunsOnUnifiedServer;
  end;

implementation

function TWscdApiServerTest.AgendaPayload(const ANome, ATelefone: RawUtf8): RawUtf8;
var
  Input: TAgendaInput;
begin
  FillChar(Input, SizeOf(Input), 0);
  Input.Nome := ANome;
  Input.Telefone := ATelefone;
  Result := RecordSaveJson(Input, TypeInfo(TAgendaInput));
end;

function TWscdApiServerTest.ReciboPayload(const ARecebedor: RawUtf8; AValor: Currency): RawUtf8;
var
  Input: TReciboInput;
begin
  FillChar(Input, SizeOf(Input), 0);
  Input.Data := EncodeDate(2026, 5, 25);
  Input.Recebedor := ARecebedor;
  Input.Referente := 'Teste API unificada';
  Input.Valor := AValor;
  Result := RecordSaveJson(Input, TypeInfo(TReciboInput));
end;

procedure TWscdApiServerTest.SetUp;
begin
  inherited SetUp;
  FServer := TWscdApiServer.CreateInMemory('api');
  FClient := TRestClientDB.Create(FServer);
end;

procedure TWscdApiServerTest.TearDown;
begin
  FClient.Free;
  FServer.Free;
  inherited TearDown;
end;

procedure TWscdApiServerTest.HealthReturnsOk;
var
  Response: RawUtf8;
begin
  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mGET, 'Health', '', Response));
  CheckEquals('{"status":"ok"}', Utf8ToString(Response));
end;

procedure TWscdApiServerTest.AgendaCrudRunsOnUnifiedServer;
var
  Created: TAgendaOutput;
  Updated: TAgendaOutput;
  Response: RawUtf8;
begin
  CheckEquals(HTTP_CREATED, FClient.CallBack(mPOST, 'Agenda', AgendaPayload('Agenda API', '3001'), Response));
  CheckTrue(RecordLoadJson(Created, Response, TypeInfo(TAgendaOutput)));
  CheckTrue(Created.IDAgenda > 0);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Agenda', ['id', Created.IDAgenda], Response));
  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT, 'Agenda?id=' + Int64ToUtf8(Created.IDAgenda),
    AgendaPayload('Agenda API atualizada', '3002'), Response));
  CheckTrue(RecordLoadJson(Updated, Response, TypeInfo(TAgendaOutput)));
  CheckEquals('Agenda API atualizada', Utf8ToString(Updated.Nome));
  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE, 'Agenda?id=' + Int64ToUtf8(Created.IDAgenda), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Agenda', ['id', Created.IDAgenda], Response));
end;

procedure TWscdApiServerTest.ReciboCrudRunsOnUnifiedServer;
var
  Created: TReciboOutput;
  Updated: TReciboOutput;
  Response: RawUtf8;
begin
  CheckEquals(HTTP_CREATED, FClient.CallBack(mPOST, 'Recibo', ReciboPayload('Recebedor API', 10.50), Response));
  CheckTrue(RecordLoadJson(Created, Response, TypeInfo(TReciboOutput)));
  CheckTrue(Created.IDRecibo > 0);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Recibo', ['id', Created.IDRecibo], Response));
  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT, 'Recibo?id=' + Int64ToUtf8(Created.IDRecibo),
    ReciboPayload('Recebedor API atualizado', 20.75), Response));
  CheckTrue(RecordLoadJson(Updated, Response, TypeInfo(TReciboOutput)));
  CheckEquals('Recebedor API atualizado', Utf8ToString(Updated.Recebedor));
  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE, 'Recibo?id=' + Int64ToUtf8(Created.IDRecibo), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Recibo', ['id', Created.IDRecibo], Response));
end;

initialization
  RegisterTest(TWscdApiServerTest);

end.
