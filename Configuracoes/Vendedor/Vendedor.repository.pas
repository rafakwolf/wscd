unit Vendedor.repository;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.orm.core,
  mormot.orm.rest;

type
  TOrmVendedor = class(TOrm)
  private
    FVendedor: RawUtf8;
    FAtivo: RawUtf8;
  published
    property Vendedor: RawUtf8 index 80 read FVendedor write FVendedor;
    property Ativo: RawUtf8 index 1 read FAtivo write FAtivo;
  end;

  TOrmVendedorObjArray = array of TOrmVendedor;

  TVendedorRepository = class
  private
    FOrm: IRestOrm;
  public
    constructor Create(const AOrm: IRestOrm);
    function Add(AVendedor: TOrmVendedor): TID;
    function FindById(AId: TID): TOrmVendedor;
    function ListAll: TOrmVendedorObjArray;
    function Update(AVendedor: TOrmVendedor): Boolean;
    function Delete(AId: TID): Boolean;
  end;

function CreateVendedorModel: TOrmModel;

implementation

constructor TVendedorRepository.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  if AOrm = nil then
    raise EArgumentException.Create('ORM do Vendedor nao informado');
  FOrm := AOrm;
end;

function TVendedorRepository.Add(AVendedor: TOrmVendedor): TID;
begin
  Result := FOrm.Add(AVendedor, {senddata=}True);
end;

function TVendedorRepository.FindById(AId: TID): TOrmVendedor;
begin
  Result := TOrmVendedor.Create(FOrm, AId);
  if Result.ID = 0 then
    FreeAndNil(Result);
end;

function TVendedorRepository.ListAll: TOrmVendedorObjArray;
begin
  Result := nil;
  if not FOrm.RetrieveListObjArray(Result, TOrmVendedor, 'order by Vendedor', []) then
    ObjArrayClear(Result);
end;

function TVendedorRepository.Update(AVendedor: TOrmVendedor): Boolean;
begin
  Result := (AVendedor <> nil) and (AVendedor.ID > 0) and FOrm.Update(AVendedor);
end;

function TVendedorRepository.Delete(AId: TID): Boolean;
begin
  Result := FOrm.Delete(TOrmVendedor, AId);
end;

function CreateVendedorModel: TOrmModel;
begin
  Result := TOrmModel.Create([TOrmVendedor], 'api');
end;

end.
