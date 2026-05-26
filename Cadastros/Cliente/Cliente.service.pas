unit Cliente.service;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  DateUtils,
  mormot.core.base,
  mormot.core.json,
  mormot.core.unicode,
  mormot.orm.core,
  Cliente.repository;

const
  __TClienteInput = 'Tipo: RawUtf8; Nome: RawUtf8; Endereco: RawUtf8; Cep: RawUtf8; Bairro: RawUtf8; Telefone: RawUtf8; Fax: RawUtf8; CodCidade: Int64; Uf: RawUtf8; TempoMoradia: RawUtf8; EndAnterior: RawUtf8; Email: RawUtf8; Trabalho: RawUtf8; Cargo: RawUtf8; DataInicio: TDateTime; Salario: Currency; EstadoCivil: RawUtf8; Conjugue: RawUtf8; LocalTrab: RawUtf8; DataNasc: TDateTime; Pai: RawUtf8; Mae: RawUtf8; CpfCnpj: RawUtf8; RgIe: RawUtf8; ReferPes: RawUtf8; ReferCom: RawUtf8; FoneCom: RawUtf8; Cadastro: TDateTime; Obs: RawUtf8; Naturalidade: RawUtf8; Limite: Currency; Foto: RawBlob';
  __TClienteOutput = 'IDCliente: Int64; Tipo: RawUtf8; Nome: RawUtf8; Endereco: RawUtf8; Cep: RawUtf8; Bairro: RawUtf8; Telefone: RawUtf8; Fax: RawUtf8; CodCidade: Int64; Uf: RawUtf8; TempoMoradia: RawUtf8; EndAnterior: RawUtf8; Email: RawUtf8; Trabalho: RawUtf8; Cargo: RawUtf8; DataInicio: TDateTime; Salario: Currency; EstadoCivil: RawUtf8; Conjugue: RawUtf8; LocalTrab: RawUtf8; DataNasc: TDateTime; Pai: RawUtf8; Mae: RawUtf8; CpfCnpj: RawUtf8; RgIe: RawUtf8; ReferPes: RawUtf8; ReferCom: RawUtf8; FoneCom: RawUtf8; Cadastro: TDateTime; Obs: RawUtf8; Naturalidade: RawUtf8; Limite: Currency; Foto: RawBlob';

type
  EClienteValidation = class(Exception);
  EClienteNotFound = class(Exception);

  TClienteInput = packed record
    Tipo: RawUtf8;
    Nome: RawUtf8;
    Endereco: RawUtf8;
    Cep: RawUtf8;
    Bairro: RawUtf8;
    Telefone: RawUtf8;
    Fax: RawUtf8;
    CodCidade: Int64;
    Uf: RawUtf8;
    TempoMoradia: RawUtf8;
    EndAnterior: RawUtf8;
    Email: RawUtf8;
    Trabalho: RawUtf8;
    Cargo: RawUtf8;
    DataInicio: TDateTime;
    Salario: Currency;
    EstadoCivil: RawUtf8;
    Conjugue: RawUtf8;
    LocalTrab: RawUtf8;
    DataNasc: TDateTime;
    Pai: RawUtf8;
    Mae: RawUtf8;
    CpfCnpj: RawUtf8;
    RgIe: RawUtf8;
    ReferPes: RawUtf8;
    ReferCom: RawUtf8;
    FoneCom: RawUtf8;
    Cadastro: TDateTime;
    Obs: RawUtf8;
    Naturalidade: RawUtf8;
    Limite: Currency;
    Foto: RawBlob;
  end;

  TClienteOutput = packed record
    IDCliente: Int64;
    Tipo: RawUtf8;
    Nome: RawUtf8;
    Endereco: RawUtf8;
    Cep: RawUtf8;
    Bairro: RawUtf8;
    Telefone: RawUtf8;
    Fax: RawUtf8;
    CodCidade: Int64;
    Uf: RawUtf8;
    TempoMoradia: RawUtf8;
    EndAnterior: RawUtf8;
    Email: RawUtf8;
    Trabalho: RawUtf8;
    Cargo: RawUtf8;
    DataInicio: TDateTime;
    Salario: Currency;
    EstadoCivil: RawUtf8;
    Conjugue: RawUtf8;
    LocalTrab: RawUtf8;
    DataNasc: TDateTime;
    Pai: RawUtf8;
    Mae: RawUtf8;
    CpfCnpj: RawUtf8;
    RgIe: RawUtf8;
    ReferPes: RawUtf8;
    ReferCom: RawUtf8;
    FoneCom: RawUtf8;
    Cadastro: TDateTime;
    Obs: RawUtf8;
    Naturalidade: RawUtf8;
    Limite: Currency;
    Foto: RawBlob;
  end;

  TClienteOutputDynArray = array of TClienteOutput;

  TClienteService = class
  private
    FRepository: TClienteRepository;
    FMinIdadeCliente: Integer;
    class function IsBlank(const AValue: RawUtf8): Boolean; static;
    class function NormalizeFirstChar(const AValue, ADefault: RawUtf8): RawUtf8; static;
    class function NormalizeUf(const AValue: RawUtf8): RawUtf8; static;
    class function Utf8CharCount(const AValue: RawUtf8): Integer; static;
    class function ToOutput(ACliente: TOrmCliente): TClienteOutput; static;
    procedure ApplyInput(ACliente: TOrmCliente; const AInput: TClienteInput;
      AIsCreate: Boolean);
    procedure ValidateForSave(const AInput: TClienteInput; AId: TID);
  public
    constructor Create(ARepository: TClienteRepository; AMinIdadeCliente: Integer = 0);
    function CreateItem(const AInput: TClienteInput): TClienteOutput;
    function GetItem(AId: TID): TClienteOutput;
    function ListItems(ACodCidade: Int64 = 0): TClienteOutputDynArray;
    function UpdateItem(AId: TID; const AInput: TClienteInput): TClienteOutput;
    procedure DeleteItem(AId: TID);
  end;

