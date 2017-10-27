unit unParcelaCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, DB, DBClient,  dateutils,
  Datasnap.Provider, SqlExpr,  Grids, DBGrids, Spin, StdCtrls,
  Mask, DBCtrls,  Buttons,  funcoes, VarGlobal,
  ExtCtrls, FMTBcd, uDatabaseutils, uniGUIBaseClasses, uniGUIClasses, uniLabel,
  uniButton, uniBitBtn, uniEdit, uniDBEdit, uniSpinEdit, uniBasicGrid, uniDBGrid;

type
  TfrmParcelaCompra = class(TfrmSimplePadrao)
    sqldParcela: TSQLDataSet;
    sqldParcelaNUMERO: TIntegerField;
    sqldParcelaVENC: TDateField;
    sqldParcelaDIA: TStringField;
    sqldParcelaVALOR: TFloatField;
    dspParcela: TDataSetProvider;
    cdsParcela: TClientDataSet;
    cdsParcelaNUMERO: TIntegerField;
    cdsParcelaVENC: TDateField;
    cdsParcelaDIA: TStringField;
    cdsParcelaVALOR: TFloatField;
    dsParcela: TDataSource;
    sqldCompra: TSQLDataSet;
    dsCompra: TDataSource;
    sqldPagar: TSQLDataSet;
    sqldCompraNUMERO: TIntegerField;
    sqldCompraCODFORNECEDOR: TIntegerField;
    sqldCompraFORNECEDOR: TStringField;
    sqldCompraDATAENTRADA: TDateField;
    sqldCompraTOTAL: TFMTBCDField;
    lbParcelas: TUniLabel;
    lbPrazoInicio: TUniLabel;
    lbIntervalo: TUniLabel;
    btnOk: TUniBitBtn;
    btnCancelar: TUniBitBtn;
    btnCalcular: TUniBitBtn;
    edtRestoCompra: TUniEdit;
    dbeCodForn: TUniDBEdit;
    dbeNomeForn: TUniDBEdit;
    dbeDataCompra: TUniDBEdit;
    seParcelas: TUniSpinEdit;
    sePrazoInicio: TUniSpinEdit;
    seIntervalo: TUniSpinEdit;
    dbgrdParcelas: TUniDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure seParcelasExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cdsParcelaVENCChange(Sender: TField);
  private
    FIdCompra: Integer;
    procedure GeraParcelas;
    procedure SetIdCompra(const Value: Integer);
    function Restante: Real;
  public
    property IdCompra: Integer read FIdCompra write SetIdCompra;
  end;

var
  frmParcelaCompra: TfrmParcelaCompra;

implementation

uses ConstPadrao, System.Math;

{$R *.dfm}

procedure TfrmParcelaCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsParcela.Close;
  inherited;
end;

procedure TfrmParcelaCompra.GeraParcelas;
var
  x: Integer;
begin
  if not cdsParcela.Active then
    cdsParcela.Open;

  cdsParcela.EmptyDataSet;
  for x := 1 to seParcelas.Value do
  begin
    if cdsParcela.RecordCount < x then
      cdsParcela.Append
    else
      cdsParcela.Edit;
    cdsParcelaNUMERO.AsInteger := x;
    if (x = 1) then
      cdsParcelaVENC.AsDateTime := IncDay(sqldCompraDATAENTRADA.AsDateTime, sePrazoInicio.Value)
    else
      cdsParcelaVENC.AsDateTime := IncDay(sqldCompraDATAENTRADA.AsDateTime, (seIntervalo.Value * x));
    cdsParcelaDIA.AsString := DiaSemana(cdsParcelaVENC.AsDateTime);
    cdsParcelaVALOR.AsFloat := RoundTo((Restante / seParcelas.Value), 2);
    cdsParcela.Post;
  end;
end;

