unit Fornecedor.repository;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.orm.core,
  mormot.orm.rest;

type
  TOrmFornecedor = class(TOrm)
  private
    FBairro: RawUtf8;
    FCep: RawUtf8;
    FCidade: Int64;
    FCnpj: RawUtf8;
    FDataCad: TDateTime;
    FEmail: RawUtf8;
    FEmailVendedor: RawUtf8;
    FEndereco: RawUtf8;
    FFantazia: RawUtf8;
    FFax: RawUtf8;
    FIe: RawUtf8;
    FObs: RawUtf8;
    FRazaoSocial: RawUtf8;
    FTelefone: RawUtf8;
    FTelefoneVendedor: RawUtf8;
    FTipo: RawUtf8;
    FUf: RawUtf8;
    FVendedor: RawUtf8;
  published
    property Fantazia: RawUtf8 index 80 read FFantazia write FFantazia;
    property RazaoSocial: RawUtf8 index 80 read FRazaoSocial write FRazaoSocial;
    property DataCad: TDateTime read FDataCad write FDataCad;
    property Endereco: RawUtf8 index 80 read FEndereco write FEndereco;
    property Cidade: Int64 read FCidade write FCidade;
    property Bairro: RawUtf8 index 80 read FBairro write FBairro;
    property Cnpj: RawUtf8 index 20 read FCnpj write FCnpj;
    property Ie: RawUtf8 index 20 read FIe write FIe;
    property Cep: RawUtf8 index 10 read FCep write FCep;
    property Telefone: RawUtf8 index 20 read FTelefone write FTelefone;
    property Fax: RawUtf8 index 20 read FFax write FFax;
    property Email: RawUtf8 index 80 read FEmail write FEmail;
    property Uf: RawUtf8 index 2 read FUf write FUf;
    property Obs: RawUtf8 read FObs write FObs;
    property Vendedor: RawUtf8 index 80 read FVendedor write FVendedor;
    property TelefoneVendedor: RawUtf8 index 20 read FTelefoneVendedor write FTelefoneVendedor;
    property EmailVendedor: RawUtf8 index 80 read FEmailVendedor write FEmailVendedor;
    property Tipo: RawUtf8 index 1 read FTipo write FTipo;
  end;

  TOrmFornecedorObjArray = array of TOrmFornecedor;

  TFornecedorRepository = class
  private
    FOrm: IRestOrm;
  public
    constructor Create(const AOrm: IRestOrm);
    function Add(AFornecedor: TOrmFornecedor): TID;
    function ExistsCnpj(const ACnpj: RawUtf8; AExceptId: TID): Boolean;
    function FindById(AId: TID): TOrmFornecedor;
    function ListAll: TOrmFornecedorObjArray;
    function ListByCidade(ACidade: Int64): TOrmFornecedorObjArray;
    function Update(AFornecedor: TOrmFornecedor): Boolean;
    function Delete(AId: TID): Boolean;
  end;

function CreateFornecedorModel: TOrmModel;

implementation

constructor TFornecedorRepository.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  if AOrm = nil then
    raise EArgumentException.Create('ORM do Fornecedor nao informado');
  FOrm := AOrm;
end;

function TFornecedorRepository.Add(AFornecedor: TOrmFornecedor): TID;
begin
  Result := FOrm.Add(AFornecedor, {senddata=}True);
end;

function TFornecedorRepository.ExistsCnpj(const ACnpj: RawUtf8;
  AExceptId: TID): Boolean;
begin
  Result := FOrm.OneFieldValue(TOrmFornecedor, 'RowID',
    'Cnpj=? and Cnpj<>'''' and RowID<>?', [ACnpj, AExceptId]) <> '';
end;

function TFornecedorRepository.FindById(AId: TID): TOrmFornecedor;
begin
  Result := TOrmFornecedor.Create(FOrm, AId);
  if Result.ID = 0 then
    FreeAndNil(Result);
end;

function TFornecedorRepository.ListAll: TOrmFornecedorObjArray;
begin
  Result := nil;
  if not FOrm.RetrieveListObjArray(Result, TOrmFornecedor,
    'order by RazaoSocial', [], '*') then
    ObjArrayClear(Result);
end;

function TFornecedorRepository.ListByCidade(
  ACidade: Int64): TOrmFornecedorObjArray;
begin
  Result := nil;
  if not FOrm.RetrieveListObjArray(Result, TOrmFornecedor,
    'Cidade=? order by RazaoSocial', [ACidade], '*') then
    ObjArrayClear(Result);
end;

function TFornecedorRepository.Update(AFornecedor: TOrmFornecedor): Boolean;
begin
  Result := (AFornecedor <> nil) and (AFornecedor.ID > 0) and
    FOrm.Update(AFornecedor);
end;

function TFornecedorRepository.Delete(AId: TID): Boolean;
begin
  Result := FOrm.Delete(TOrmFornecedor, AId);
end;

function CreateFornecedorModel: TOrmModel;
begin
  Result := TOrmModel.Create([TOrmFornecedor], 'api');
end;

end.
