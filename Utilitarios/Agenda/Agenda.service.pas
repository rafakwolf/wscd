unit Agenda.service;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.json,
  mormot.core.unicode,
  mormot.orm.core,
  Agenda.repository;

const
  __TAgendaInput = 'Nome: RawUtf8; Telefone: RawUtf8; Telefone2: RawUtf8; Telefone3: RawUtf8; Fax: RawUtf8; Obs: RawUtf8';
  __TAgendaOutput = 'IDAgenda: Int64; Nome: RawUtf8; Telefone: RawUtf8; Telefone2: RawUtf8; Telefone3: RawUtf8; Fax: RawUtf8; Obs: RawUtf8';

type
  EAgendaValidation = class(Exception);
  EAgendaNotFound = class(Exception);

  TAgendaInput = packed record
    Nome: RawUtf8;
    Telefone: RawUtf8;
    Telefone2: RawUtf8;
    Telefone3: RawUtf8;
    Fax: RawUtf8;
    Obs: RawUtf8;
  end;

  TAgendaOutput = packed record
    IDAgenda: Int64;
    Nome: RawUtf8;
    Telefone: RawUtf8;
    Telefone2: RawUtf8;
    Telefone3: RawUtf8;
    Fax: RawUtf8;
    Obs: RawUtf8;
  end;

  TAgendaOutputDynArray = array of TAgendaOutput;

  TAgendaService = class
  private
    FRepository: TAgendaRepository;
    class function IsBlank(const AValue: RawUtf8): Boolean; static;
    class function Utf8CharCount(const AValue: RawUtf8): Integer; static;
    class function ToOutput(AAgenda: TOrmAgenda): TAgendaOutput; static;
    procedure ApplyInput(AAgenda: TOrmAgenda; const AInput: TAgendaInput);
    procedure ValidateForSave(const AInput: TAgendaInput);
  public
    constructor Create(ARepository: TAgendaRepository);
    function CreateItem(const AInput: TAgendaInput): TAgendaOutput;
    function GetItem(AId: TID): TAgendaOutput;
    function ListItems: TAgendaOutputDynArray;
    function UpdateItem(AId: TID; const AInput: TAgendaInput): TAgendaOutput;
    procedure DeleteItem(AId: TID);
  end;

implementation

constructor TAgendaService.Create(ARepository: TAgendaRepository);
begin
  inherited Create;
  if ARepository = nil then
    raise EArgumentException.Create('Repositorio da Agenda nao informado');
  FRepository := ARepository;
end;

class function TAgendaService.IsBlank(const AValue: RawUtf8): Boolean;
begin
  Result := Trim(Utf8ToString(AValue)) = '';
end;

class function TAgendaService.Utf8CharCount(const AValue: RawUtf8): Integer;
begin
  Result := Length(Utf8ToString(AValue));
end;

class function TAgendaService.ToOutput(AAgenda: TOrmAgenda): TAgendaOutput;
begin
  FillChar(Result, SizeOf(Result), 0);
  if AAgenda = nil then
    Exit;
  Result.IDAgenda := AAgenda.ID;
  Result.Nome := AAgenda.Nome;
  Result.Telefone := AAgenda.Telefone;
  Result.Telefone2 := AAgenda.Telefone2;
  Result.Telefone3 := AAgenda.Telefone3;
  Result.Fax := AAgenda.Fax;
  Result.Obs := AAgenda.Obs;
end;

procedure TAgendaService.ApplyInput(AAgenda: TOrmAgenda; const AInput: TAgendaInput);
begin
  AAgenda.Nome := AInput.Nome;
  AAgenda.Telefone := AInput.Telefone;
  AAgenda.Telefone2 := AInput.Telefone2;
  AAgenda.Telefone3 := AInput.Telefone3;
  AAgenda.Fax := AInput.Fax;
  AAgenda.Obs := AInput.Obs;
end;

procedure TAgendaService.ValidateForSave(const AInput: TAgendaInput);
begin
  if IsBlank(AInput.Nome) then
    raise EAgendaValidation.Create('Nome e obrigatorio');
  if IsBlank(AInput.Telefone) then
    raise EAgendaValidation.Create('Telefone e obrigatorio');
  if Utf8CharCount(AInput.Nome) > 80 then
    raise EAgendaValidation.Create('Nome deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.Telefone) > 20 then
    raise EAgendaValidation.Create('Telefone deve ter no maximo 20 caracteres');
  if Utf8CharCount(AInput.Telefone2) > 20 then
    raise EAgendaValidation.Create('Telefone2 deve ter no maximo 20 caracteres');
  if Utf8CharCount(AInput.Telefone3) > 20 then
    raise EAgendaValidation.Create('Telefone3 deve ter no maximo 20 caracteres');
  if Utf8CharCount(AInput.Fax) > 20 then
    raise EAgendaValidation.Create('Fax deve ter no maximo 20 caracteres');
end;

function TAgendaService.CreateItem(const AInput: TAgendaInput): TAgendaOutput;
var
  Agenda: TOrmAgenda;
  NewId: TID;
begin
  ValidateForSave(AInput);
  Agenda := TOrmAgenda.Create;
  try
    ApplyInput(Agenda, AInput);
    NewId := FRepository.Add(Agenda);
    if NewId <= 0 then
      raise EAgendaValidation.Create('Agenda nao foi criada');
    Agenda.IDValue := NewId;
    Result := ToOutput(Agenda);
  finally
    Agenda.Free;
  end;
end;

function TAgendaService.GetItem(AId: TID): TAgendaOutput;
var
  Agenda: TOrmAgenda;
begin
  Agenda := FRepository.FindById(AId);
  try
    if Agenda = nil then
      raise EAgendaNotFound.CreateFmt('Agenda %d nao encontrada', [AId]);
    Result := ToOutput(Agenda);
  finally
    Agenda.Free;
  end;
end;

function TAgendaService.ListItems: TAgendaOutputDynArray;
var
  Items: TOrmAgendaObjArray;
  I: PtrInt;
begin
  Items := FRepository.ListAll;
  try
    SetLength(Result, Length(Items));
    for I := 0 to High(Items) do
      Result[I] := ToOutput(Items[I]);
  finally
    ObjArrayClear(Items);
  end;
end;

function TAgendaService.UpdateItem(AId: TID; const AInput: TAgendaInput): TAgendaOutput;
var
  Agenda: TOrmAgenda;
begin
  ValidateForSave(AInput);
  Agenda := FRepository.FindById(AId);
  try
    if Agenda = nil then
      raise EAgendaNotFound.CreateFmt('Agenda %d nao encontrada', [AId]);
    ApplyInput(Agenda, AInput);
    if not FRepository.Update(Agenda) then
      raise EAgendaValidation.Create('Agenda nao foi atualizada');
    Result := ToOutput(Agenda);
  finally
    Agenda.Free;
  end;
end;

procedure TAgendaService.DeleteItem(AId: TID);
begin
  if not FRepository.Delete(AId) then
    raise EAgendaNotFound.CreateFmt('Agenda %d nao encontrada', [AId]);
end;

end.
