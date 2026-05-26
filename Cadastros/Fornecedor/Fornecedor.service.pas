unit Fornecedor.service;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.json,
  mormot.core.unicode,
  mormot.orm.core,
  Fornecedor.repository;

const
  __TFornecedorInput = 'Fantazia: RawUtf8; RazaoSocial: RawUtf8; DataCad: TDateTime; Endereco: RawUtf8; Cidade: Int64; Bairro: RawUtf8; Cnpj: RawUtf8; Ie: RawUtf8; Cep: RawUtf8; Telefone: RawUtf8; Fax: RawUtf8; Email: RawUtf8; Uf: RawUtf8; Obs: RawUtf8; Vendedor: RawUtf8; TelefoneVendedor: RawUtf8; EmailVendedor: RawUtf8; Tipo: RawUtf8';
  __TFornecedorOutput = 'IDFornecedor: Int64; Fantazia: RawUtf8; RazaoSocial: RawUtf8; DataCad: TDateTime; Endereco: RawUtf8; Cidade: Int64; Bairro: RawUtf8; Cnpj: RawUtf8; Ie: RawUtf8; Cep: RawUtf8; Telefone: RawUtf8; Fax: RawUtf8; Email: RawUtf8; Uf: RawUtf8; Obs: RawUtf8; Vendedor: RawUtf8; TelefoneVendedor: RawUtf8; EmailVendedor: RawUtf8; Tipo: RawUtf8';

type
  EFornecedorValidation = class(Exception);
  EFornecedorNotFound = class(Exception);

  TFornecedorInput = packed record
    Fantazia: RawUtf8;
    RazaoSocial: RawUtf8;
    DataCad: TDateTime;
    Endereco: RawUtf8;
    Cidade: Int64;
    Bairro: RawUtf8;
    Cnpj: RawUtf8;
    Ie: RawUtf8;
    Cep: RawUtf8;
    Telefone: RawUtf8;
    Fax: RawUtf8;
    Email: RawUtf8;
    Uf: RawUtf8;
    Obs: RawUtf8;
    Vendedor: RawUtf8;
    TelefoneVendedor: RawUtf8;
    EmailVendedor: RawUtf8;
    Tipo: RawUtf8;
  end;

  TFornecedorOutput = packed record
    IDFornecedor: Int64;
    Fantazia: RawUtf8;
    RazaoSocial: RawUtf8;
    DataCad: TDateTime;
    Endereco: RawUtf8;
    Cidade: Int64;
    Bairro: RawUtf8;
    Cnpj: RawUtf8;
    Ie: RawUtf8;
    Cep: RawUtf8;
    Telefone: RawUtf8;
    Fax: RawUtf8;
    Email: RawUtf8;
    Uf: RawUtf8;
    Obs: RawUtf8;
    Vendedor: RawUtf8;
    TelefoneVendedor: RawUtf8;
    EmailVendedor: RawUtf8;
    Tipo: RawUtf8;
  end;

  TFornecedorOutputDynArray = array of TFornecedorOutput;

  TFornecedorService = class
  private
    FRepository: TFornecedorRepository;
    class function IsBlank(const AValue: RawUtf8): Boolean; static;
    class function NormalizeTipo(const AValue: RawUtf8): RawUtf8; static;
    class function NormalizeUf(const AValue: RawUtf8): RawUtf8; static;
    class function Utf8CharCount(const AValue: RawUtf8): Integer; static;
    class function ToOutput(AFornecedor: TOrmFornecedor): TFornecedorOutput; static;
    procedure ApplyInput(AFornecedor: TOrmFornecedor;
      const AInput: TFornecedorInput; AIsCreate: Boolean);
    procedure ValidateForSave(const AInput: TFornecedorInput; AId: TID);
  public
    constructor Create(ARepository: TFornecedorRepository);
    function CreateItem(const AInput: TFornecedorInput): TFornecedorOutput;
    function GetItem(AId: TID): TFornecedorOutput;
    function ListItems(ACidade: Int64 = 0): TFornecedorOutputDynArray;
    function UpdateItem(AId: TID; const AInput: TFornecedorInput): TFornecedorOutput;
    procedure DeleteItem(AId: TID);
  end;

implementation

constructor TFornecedorService.Create(ARepository: TFornecedorRepository);
begin
  inherited Create;
  if ARepository = nil then
    raise EArgumentException.Create('Repositorio do Fornecedor nao informado');
  FRepository := ARepository;
end;

class function TFornecedorService.IsBlank(const AValue: RawUtf8): Boolean;
begin
  Result := Trim(Utf8ToString(AValue)) = '';
