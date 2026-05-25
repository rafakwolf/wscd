unit test_WscdApiServer;

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
  WscdApiServer,
  Agenda.service,
  Recibo.service,
  Vendedor.service;

type
  TWscdApiServerTest = class(TTestCase)
  private
    FClient: TRestClientDB;
    FServer: TWscdApiServer;
    function AgendaPayload(const ANome, ATelefone: RawUtf8): RawUtf8;
    function LoadAgendaOutput(const AJson: RawUtf8; out AOutput: TAgendaOutput): Boolean;
    function LoadReciboOutput(const AJson: RawUtf8; out AOutput: TReciboOutput): Boolean;
    function LoadVendedorOutput(const AJson: RawUtf8; out AOutput: TVendedorOutput): Boolean;
    function ReciboPayload(const ARecebedor: RawUtf8; AValor: Currency): RawUtf8;
    function VendedorPayload(const ANome, AAtivo: RawUtf8): RawUtf8;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure HealthReturnsOk;
    procedure AgendaCrudRunsOnUnifiedServer;
    procedure ReciboCrudRunsOnUnifiedServer;
    procedure VendedorCrudRunsOnUnifiedServer;
  end;

implementation

function TWscdApiServerTest.AgendaPayload(const ANome, ATelefone: RawUtf8): RawUtf8;
begin
  Result := '{' + #10 +
    '  "Nome": "' + ANome + '",' + #10 +
    '  "Telefone": "' + ATelefone + '"' + #10 +
    '}';
end;

function TWscdApiServerTest.LoadAgendaOutput(const AJson: RawUtf8;
  out AOutput: TAgendaOutput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..2] of TValuePUtf8Char;
begin
  FillChar(AOutput, SizeOf(AOutput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['IDAgenda', 'Nome', 'Telefone'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    AOutput.IDAgenda := Values[0].ToInt64;
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AOutput.Nome);
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AOutput.Telefone);
end;

function TWscdApiServerTest.LoadReciboOutput(const AJson: RawUtf8;
  out AOutput: TReciboOutput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..4] of TValuePUtf8Char;
begin
  FillChar(AOutput, SizeOf(AOutput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['IDRecibo', 'Data', 'Recebedor', 'Referente', 'Valor'], @Values) <> nil;
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
end;

function TWscdApiServerTest.LoadVendedorOutput(const AJson: RawUtf8;
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

function TWscdApiServerTest.ReciboPayload(const ARecebedor: RawUtf8; AValor: Currency): RawUtf8;
begin
  Result := FormatUtf8('{'#10 +
    '  "Data": "2026-05-25",'#10 +
    '  "Recebedor": "%",'#10 +
    '  "Referente": "Teste API unificada",'#10 +
    '  "Valor": %'#10 +
    '}', [ARecebedor, Double(AValor)]);
end;

function TWscdApiServerTest.VendedorPayload(const ANome, AAtivo: RawUtf8): RawUtf8;
begin
  Result := '{' + #10 +
    '  "Vendedor": "' + ANome + '",' + #10 +
    '  "Ativo": "' + AAtivo + '"' + #10 +
    '}';
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
  CheckTrue(LoadAgendaOutput(Response, Created));
  CheckTrue(Created.IDAgenda > 0);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Agenda', [], Response));
  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Agenda', ['id', Created.IDAgenda], Response));
  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT, 'Agenda?id=' + Int64ToUtf8(Created.IDAgenda),
    AgendaPayload('Agenda API atualizada', '3002'), Response));
  CheckTrue(LoadAgendaOutput(Response, Updated));
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
  CheckTrue(LoadReciboOutput(Response, Created));
  CheckTrue(Created.IDRecibo > 0);

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Recibo', [], Response));
  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Recibo', ['id', Created.IDRecibo], Response));
  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT, 'Recibo?id=' + Int64ToUtf8(Created.IDRecibo),
    ReciboPayload('Recebedor API atualizado', 20.75), Response));
  CheckTrue(LoadReciboOutput(Response, Updated));
  CheckEquals('Recebedor API atualizado', Utf8ToString(Updated.Recebedor));
  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE, 'Recibo?id=' + Int64ToUtf8(Created.IDRecibo), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Recibo', ['id', Created.IDRecibo], Response));
end;

procedure TWscdApiServerTest.VendedorCrudRunsOnUnifiedServer;
var
  Created: TVendedorOutput;
  Updated: TVendedorOutput;
  Response: RawUtf8;
begin
  CheckEquals(HTTP_CREATED, FClient.CallBack(mPOST, 'Vendedor', VendedorPayload('Vendedor API', ''), Response));
  CheckTrue(LoadVendedorOutput(Response, Created));
  CheckTrue(Created.IDVendedor > 0);
  CheckEquals('S', Utf8ToString(Created.Ativo));

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Vendedor', [], Response));
  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Vendedor', ['id', Created.IDVendedor], Response));
  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT, 'Vendedor?id=' + Int64ToUtf8(Created.IDVendedor),
    VendedorPayload('Vendedor API atualizado', 'N'), Response));
  CheckTrue(LoadVendedorOutput(Response, Updated));
  CheckEquals('Vendedor API atualizado', Utf8ToString(Updated.Vendedor));
  CheckEquals('N', Utf8ToString(Updated.Ativo));
  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE, 'Vendedor?id=' + Int64ToUtf8(Created.IDVendedor), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Vendedor', ['id', Created.IDVendedor], Response));
end;

initialization
  RegisterTest(TWscdApiServerTest);

end.
