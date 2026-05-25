unit Recibo.repository;

{$mode delphi}{$H+}

interface

uses
  SysUtils,
  mormot.core.base,
  mormot.orm.core,
  mormot.orm.rest;

type
  TOrmRecibo = class(TOrm)
  private
    FData: TDateTime;
    FRecebedor: RawUtf8;
    FReferente: RawUtf8;
    FValor: Currency;
    FValorExtenso: RawUtf8;
  published
    property Data: TDateTime read FData write FData;
    property Recebedor: RawUtf8 index 250 read FRecebedor write FRecebedor;
    property Referente: RawUtf8 read FReferente write FReferente;
    property Valor: Currency read FValor write FValor;
    property ValorExtenso: RawUtf8 read FValorExtenso write FValorExtenso;
  end;

  TOrmReciboObjArray = array of TOrmRecibo;

  TReciboRepository = class
  private
    FOrm: IRestOrm;
  public
    constructor Create(const AOrm: IRestOrm);
    function Add(ARecibo: TOrmRecibo): TID;
    function FindById(AId: TID): TOrmRecibo;
    function ListAll: TOrmReciboObjArray;
    function Update(ARecibo: TOrmRecibo): Boolean;
    function Delete(AId: TID): Boolean;
  end;

function CreateReciboModel: TOrmModel;

implementation

constructor TReciboRepository.Create(const AOrm: IRestOrm);
begin
  inherited Create;
  if AOrm = nil then
    raise EArgumentException.Create('ORM do Recibo nao informado');
  FOrm := AOrm;
end;

function TReciboRepository.Add(ARecibo: TOrmRecibo): TID;
begin
  Result := FOrm.Add(ARecibo, {senddata=}True);
end;

function TReciboRepository.FindById(AId: TID): TOrmRecibo;
begin
  Result := TOrmRecibo.Create(FOrm, AId);
  if Result.ID = 0 then
    FreeAndNil(Result);
end;

function TReciboRepository.ListAll: TOrmReciboObjArray;
begin
  Result := nil;
  if not FOrm.RetrieveListObjArray(Result, TOrmRecibo, 'order by Data, Recebedor', []) then
    ObjArrayClear(Result);
end;

function TReciboRepository.Update(ARecibo: TOrmRecibo): Boolean;
begin
  Result := (ARecibo <> nil) and (ARecibo.ID > 0) and FOrm.Update(ARecibo);
end;

function TReciboRepository.Delete(AId: TID): Boolean;
begin
  Result := FOrm.Delete(TOrmRecibo, AId);
end;

function CreateReciboModel: TOrmModel;
begin
  Result := TOrmModel.Create([TOrmRecibo], 'api');
end;

end.
