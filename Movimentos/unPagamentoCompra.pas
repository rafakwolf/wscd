unit unPagamentoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, VarGlobal, uniGUIForm,
  DB, SqlExpr, DBGrids, DBClient, Provider, FMTBcd, uniGUIBaseClasses,
  uniGUIClasses, uniLabel, uniButton, uniBitBtn, uniBasicGrid, uniDBGrid;

type
  TfrmPagamentoCompra = class(TUniForm)
    sqldCompra: TSQLDataSet;
    dsCompra: TDataSource;
    dspCompra: TDataSetProvider;
    cdsCompra: TClientDataSet;
    sqldCompraDATAPAGTO: TDateField;
    sqldCompraFORMAPAGTO: TStringField;
    cdsCompraDATAPAGTO: TDateField;
    cdsCompraFORMAPAGTO: TStringField;
    sqldCompraVALORPAGO: TFMTBCDField;
    sqldCompraVALORRESTO: TFMTBCDField;
    cdsCompraVALORPAGO: TFMTBCDField;
    cdsCompraVALORRESTO: TFMTBCDField;
    lbStatus: TUniLabel;
    btnOk: TUniBitBtn;
    dbgrdPagamento: TUniDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FIdCompra: Integer;
    procedure SetIdCompra(const Value: Integer);
    procedure Status;
  public
    property IdCompra: Integer read FIdCompra write SetIdCompra;
  end;

var
  frmPagamentoCompra: TfrmPagamentoCompra;

implementation

uses unAgenda,  Funcoes;

{$R *.dfm}

procedure TfrmPagamentoCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmPagamentoCompra.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
  CentralizaForm(Self);
end;

procedure TfrmPagamentoCompra.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPagamentoCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsCompra.Close;
  Action := caFree;
end;

procedure TfrmPagamentoCompra.SetIdCompra(const Value: Integer);
begin
  FIdCompra := Value;
  if (FIdCompra > 0) then
  begin
    cdsCompra.Close;
    cdsCompra.Params.ParamByName('COMPRA').AsInteger := FIdCompra;
    cdsCompra.Open;
    Status;
  end;
end;

procedure TfrmPagamentoCompra.Status;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText := 'select RESTO from STPRESTOCOMPRA(:COMPRA)';
    Params.ParamByName('COMPRA').AsInteger := FIdCompra;
    Open;

    if (FieldByName('RESTO').AsFloat = 0) then
      lbStatus.Caption := 'Compra concluída'
    else if (FieldByName('RESTO').AsFloat > 0) then
      lbStatus.Caption := 'Restante: R$ '+FormatFloat('#,##0.00', FieldByName('RESTO').AsFloat)
    else
      lbStatus.Caption := 'Compra não concluída';
      
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmPagamentoCompra);
finalization
  UnRegisterClass(TfrmPagamentoCompra);
end.