end;

class function TFornecedorService.NormalizeTipo(const AValue: RawUtf8): RawUtf8;
var
  Value: string;
begin
  Value := UpperCase(Trim(Utf8ToString(AValue)));
  if Value = '' then
    Value := 'J'
  else
    Value := Copy(Value, 1, 1);
  Result := StringToUtf8(Value);
end;

class function TFornecedorService.NormalizeUf(const AValue: RawUtf8): RawUtf8;
begin
  Result := StringToUtf8(UpperCase(Trim(Utf8ToString(AValue))));
end;

class function TFornecedorService.Utf8CharCount(const AValue: RawUtf8): Integer;
begin
  Result := Length(Utf8ToString(AValue));
end;

class function TFornecedorService.ToOutput(
  AFornecedor: TOrmFornecedor): TFornecedorOutput;
begin
  FillChar(Result, SizeOf(Result), 0);
  if AFornecedor = nil then
    Exit;
  Result.IDFornecedor := AFornecedor.ID;
  Result.Fantazia := AFornecedor.Fantazia;
  Result.RazaoSocial := AFornecedor.RazaoSocial;
  Result.DataCad := AFornecedor.DataCad;
  Result.Endereco := AFornecedor.Endereco;
  Result.Cidade := AFornecedor.Cidade;
  Result.Bairro := AFornecedor.Bairro;
  Result.Cnpj := AFornecedor.Cnpj;
  Result.Ie := AFornecedor.Ie;
  Result.Cep := AFornecedor.Cep;
  Result.Telefone := AFornecedor.Telefone;
  Result.Fax := AFornecedor.Fax;
  Result.Email := AFornecedor.Email;
  Result.Uf := AFornecedor.Uf;
  Result.Obs := AFornecedor.Obs;
  Result.Vendedor := AFornecedor.Vendedor;
  Result.TelefoneVendedor := AFornecedor.TelefoneVendedor;
  Result.EmailVendedor := AFornecedor.EmailVendedor;
  Result.Tipo := AFornecedor.Tipo;
end;

procedure TFornecedorService.ApplyInput(AFornecedor: TOrmFornecedor;
  const AInput: TFornecedorInput; AIsCreate: Boolean);
begin
  AFornecedor.Fantazia := AInput.Fantazia;
  AFornecedor.RazaoSocial := AInput.RazaoSocial;
  if AInput.DataCad > 0 then
    AFornecedor.DataCad := AInput.DataCad
  else if AIsCreate then
    AFornecedor.DataCad := Date;
  AFornecedor.Endereco := AInput.Endereco;
  AFornecedor.Cidade := AInput.Cidade;
  AFornecedor.Bairro := AInput.Bairro;
  AFornecedor.Cnpj := AInput.Cnpj;
  AFornecedor.Ie := AInput.Ie;
  AFornecedor.Cep := AInput.Cep;
  AFornecedor.Telefone := AInput.Telefone;
  AFornecedor.Fax := AInput.Fax;
  AFornecedor.Email := AInput.Email;
  AFornecedor.Uf := NormalizeUf(AInput.Uf);
  AFornecedor.Obs := AInput.Obs;
  AFornecedor.Vendedor := AInput.Vendedor;
  AFornecedor.TelefoneVendedor := AInput.TelefoneVendedor;
  AFornecedor.EmailVendedor := AInput.EmailVendedor;
  AFornecedor.Tipo := NormalizeTipo(AInput.Tipo);
end;

procedure TFornecedorService.ValidateForSave(const AInput: TFornecedorInput;
  AId: TID);
var
  Tipo: RawUtf8;