implementation

constructor TClienteService.Create(ARepository: TClienteRepository;
  AMinIdadeCliente: Integer);
begin
  inherited Create;
  if ARepository = nil then
    raise EArgumentException.Create('Repositorio do Cliente nao informado');
  FRepository := ARepository;
  FMinIdadeCliente := AMinIdadeCliente;
end;

class function TClienteService.IsBlank(const AValue: RawUtf8): Boolean;
begin
  Result := Trim(Utf8ToString(AValue)) = '';
end;

class function TClienteService.NormalizeFirstChar(const AValue,
  ADefault: RawUtf8): RawUtf8;
var
  Value: string;
begin
  Value := UpperCase(Trim(Utf8ToString(AValue)));
  if Value = '' then
    Value := Utf8ToString(ADefault)
  else
    Value := Copy(Value, 1, 1);
  Result := StringToUtf8(Value);
end;

class function TClienteService.NormalizeUf(const AValue: RawUtf8): RawUtf8;
begin
  Result := StringToUtf8(UpperCase(Trim(Utf8ToString(AValue))));
end;

class function TClienteService.Utf8CharCount(const AValue: RawUtf8): Integer;
begin
  Result := Length(Utf8ToString(AValue));
end;

class function TClienteService.ToOutput(ACliente: TOrmCliente): TClienteOutput;
begin
  FillChar(Result, SizeOf(Result), 0);
  if ACliente = nil then
    Exit;
  Result.IDCliente := ACliente.ID;
  Result.Tipo := ACliente.Tipo;
  Result.Nome := ACliente.Nome;
  Result.Endereco := ACliente.Endereco;
  Result.Cep := ACliente.Cep;
  Result.Bairro := ACliente.Bairro;
  Result.Telefone := ACliente.Telefone;
  Result.Fax := ACliente.Fax;
  Result.CodCidade := ACliente.CodCidade;
  Result.Uf := ACliente.Uf;
  Result.TempoMoradia := ACliente.TempoMoradia;
  Result.EndAnterior := ACliente.EndAnterior;
  Result.Email := ACliente.Email;
  Result.Trabalho := ACliente.Trabalho;
  Result.Cargo := ACliente.Cargo;
  Result.DataInicio := ACliente.DataInicio;
  Result.Salario := ACliente.Salario;
  Result.EstadoCivil := ACliente.EstadoCivil;
  Result.Conjugue := ACliente.Conjugue;
  Result.LocalTrab := ACliente.LocalTrab;
  Result.DataNasc := ACliente.DataNasc;
  Result.Pai := ACliente.Pai;
  Result.Mae := ACliente.Mae;
  Result.CpfCnpj := ACliente.CpfCnpj;
  Result.RgIe := ACliente.RgIe;
  Result.ReferPes := ACliente.ReferPes;
  Result.ReferCom := ACliente.ReferCom;
  Result.FoneCom := ACliente.FoneCom;
  Result.Cadastro := ACliente.Cadastro;
  Result.Obs := ACliente.Obs;
  Result.Naturalidade := ACliente.Naturalidade;
  Result.Limite := ACliente.Limite;
  Result.Foto := ACliente.Foto;
end;

procedure TClienteService.ApplyInput(ACliente: TOrmCliente;
  const AInput: TClienteInput; AIsCreate: Boolean);
