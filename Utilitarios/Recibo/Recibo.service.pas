unit Recibo.service;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.core.json,
  mormot.core.unicode,
  mormot.orm.core,
  Recibo.repository;

const
  __TReciboInput = 'Data: TDateTime; Recebedor: RawUtf8; Referente: RawUtf8; Valor: Currency';
  __TReciboOutput = 'IDRecibo: Int64; Data: TDateTime; Recebedor: RawUtf8; Referente: RawUtf8; Valor: Currency; ValorExtenso: RawUtf8';

type
  EReciboValidation = class(Exception);
  EReciboNotFound = class(Exception);

  TReciboInput = packed record
    Data: TDateTime;
    Recebedor: RawUtf8;
    Referente: RawUtf8;
    Valor: Currency;
  end;

  TReciboOutput = packed record
    IDRecibo: Int64;
    Data: TDateTime;
    Recebedor: RawUtf8;
    Referente: RawUtf8;
    Valor: Currency;
    ValorExtenso: RawUtf8;
  end;

  TReciboOutputDynArray = array of TReciboOutput;

  TReciboService = class
  private
    FRepository: TReciboRepository;
    class function Utf8CharCount(const AValue: RawUtf8): Integer; static;
    class function ToOutput(ARecibo: TOrmRecibo): TReciboOutput; static;
    function ValorPorExtenso(AValor: Currency): RawUtf8;
    procedure ApplyInput(ARecibo: TOrmRecibo; const AInput: TReciboInput);
    procedure ValidateForSave(const AInput: TReciboInput);
  public
    constructor Create(ARepository: TReciboRepository);
    function CreateItem(const AInput: TReciboInput): TReciboOutput;
    function GetItem(AId: TID): TReciboOutput;
    function ListItems: TReciboOutputDynArray;
    function UpdateItem(AId: TID; const AInput: TReciboInput): TReciboOutput;
    procedure DeleteItem(AId: TID);
  end;

implementation

uses
  Extensos;

constructor TReciboService.Create(ARepository: TReciboRepository);
begin
  inherited Create;
  if ARepository = nil then
    raise EArgumentException.Create('Repositorio do Recibo nao informado');
  FRepository := ARepository;
end;

class function TReciboService.Utf8CharCount(const AValue: RawUtf8): Integer;
begin
  Result := Length(Utf8ToString(AValue));
end;

class function TReciboService.ToOutput(ARecibo: TOrmRecibo): TReciboOutput;
begin
  FillChar(Result, SizeOf(Result), 0);
  if ARecibo = nil then
    Exit;
  Result.IDRecibo := ARecibo.ID;
  Result.Data := ARecibo.Data;
  Result.Recebedor := ARecibo.Recebedor;
  Result.Referente := ARecibo.Referente;
  Result.Valor := ARecibo.Valor;
  Result.ValorExtenso := ARecibo.ValorExtenso;
end;

function TReciboService.ValorPorExtenso(AValor: Currency): RawUtf8;
begin
  Result := StringToUtf8(Extenso(AValor));
end;

procedure TReciboService.ApplyInput(ARecibo: TOrmRecibo; const AInput: TReciboInput);
begin
  ARecibo.Data := AInput.Data;
  ARecibo.Recebedor := AInput.Recebedor;
  ARecibo.Referente := AInput.Referente;
  ARecibo.Valor := AInput.Valor;
  ARecibo.ValorExtenso := ValorPorExtenso(AInput.Valor);
end;

procedure TReciboService.ValidateForSave(const AInput: TReciboInput);
begin
  if Utf8CharCount(AInput.Recebedor) > 250 then
    raise EReciboValidation.Create('Recebedor deve ter no maximo 250 caracteres');
end;

function TReciboService.CreateItem(const AInput: TReciboInput): TReciboOutput;
var
  Recibo: TOrmRecibo;
  NewId: TID;
begin
  ValidateForSave(AInput);
  Recibo := TOrmRecibo.Create;
  try
    ApplyInput(Recibo, AInput);
    NewId := FRepository.Add(Recibo);
    if NewId <= 0 then
      raise EReciboValidation.Create('Recibo nao foi criado');
    Recibo.IDValue := NewId;
    Result := ToOutput(Recibo);
  finally
    Recibo.Free;
  end;
end;

function TReciboService.GetItem(AId: TID): TReciboOutput;
var
  Recibo: TOrmRecibo;
begin
  Recibo := FRepository.FindById(AId);
  try
    if Recibo = nil then
      raise EReciboNotFound.CreateFmt('Recibo %d nao encontrado', [AId]);
    Result := ToOutput(Recibo);
  finally
    Recibo.Free;
  end;
end;

function TReciboService.ListItems: TReciboOutputDynArray;
var
  Items: TOrmReciboObjArray;
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

function TReciboService.UpdateItem(AId: TID; const AInput: TReciboInput): TReciboOutput;
var
  Recibo: TOrmRecibo;
begin
  ValidateForSave(AInput);
  Recibo := FRepository.FindById(AId);
  try
    if Recibo = nil then
      raise EReciboNotFound.CreateFmt('Recibo %d nao encontrado', [AId]);
    ApplyInput(Recibo, AInput);
    if not FRepository.Update(Recibo) then
      raise EReciboValidation.Create('Recibo nao foi atualizado');
    Result := ToOutput(Recibo);
  finally
    Recibo.Free;
  end;
end;

procedure TReciboService.DeleteItem(AId: TID);
begin
  if not FRepository.Delete(AId) then
    raise EReciboNotFound.CreateFmt('Recibo %d nao encontrado', [AId]);
end;

end.