begin
  Tipo := NormalizeTipo(AInput.Tipo);
  if (Tipo <> 'F') and (Tipo <> 'J') then
    raise EFornecedorValidation.Create('Tipo deve ser F ou J');
  if IsBlank(AInput.RazaoSocial) then
    raise EFornecedorValidation.Create('RazaoSocial e obrigatoria');
  if AInput.Cidade <= 0 then
    raise EFornecedorValidation.Create('Cidade e obrigatoria');
  if IsBlank(AInput.Cnpj) then
    raise EFornecedorValidation.Create('Cnpj e obrigatorio');
  if IsBlank(AInput.Telefone) then
    raise EFornecedorValidation.Create('Telefone e obrigatorio');
  if IsBlank(AInput.Vendedor) then
    raise EFornecedorValidation.Create('Vendedor e obrigatorio');
  if IsBlank(AInput.TelefoneVendedor) then
    raise EFornecedorValidation.Create('TelefoneVendedor e obrigatorio');
  if FRepository.ExistsCnpj(AInput.Cnpj, AId) then
    raise EFornecedorValidation.Create('Fornecedor com este CNPJ ja esta cadastrado');

  if Utf8CharCount(AInput.Fantazia) > 80 then
    raise EFornecedorValidation.Create('Fantazia deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.RazaoSocial) > 80 then
    raise EFornecedorValidation.Create('RazaoSocial deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.Endereco) > 80 then
    raise EFornecedorValidation.Create('Endereco deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.Bairro) > 80 then
    raise EFornecedorValidation.Create('Bairro deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.Cnpj) > 20 then
    raise EFornecedorValidation.Create('Cnpj deve ter no maximo 20 caracteres');
  if Utf8CharCount(AInput.Ie) > 20 then
    raise EFornecedorValidation.Create('Ie deve ter no maximo 20 caracteres');
  if Utf8CharCount(AInput.Cep) > 10 then
    raise EFornecedorValidation.Create('Cep deve ter no maximo 10 caracteres');
  if Utf8CharCount(AInput.Telefone) > 20 then
    raise EFornecedorValidation.Create('Telefone deve ter no maximo 20 caracteres');
  if Utf8CharCount(AInput.Fax) > 20 then
    raise EFornecedorValidation.Create('Fax deve ter no maximo 20 caracteres');
  if Utf8CharCount(AInput.Email) > 80 then
    raise EFornecedorValidation.Create('Email deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.Uf) > 2 then
    raise EFornecedorValidation.Create('Uf deve ter no maximo 2 caracteres');
  if Utf8CharCount(AInput.Vendedor) > 80 then
    raise EFornecedorValidation.Create('Vendedor deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.TelefoneVendedor) > 20 then
    raise EFornecedorValidation.Create('TelefoneVendedor deve ter no maximo 20 caracteres');
  if Utf8CharCount(AInput.EmailVendedor) > 80 then
    raise EFornecedorValidation.Create('EmailVendedor deve ter no maximo 80 caracteres');
end;

function TFornecedorService.CreateItem(
  const AInput: TFornecedorInput): TFornecedorOutput;
var
  Fornecedor: TOrmFornecedor;
  NewId: TID;
begin
  ValidateForSave(AInput, 0);
  Fornecedor := TOrmFornecedor.Create;
  try
    ApplyInput(Fornecedor, AInput, {AIsCreate=}True);
    NewId := FRepository.Add(Fornecedor);
    if NewId <= 0 then
      raise EFornecedorValidation.Create('Fornecedor nao foi criado');
    Fornecedor.IDValue := NewId;
    Result := ToOutput(Fornecedor);
  finally
    Fornecedor.Free;
  end;
end;

function TFornecedorService.GetItem(AId: TID): TFornecedorOutput;
var
  Fornecedor: TOrmFornecedor;
begin
  Fornecedor := FRepository.FindById(AId);
  try
    if Fornecedor = nil then
      raise EFornecedorNotFound.CreateFmt('Fornecedor %d nao encontrado', [AId]);
    Result := ToOutput(Fornecedor);
  finally
    Fornecedor.Free;
  end;
end;

function TFornecedorService.ListItems(
  ACidade: Int64): TFornecedorOutputDynArray;
var
  Items: TOrmFornecedorObjArray;
  I: PtrInt;
begin
  if ACidade > 0 then
    Items := FRepository.ListByCidade(ACidade)
  else
    Items := FRepository.ListAll;
  try
    SetLength(Result, Length(Items));
    for I := 0 to High(Items) do
      Result[I] := ToOutput(Items[I]);
  finally
    ObjArrayClear(Items);
  end;
end;

function TFornecedorService.UpdateItem(AId: TID;
  const AInput: TFornecedorInput): TFornecedorOutput;
var
  Fornecedor: TOrmFornecedor;
begin
  ValidateForSave(AInput, AId);
  Fornecedor := FRepository.FindById(AId);
  try
    if Fornecedor = nil then
      raise EFornecedorNotFound.CreateFmt('Fornecedor %d nao encontrado', [AId]);
    ApplyInput(Fornecedor, AInput, {AIsCreate=}False);
    if not FRepository.Update(Fornecedor) then
      raise EFornecedorValidation.Create('Fornecedor nao foi atualizado');
    Result := ToOutput(Fornecedor);
  finally
    Fornecedor.Free;
  end;
end;

procedure TFornecedorService.DeleteItem(AId: TID);
begin
  if not FRepository.Delete(AId) then
    raise EFornecedorNotFound.CreateFmt('Fornecedor %d nao encontrado', [AId]);
end;

end.
