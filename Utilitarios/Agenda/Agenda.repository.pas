unit Agenda.repository;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.orm.core,
  mormot.orm.rest;

type
  TOrmAgenda = class(TOrm)
  private
    FNome: RawUtf8;
    FTelefone: RawUtf8;
    FTelefone2: RawUtf8;
    FTelefone3: RawUtf8;
    FFax: RawUtf8;
    FObs: RawUtf8;
  published
    property Nome: RawUtf8 index 80 read FNome write FNome;
    property Telefone: RawUtf8 index 20 read FTelefone write FTelefone;
    property Telefone2: RawUtf8 index 20 read FTelefone2 write FTelefone2;
    property Telefone3: RawUtf8 index 20 read FTelefone3 write FTelefone3;
    property Fax: RawUtf8 index 20 read FFax write FFax;
    property Obs: RawUtf8 read FObs write FObs;
  end;

  TOrmAgendaObjArray = array of TOrmAgenda;

  TAgendaRepository = class
  private
    FOrm: IRestOrm;
  public
    constructor Create(const AOrm: IRestOrm);
    function Add(AAgenda: TOrmAgenda): TID;
    function FindById(AId: TID): TOrmAgenda;
    function ListAll: TOrmAgendaObjArray;
    function Update(AAgenda: TOrmAgenda): Boolean;
    function Delete(AId: TID): Boolean;
  end;

function CreateAgendaModel: TOrmModel;

implementation

constructor TAgendaRepository.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  if AOrm = nil then
    raise EArgumentException.Create('ORM da Agenda nao informado');
  FOrm := AOrm;
end;

function TAgendaRepository.Add(AAgenda: TOrmAgenda): TID;
begin
  Result := FOrm.Add(AAgenda, {senddata=}True);
end;

function TAgendaRepository.FindById(AId: TID): TOrmAgenda;
begin
  Result := TOrmAgenda.Create(FOrm, AId);
  if Result.ID = 0 then
    FreeAndNil(Result);
end;

function TAgendaRepository.ListAll: TOrmAgendaObjArray;
begin
  Result := nil;
  if not FOrm.RetrieveListObjArray(Result, TOrmAgenda, 'order by Nome', []) then
    ObjArrayClear(Result);
end;

function TAgendaRepository.Update(AAgenda: TOrmAgenda): Boolean;
begin
  Result := (AAgenda <> nil) and (AAgenda.ID > 0) and FOrm.Update(AAgenda);
end;

function TAgendaRepository.Delete(AId: TID): Boolean;
begin
  Result := FOrm.Delete(TOrmAgenda, AId);
end;

function CreateAgendaModel: TOrmModel;
begin
  Result := TOrmModel.Create([TOrmAgenda], 'api');
end;

end.
