unit Cliente.repository;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.orm.core,
  mormot.orm.rest;

type
  TOrmCliente = class(TOrm)
  private
    FBairro: RawUtf8;
    FCadastro: TDateTime;
    FCargo: RawUtf8;
    FCep: RawUtf8;
    FCodCidade: Int64;
    FConjugue: RawUtf8;
    FCpfCnpj: RawUtf8;
    FDataInicio: TDateTime;
    FDataNasc: TDateTime;
    FEmail: RawUtf8;
    FEndereco: RawUtf8;
    FEndAnterior: RawUtf8;
    FEstadoCivil: RawUtf8;
    FFax: RawUtf8;
    FFoneCom: RawUtf8;
    FFoto: RawBlob;
    FLimite: Currency;
    FLocalTrab: RawUtf8;
    FMae: RawUtf8;
    FNaturalidade: RawUtf8;
    FNome: RawUtf8;
    FObs: RawUtf8;
    FPai: RawUtf8;
    FReferCom: RawUtf8;
    FReferPes: RawUtf8;
    FRgIe: RawUtf8;
    FSalario: Currency;
    FTelefone: RawUtf8;
    FTempoMoradia: RawUtf8;
    FTipo: RawUtf8;
    FTrabalho: RawUtf8;
    FUf: RawUtf8;
  published
    property Tipo: RawUtf8 index 1 read FTipo write FTipo;
    property Nome: RawUtf8 index 80 read FNome write FNome;
    property Endereco: RawUtf8 index 80 read FEndereco write FEndereco;
    property Cep: RawUtf8 index 10 read FCep write FCep;
    property Bairro: RawUtf8 index 30 read FBairro write FBairro;
    property Telefone: RawUtf8 index 15 read FTelefone write FTelefone;
    property Fax: RawUtf8 index 15 read FFax write FFax;
    property CodCidade: Int64 read FCodCidade write FCodCidade;
    property Uf: RawUtf8 index 2 read FUf write FUf;
    property TempoMoradia: RawUtf8 index 30 read FTempoMoradia write FTempoMoradia;
    property EndAnterior: RawUtf8 index 50 read FEndAnterior write FEndAnterior;
    property Email: RawUtf8 index 60 read FEmail write FEmail;
    property Trabalho: RawUtf8 index 50 read FTrabalho write FTrabalho;
    property Cargo: RawUtf8 index 50 read FCargo write FCargo;
    property DataInicio: TDateTime read FDataInicio write FDataInicio;
    property Salario: Currency read FSalario write FSalario;
    property EstadoCivil: RawUtf8 index 1 read FEstadoCivil write FEstadoCivil;
    property Conjugue: RawUtf8 index 50 read FConjugue write FConjugue;
    property LocalTrab: RawUtf8 index 60 read FLocalTrab write FLocalTrab;
    property DataNasc: TDateTime read FDataNasc write FDataNasc;
    property Pai: RawUtf8 index 60 read FPai write FPai;
    property Mae: RawUtf8 index 60 read FMae write FMae;
    property CpfCnpj: RawUtf8 index 18 read FCpfCnpj write FCpfCnpj;
    property RgIe: RawUtf8 index 11 read FRgIe write FRgIe;
    property ReferPes: RawUtf8 index 100 read FReferPes write FReferPes;
    property ReferCom: RawUtf8 index 100 read FReferCom write FReferCom;
    property FoneCom: RawUtf8 index 15 read FFoneCom write FFoneCom;
    property Cadastro: TDateTime read FCadastro write FCadastro;
    property Obs: RawUtf8 read FObs write FObs;
    property Naturalidade: RawUtf8 index 50 read FNaturalidade write FNaturalidade;
    property Limite: Currency read FLimite write FLimite;
    property Foto: RawBlob read FFoto write FFoto;
  end;

  TOrmClienteObjArray = array of TOrmCliente;

  TClienteRepository = class
  private
    FOrm: IRestOrm;
  public
    constructor Create(const AOrm: IRestOrm);
    function Add(ACliente: TOrmCliente): TID;
    function ExistsCpfCnpjOrRgIe(const ACpfCnpj, ARgIe: RawUtf8; AExceptId: TID): Boolean;
    function FindById(AId: TID): TOrmCliente;
    function ListAll: TOrmClienteObjArray;
    function ListByCidade(ACodCidade: Int64): TOrmClienteObjArray;
    function Update(ACliente: TOrmCliente): Boolean;
    function Delete(AId: TID): Boolean;
  end;

function CreateClienteModel: TOrmModel;

implementation

constructor TClienteRepository.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  if AOrm = nil then
    raise EArgumentException.Create('ORM do Cliente nao informado');
  FOrm := AOrm;
end;

function TClienteRepository.Add(ACliente: TOrmCliente): TID;
begin
  Result := FOrm.Add(ACliente, {senddata=}True);
end;

function TClienteRepository.ExistsCpfCnpjOrRgIe(const ACpfCnpj, ARgIe: RawUtf8;
  AExceptId: TID): Boolean;
begin
  Result := FOrm.OneFieldValue(TOrmCliente, 'RowID',
    '((CpfCnpj=? and CpfCnpj<>'''') or (RgIe=? and RgIe<>'''')) and RowID<>?',
    [ACpfCnpj, ARgIe, AExceptId]) <> '';
end;

function TClienteRepository.FindById(AId: TID): TOrmCliente;
begin
  Result := TOrmCliente.Create(FOrm, AId);
  if Result.ID = 0 then
    FreeAndNil(Result);
end;

function TClienteRepository.ListAll: TOrmClienteObjArray;
begin
  Result := nil;
  if not FOrm.RetrieveListObjArray(Result, TOrmCliente, 'order by Nome', [], '*') then
    ObjArrayClear(Result);
end;

function TClienteRepository.ListByCidade(ACodCidade: Int64): TOrmClienteObjArray;
begin
  Result := nil;
  if not FOrm.RetrieveListObjArray(Result, TOrmCliente,
    'CodCidade=? order by Nome', [ACodCidade], '*') then
    ObjArrayClear(Result);
end;

function TClienteRepository.Update(ACliente: TOrmCliente): Boolean;
begin
  Result := (ACliente <> nil) and (ACliente.ID > 0) and FOrm.Update(ACliente);
end;

function TClienteRepository.Delete(AId: TID): Boolean;
begin
  Result := FOrm.Delete(TOrmCliente, AId);
end;

function CreateClienteModel: TOrmModel;
begin
  Result := TOrmModel.Create([TOrmCliente], 'api');
end;

end.