procedure TfrmParcelaCompra.SetIdCompra(const Value: Integer);
begin
  FIdCompra := Value;
  if (Value > 0) then
  begin
    sqldCompra.Close;
    sqldCompra.Params.ParamByName('IDCOMPRA').AsInteger := FIdCompra;
    sqldCompra.Open;

    edtRestoCompra.Text := FormatFloat('#,##0.00', Restante);

    if not sqldCompra.IsEmpty then
      GeraParcelas;

  end;
end;

procedure TfrmParcelaCompra.FormCreate(Sender: TObject);
begin
  inherited;
  sePrazoInicio.Value := Trunc(Global.PrazoInicial);
  seIntervalo.Value := Trunc(Global.Intervalo);
  seParcelas.Value := Trunc(Global.Parcelas);
end;

procedure TfrmParcelaCompra.btnCalcularClick(Sender: TObject);
begin
  inherited;
  GeraParcelas;
end;

procedure TfrmParcelaCompra.seParcelasExit(Sender: TObject);
begin
  inherited;
  if TSpinEdit(Sender).Value < 1 then
    TSpinEdit(Sender).Value := 1;

  if TSpinEdit(Sender).Name = 'seParcelas' then
    GeraParcelas;
end;

procedure TfrmParcelaCompra.btnOkClick(Sender: TObject);

  procedure ConcluirCompra(FormaPagto: string; ValorPago: Currency);
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := GetConnection;
      CommandType := ctStoredProc;
      CommandText := 'STPPAGTOCOMPRA';
      Params.ParamByName('IDCOMPRA').AsInteger  := FIdCompra;
      Params.ParamByName('DATAPAGTO').AsDate    := Date;
      Params.ParamByName('FORMAPAGTO').AsString := Trim(FormaPagto);
      Params.ParamByName('VALORPAGO').AsFMTBCD  := DoubleToBcd(ValorPago);
      ExecSQL;
    finally
      Free;
    end;
  end;

const
  Alfa: string = 'ABCDEFGHIJKLMNOPQRSTUVXWYZ';
var
  i: Integer;  
begin
  i := 1;

  if cdsParcela.IsEmpty then
    Exit;

  cdsParcela.First;
  while not cdsParcela.Eof do
  begin
    with sqldPagar do
    begin
      Params.ParamByName('CODIGO').AsInteger :=
        GetProximoID('CONTASPAGAr', 'CODIGO', GetConnection);

      Params.ParamByName('DATA').AsDate := sqldCompraDATAENTRADA.AsDateTime;
      Params.ParamByName('VENCIMENTO').AsDate := cdsParcelaVENC.AsDateTime;
      Params.ParamByName('IDFORN').AsInteger := sqldCompraCODFORNECEDOR.AsInteger;

      Params.ParamByName('DESCRICAO').AsString :=
        'Compra Nro: ' + IntToStr(sqldCompraNUMERO.AsInteger) + ' Parcela Nro: ' +
        IntToStr(cdsParcelaNUMERO.AsInteger);

      Params.ParamByName('DOCUMENTO').AsString :=
        'C'+IntToStr(sqldCompraNUMERO.AsInteger)+Alfa[i];

      Params.ParamByName('VALOR').AsFloat := cdsParcelaVALOR.AsFloat;
      Params.ParamByName('JURO').AsFloat := Global.Juro;
      Params.ParamByName('COMPRA').AsInteger := FIdCompra;
      ExecSQL;  
    end;
    Inc(i);
    cdsParcela.Next;
  end;
  ModalResult := mrOk;
  ConcluirCompra('Crediario', Restante);
  PostMessageAllForms(WM_COMPRA_CONCLUIDA);
end;

procedure TfrmParcelaCompra.cdsParcelaVENCChange(Sender: TField);
begin
  inherited;
  cdsParcelaDIA.AsString := DiaSemana(Sender.AsDateTime);
end;

function TfrmParcelaCompra.Restante: Real;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText := 'select RESTO from STPRESTOCOMPRA(:COMPRA)';
    Params.ParamByName('COMPRA').AsInteger := FIdCompra;
    Open;
    Result := RoundTo(FieldByName('RESTO').AsFloat, 2);
  finally
    Free;
  end;
end;

end.
