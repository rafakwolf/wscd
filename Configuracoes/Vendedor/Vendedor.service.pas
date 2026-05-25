unit Vendedor.service;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.json,
  mormot.core.unicode,
  mormot.orm.core,
  Vendedor.repository;

const
  __TVendedorInput = 'Vendedor: RawUtf8; Ativo: RawUtf8';
  __TVendedorOutput = 'IDVendedor: Int64; Vendedor: RawUtf8; Ativo: RawUtf8';

type
  EVendedorValidation = class(Exception);
  EVendedorNotFound = class(Exception);

  TVendedorInput = packed record
    Vendedor: RawUtf8;
    Ativo: RawUtf8;
  end;

  TVendedorOutput = packed record
    IDVendedor: Int64;
    Vendedor: RawUtf8;
    Ativo: RawUtf8;
  end;

  TVendedorOutputDynArray = array of TVendedorOutput;

  TVendedorService = class
  private
    FRepository: TVendedorRepository;
    class function IsBlank(const AValue: RawUtf8): Boolean; static;
    class function NormalizeAtivo(const AValue: RawUtf8): RawUtf8; static;
    class function Utf8CharCount(const AValue: RawUtf8): Integer; static;
    class function ToOutput(AVendedor: TOrmVendedor): TVendedorOutput; static;
    procedure ApplyInput(AVendedor: TOrmVendedor; const AInput: TVendedorInput);
    procedure ValidateForSave(const AInput: TVendedorInput);
  public
    constructor Create(ARepository: TVendedorRepository);
    function CreateItem(const AInput: TVendedorInput): TVendedorOutput;
    function GetItem(AId: TID): TVendedorOutput;
    function ListItems: TVendedorOutputDynArray;
    function UpdateItem(AId: TID; const AInput: TVendedorInput): TVendedorOutput;
    procedure DeleteItem(AId: TID);
  end;

implementation

constructor TVendedorService.Create(ARepository: TVendedorRepository);
begin
  inherited Create;
  if ARepository = nil then
    raise EArgumentException.Create('Repositorio do Vendedor nao informado');
  FRepository := ARepository;
end;

class function TVendedorService.IsBlank(const AValue: RawUtf8): Boolean;
begin
  Result := Trim(Utf8ToString(AValue)) = '';
end;

class function TVendedorService.NormalizeAtivo(const AValue: RawUtf8): RawUtf8;
var
  Value: string;
begin
  Value := UpperCase(Trim(Utf8ToString(AValue)));
  if Value = '' then
    Value := 'S';
  Result := StringToUtf8(Value);
end;

class function TVendedorService.Utf8CharCount(const AValue: RawUtf8): Integer;
begin
  Result := Length(Utf8ToString(AValue));
end;

class function TVendedorService.ToOutput(AVendedor: TOrmVendedor): TVendedorOutput;
begin
  FillChar(Result, SizeOf(Result), 0);
  if AVendedor = nil then
    Exit;
  Result.IDVendedor := AVendedor.ID;
  Result.Vendedor := AVendedor.Vendedor;
  Result.Ativo := AVendedor.Ativo;
end;

procedure TVendedorService.ApplyInput(AVendedor: TOrmVendedor; const AInput: TVendedorInput);
begin
  AVendedor.Vendedor := AInput.Vendedor;
  AVendedor.Ativo := NormalizeAtivo(AInput.Ativo);
end;

procedure TVendedorService.ValidateForSave(const AInput: TVendedorInput);
var
  Ativo: RawUtf8;
begin
  if IsBlank(AInput.Vendedor) then
    raise EVendedorValidation.Create('Vendedor e obrigatorio');
  if Utf8CharCount(AInput.Vendedor) > 80 then
    raise EVendedorValidation.Create('Vendedor deve ter no maximo 80 caracteres');

  Ativo := NormalizeAtivo(AInput.Ativo);
  if (Ativo <> 'S') and (Ativo <> 'N') then
    raise EVendedorValidation.Create('Ativo deve ser S ou N');
end;

function TVendedorService.CreateItem(const AInput: TVendedorInput): TVendedorOutput;
var
  Vendedor: TOrmVendedor;
  NewId: TID;
begin
  ValidateForSave(AInput);
  Vendedor := TOrmVendedor.Create;
  try
    ApplyInput(Vendedor, AInput);
    NewId := FRepository.Add(Vendedor);
    if NewId <= 0 then
      raise EVendedorValidation.Create('Vendedor nao foi criado');
    Vendedor.IDValue := NewId;
    Result := ToOutput(Vendedor);
  finally
    Vendedor.Free;
  end;
end;

function TVendedorService.GetItem(AId: TID): TVendedorOutput;
var
  Vendedor: TOrmVendedor;
begin
  Vendedor := FRepository.FindById(AId);
  try
    if Vendedor = nil then
      raise EVendedorNotFound.CreateFmt('Vendedor %d nao encontrado', [AId]);
    Result := ToOutput(Vendedor);
  finally
    Vendedor.Free;
  end;
end;

function TVendedorService.ListItems: TVendedorOutputDynArray;
var
  Items: TOrmVendedorObjArray;
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

function TVendedorService.UpdateItem(AId: TID; const AInput: TVendedorInput): TVendedorOutput;
var
  Vendedor: TOrmVendedor;
begin
  ValidateForSave(AInput);
  Vendedor := FRepository.FindById(AId);
  try
    if Vendedor = nil then
      raise EVendedorNotFound.CreateFmt('Vendedor %d nao encontrado', [AId]);
    ApplyInput(Vendedor, AInput);
    if not FRepository.Update(Vendedor) then
      raise EVendedorValidation.Create('Vendedor nao foi atualizado');
    Result := ToOutput(Vendedor);
  finally
    Vendedor.Free;
  end;
end;

procedure TVendedorService.DeleteItem(AId: TID);
begin
  if not FRepository.Delete(AId) then
    raise EVendedorNotFound.CreateFmt('Vendedor %d nao encontrado', [AId]);
end;

end.
