unit test_Agenda_controller;

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
  Agenda.controller,
  Agenda.service;

type
  TAgendaControllerTest = class(TTestCase)
  private
    FServer: TAgendaController;
    FClient: TRestClientDB;
    function AgendaPayload(const ANome, ATelefone: RawUtf8): RawUtf8;
    function CreateAgenda(const ANome, ATelefone: RawUtf8): TAgendaOutput;
    function LoadAgendaOutput(const AJson: RawUtf8; out AOutput: TAgendaOutput): Boolean;
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

function TAgendaControllerTest.AgendaPayload(const ANome, ATelefone: RawUtf8): RawUtf8;
begin
  Result := '{' + #10 +
    '  "Nome": "' + ANome + '",' + #10 +
    '  "Telefone": "' + ATelefone + '",' + #10 +
    '  "Telefone2": "46 99123-4567",' + #10 +
    '  "Telefone3": "",' + #10 +
    '  "Fax": "",' + #10 +
    '  "Obs": "Contato migrado do modulo Agenda"' + #10 +
    '}';
end;

function TAgendaControllerTest.CreateAgenda(const ANome, ATelefone: RawUtf8): TAgendaOutput;
var
  Response: RawUtf8;
  Status: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);
  Status := FClient.CallBack(mPOST, 'Agenda', AgendaPayload(ANome, ATelefone), Response);
  CheckEquals(HTTP_CREATED, Status);
  CheckTrue(LoadAgendaOutput(Response, Result));
  CheckTrue(Result.IDAgenda > 0);
end;

function TAgendaControllerTest.LoadAgendaOutput(const AJson: RawUtf8;
  out AOutput: TAgendaOutput): Boolean;
var
  Body: RawUtf8;
  Values: array[0..6] of TValuePUtf8Char;
begin
  FillChar(AOutput, SizeOf(AOutput), 0);
  Body := AJson;
  Result := JsonDecode(PUtf8Char(UniqueRawUtf8(Body)),
    ['IDAgenda', 'Nome', 'Telefone', 'Telefone2', 'Telefone3', 'Fax', 'Obs'], @Values) <> nil;
  if not Result then
    Exit;
  if Values[0].Text <> nil then
    AOutput.IDAgenda := Values[0].ToInt64;
  if Values[1].Text <> nil then
    Values[1].ToUtf8(AOutput.Nome);
  if Values[2].Text <> nil then
    Values[2].ToUtf8(AOutput.Telefone);
  if Values[3].Text <> nil then
    Values[3].ToUtf8(AOutput.Telefone2);
  if Values[4].Text <> nil then
    Values[4].ToUtf8(AOutput.Telefone3);
  if Values[5].Text <> nil then
    Values[5].ToUtf8(AOutput.Fax);
  if Values[6].Text <> nil then
    Values[6].ToUtf8(AOutput.Obs);
end;

procedure TAgendaControllerTest.SetUp;
begin
  inherited SetUp;
  FServer := TAgendaController.CreateInMemory('api');
  FClient := TRestClientDB.Create(FServer);
end;

procedure TAgendaControllerTest.TearDown;
begin
  FClient.Free;
  FServer.Free;
  inherited TearDown;
end;

procedure TAgendaControllerTest.CreateReturnsCreatedPayload;
var
  Created: TAgendaOutput;
begin
  Created := CreateAgenda('Rafael Kaciano Wolf', '3555-1071');
  CheckEquals('Rafael Kaciano Wolf', Utf8ToString(Created.Nome));
  CheckEquals('3555-1071', Utf8ToString(Created.Telefone));
end;

procedure TAgendaControllerTest.GetWithoutIdReturnsList;
var
  Response: RawUtf8;
begin
  CreateAgenda('Agenda lista', '4444-4444');

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Agenda', [], Response));
  CheckTrue(Pos('"Nome":"Agenda lista"', Utf8ToString(Response)) > 0);
end;

procedure TAgendaControllerTest.GetReturnsPersistedPayload;
var
  Created: TAgendaOutput;
  Found: TAgendaOutput;
  Response: RawUtf8;
begin
  Created := CreateAgenda('Teste log', '46 3552 1672');

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Agenda', ['id', Created.IDAgenda], Response));
  CheckTrue(LoadAgendaOutput(Response, Found));
  CheckEquals(Created.IDAgenda, Found.IDAgenda);
  CheckEquals('Teste log', Utf8ToString(Found.Nome));
end;

procedure TAgendaControllerTest.UpdateChangesPersistedPayload;
var
  Created: TAgendaOutput;
  Updated: TAgendaOutput;
  Response: RawUtf8;
begin
  Created := CreateAgenda('Agenda antiga', '1111-1111');

  CheckEquals(HTTP_SUCCESS, FClient.CallBack(mPUT, 'Agenda?id=' + Int64ToUtf8(Created.IDAgenda),
    AgendaPayload('Agenda atualizada', '2222-2222'), Response));
  CheckTrue(LoadAgendaOutput(Response, Updated));
  CheckEquals(Created.IDAgenda, Updated.IDAgenda);
  CheckEquals('Agenda atualizada', Utf8ToString(Updated.Nome));
  CheckEquals('2222-2222', Utf8ToString(Updated.Telefone));
end;

procedure TAgendaControllerTest.DeleteRemovesPayload;
var
  Created: TAgendaOutput;
  Response: RawUtf8;
begin
  Created := CreateAgenda('Agenda para excluir', '3333-3333');

  CheckEquals(HTTP_NOCONTENT, FClient.CallBack(mDELETE, 'Agenda?id=' + Int64ToUtf8(Created.IDAgenda), '', Response));
  CheckEquals(HTTP_NOTFOUND, FClient.CallBackGet('Agenda', ['id', Created.IDAgenda], Response));
end;

procedure TAgendaControllerTest.InvalidPayloadReturnsValidationError;
var
  Response: RawUtf8;
begin
  CheckEquals(HTTP_BADREQUEST, FClient.CallBack(mPOST, 'Agenda', AgendaPayload('', '4444-4444'), Response));
end;

initialization
  RegisterTest(TAgendaControllerTest);

end.