begin
  ACliente.Tipo := NormalizeFirstChar(AInput.Tipo, 'F');
  ACliente.Nome := AInput.Nome;
  ACliente.Endereco := AInput.Endereco;
  ACliente.Cep := AInput.Cep;
  ACliente.Bairro := AInput.Bairro;
  ACliente.Telefone := AInput.Telefone;
  ACliente.Fax := AInput.Fax;
  ACliente.CodCidade := AInput.CodCidade;
  ACliente.Uf := NormalizeUf(AInput.Uf);
  ACliente.TempoMoradia := AInput.TempoMoradia;
  ACliente.EndAnterior := AInput.EndAnterior;
  ACliente.Email := AInput.Email;
  ACliente.Trabalho := AInput.Trabalho;
  ACliente.Cargo := AInput.Cargo;
  ACliente.DataInicio := AInput.DataInicio;
  ACliente.Salario := AInput.Salario;
  ACliente.EstadoCivil := NormalizeFirstChar(AInput.EstadoCivil, '');
  ACliente.Conjugue := AInput.Conjugue;
  ACliente.LocalTrab := AInput.LocalTrab;
  ACliente.DataNasc := AInput.DataNasc;
  ACliente.Pai := AInput.Pai;
  ACliente.Mae := AInput.Mae;
  ACliente.CpfCnpj := AInput.CpfCnpj;
  ACliente.RgIe := AInput.RgIe;
  ACliente.ReferPes := AInput.ReferPes;
  ACliente.ReferCom := AInput.ReferCom;
  ACliente.FoneCom := AInput.FoneCom;
  if AInput.Cadastro > 0 then
    ACliente.Cadastro := AInput.Cadastro
  else if AIsCreate then
    ACliente.Cadastro := Date;
  ACliente.Obs := AInput.Obs;
  ACliente.Naturalidade := AInput.Naturalidade;
  ACliente.Limite := AInput.Limite;
  ACliente.Foto := AInput.Foto;
end;

procedure TClienteService.ValidateForSave(const AInput: TClienteInput; AId: TID);
var
  EstadoCivil: RawUtf8;
  Tipo: RawUtf8;
