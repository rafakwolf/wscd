unit test_Agenda_controller;

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
  Agenda.controller,
  Agenda.service;

type
  TAgendaControllerTest = class(TTestCase)
  private
    FServer: TAgendaController;
    FClient: TRestClientDB;
    function AgendaPayload(const ANome, ATelefone: RawUtf8): RawUtf8;
    function CreateAgenda(const ANome, ATelefone: RawUtf8): TAgendaOutput;
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

function TAgendaControllerTest.AgendaPayload(const ANome, ATelefone: RawUtf8): RawUtf8;
var
  Input: TAgendaInput;
begin
  FillChar(Input, SizeOf(Input), 0);
  Input.Nome := ANome;
  Input.Telefone := ATelefone;
  Input.Telefone2 := '46 99123-4567';
  Input.Telefone3 := '';
  Input.Fax := '';
  Input.Obs := 'Contato migrado do modulo Agenda';
  Result := RecordSaveJson(Input, TypeInfo(TAgendaInput));
end;

function TAgendaControllerTest.CreateAgenda(const ANome, ATelefone: RawUtf8): TAgendaOutput;
var
  Response: RawUtf8;
  Status: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);
  Status := FClient.CallBack(mPOST, 'Agenda', AgendaPayload(ANome, ATelefone), Response);
  CheckEquals(HTTP_CREATED, Status);
  CheckTrue(RecordLoadJson(Result, Response, TypeInfo(TAgendaOutput)));
  CheckTrue(Result.IDAgenda > 0);
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

procedure TAgendaControllerTest.GetReturnsPersistedPayload;
var
  Created: TAgendaOutput;
  Found: TAgendaOutput;
  Response: RawUtf8;
begin
  Created := CreateAgenda('Teste log', '46 3552 1672');

  CheckEquals(HTTP_SUCCESS, FClient.CallBackGet('Agenda', ['id', Created.IDAgenda], Response));
  CheckTrue(RecordLoadJson(Found, Response, TypeInfo(TAgendaOutput)));
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
  CheckTrue(RecordLoadJson(Updated, Response, TypeInfo(TAgendaOutput)));
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