begin
  Tipo := NormalizeFirstChar(AInput.Tipo, 'F');
  if (Tipo <> 'F') and (Tipo <> 'J') then
    raise EClienteValidation.Create('Tipo deve ser F ou J');
  if IsBlank(AInput.Nome) then
    raise EClienteValidation.Create('Nome e obrigatorio');
  if AInput.CodCidade <= 0 then
    raise EClienteValidation.Create('CodCidade e obrigatorio');
  if AInput.DataNasc <= 0 then
    raise EClienteValidation.Create('DataNasc e obrigatoria');
  if IsBlank(AInput.CpfCnpj) then
    raise EClienteValidation.Create('CpfCnpj e obrigatorio');
  if IsBlank(AInput.RgIe) then
    raise EClienteValidation.Create('RgIe e obrigatorio');
  if (FMinIdadeCliente > 0) and
     (YearsBetween(Date, AInput.DataNasc) < FMinIdadeCliente) then
    raise EClienteValidation.Create('Cliente com idade menor que a permitida');
  if FRepository.ExistsCpfCnpjOrRgIe(AInput.CpfCnpj, AInput.RgIe, AId) then
    raise EClienteValidation.Create('Cliente com este CPF/CNPJ ou RG/IE ja esta cadastrado');

  EstadoCivil := NormalizeFirstChar(AInput.EstadoCivil, '');
  if (EstadoCivil <> '') and (EstadoCivil <> 'S') and (EstadoCivil <> 'C') and
     (EstadoCivil <> 'A') and (EstadoCivil <> 'V') then
    raise EClienteValidation.Create('EstadoCivil deve ser S, C, A ou V');
  if Utf8CharCount(AInput.Nome) > 80 then
    raise EClienteValidation.Create('Nome deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.Endereco) > 80 then
    raise EClienteValidation.Create('Endereco deve ter no maximo 80 caracteres');
  if Utf8CharCount(AInput.Cep) > 10 then
    raise EClienteValidation.Create('Cep deve ter no maximo 10 caracteres');
  if Utf8CharCount(AInput.Bairro) > 30 then
    raise EClienteValidation.Create('Bairro deve ter no maximo 30 caracteres');
  if Utf8CharCount(AInput.Telefone) > 15 then
    raise EClienteValidation.Create('Telefone deve ter no maximo 15 caracteres');
  if Utf8CharCount(AInput.Fax) > 15 then
    raise EClienteValidation.Create('Fax deve ter no maximo 15 caracteres');
  if Utf8CharCount(AInput.Uf) > 2 then
    raise EClienteValidation.Create('Uf deve ter no maximo 2 caracteres');
  if Utf8CharCount(AInput.TempoMoradia) > 30 then
    raise EClienteValidation.Create('TempoMoradia deve ter no maximo 30 caracteres');
  if Utf8CharCount(AInput.EndAnterior) > 50 then
    raise EClienteValidation.Create('EndAnterior deve ter no maximo 50 caracteres');
  if Utf8CharCount(AInput.Email) > 60 then
    raise EClienteValidation.Create('Email deve ter no maximo 60 caracteres');
  if Utf8CharCount(AInput.Trabalho) > 50 then
    raise EClienteValidation.Create('Trabalho deve ter no maximo 50 caracteres');
  if Utf8CharCount(AInput.Cargo) > 50 then
    raise EClienteValidation.Create('Cargo deve ter no maximo 50 caracteres');
  if Utf8CharCount(AInput.Conjugue) > 50 then
    raise EClienteValidation.Create('Conjugue deve ter no maximo 50 caracteres');
  if Utf8CharCount(AInput.LocalTrab) > 60 then
    raise EClienteValidation.Create('LocalTrab deve ter no maximo 60 caracteres');
  if Utf8CharCount(AInput.Pai) > 60 then
    raise EClienteValidation.Create('Pai deve ter no maximo 60 caracteres');
  if Utf8CharCount(AInput.Mae) > 60 then
    raise EClienteValidation.Create('Mae deve ter no maximo 60 caracteres');
  if Utf8CharCount(AInput.CpfCnpj) > 18 then
    raise EClienteValidation.Create('CpfCnpj deve ter no maximo 18 caracteres');
  if Utf8CharCount(AInput.RgIe) > 11 then
    raise EClienteValidation.Create('RgIe deve ter no maximo 11 caracteres');
  if Utf8CharCount(AInput.ReferPes) > 100 then
    raise EClienteValidation.Create('ReferPes deve ter no maximo 100 caracteres');
  if Utf8CharCount(AInput.ReferCom) > 100 then
    raise EClienteValidation.Create('ReferCom deve ter no maximo 100 caracteres');
  if Utf8CharCount(AInput.FoneCom) > 15 then
    raise EClienteValidation.Create('FoneCom deve ter no maximo 15 caracteres');
  if Utf8CharCount(AInput.Naturalidade) > 50 then
    raise EClienteValidation.Create('Naturalidade deve ter no maximo 50 caracteres');
end;

function TClienteService.CreateItem(const AInput: TClienteInput): TClienteOutput;
var
  Cliente: TOrmCliente;
  NewId: TID;
begin
  ValidateForSave(AInput, 0);
  Cliente := TOrmCliente.Create;
  try
    ApplyInput(Cliente, AInput, {AIsCreate=}True);
    NewId := FRepository.Add(Cliente);
    if NewId <= 0 then
      raise EClienteValidation.Create('Cliente nao foi criado');
    Cliente.IDValue := NewId;
    Result := ToOutput(Cliente);
  finally
    Cliente.Free;
  end;
end;

function TClienteService.GetItem(AId: TID): TClienteOutput;
var
  Cliente: TOrmCliente;
begin
  Cliente := FRepository.FindById(AId);
  try
    if Cliente = nil then
      raise EClienteNotFound.CreateFmt('Cliente %d nao encontrado', [AId]);
    Result := ToOutput(Cliente);
  finally
    Cliente.Free;
  end;
end;

function TClienteService.ListItems(ACodCidade: Int64): TClienteOutputDynArray;
var
  Items: TOrmClienteObjArray;
  I: PtrInt;
begin
  if ACodCidade > 0 then
    Items := FRepository.ListByCidade(ACodCidade)
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

function TClienteService.UpdateItem(AId: TID;
  const AInput: TClienteInput): TClienteOutput;
var
  Cliente: TOrmCliente;
begin
  ValidateForSave(AInput, AId);
  Cliente := FRepository.FindById(AId);
  try
    if Cliente = nil then
      raise EClienteNotFound.CreateFmt('Cliente %d nao encontrado', [AId]);
    ApplyInput(Cliente, AInput, {AIsCreate=}False);
    if not FRepository.Update(Cliente) then
      raise EClienteValidation.Create('Cliente nao foi atualizado');
    Result := ToOutput(Cliente);
  finally
    Cliente.Free;
  end;
end;

procedure TClienteService.DeleteItem(AId: TID);
begin
  if not FRepository.Delete(AId) then
    raise EClienteNotFound.CreateFmt('Cliente %d nao encontrado', [AId]);
end;

end.
