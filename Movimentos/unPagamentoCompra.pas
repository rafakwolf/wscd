unit unPagamentoCompra;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, VarGlobal, 
  DB, SqlDb, DBGrids, memds,  FMTBcd;

type
  TfrmPagamentoCompra = class(TForm)
    sqldCompra: TSQLQuery;
    dsCompra: TDataSource;
    dspCompra: TComponent;
    cdsCompra: TMemDataSet;
    sqldCompraDATAPAGTO: TDateField;
    sqldCompraFORMAPAGTO: TStringField;
    cdsCompraDATAPAGTO: TDateField;
    cdsCompraFORMAPAGTO: TStringField;
    sqldCompraVALORPAGO: TFMTBCDField;
    sqldCompraVALORRESTO: TFMTBCDField;
    cdsCompraVALORPAGO: TFMTBCDField;
    cdsCompraVALORRESTO: TFMTBCDField;
    lbStatus: TLabel;
    btnOk: TBitBtn;
    dbgrdPagamento: TDBGrid;
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

uses unAgenda,  Funcoes, LCLType;

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
    //cdsCompra.Params.ParamByName('COMPRA').AsInteger := FIdCompra;
    cdsCompra.Open;
    Status;
  end;
end;

procedure TfrmPagamentoCompra.Status;
begin
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := GetConnection;
    SQL.Clear; SQL.Text :='select RESTO from STPRESTOCOMPRA(:COMPRA)';
    Params.ParamByName('COMPRA').AsInteger := FIdCompra;
    Open;

    if (FieldByName('RESTO').AsFloat = 0) then
      lbStatus.Caption := 'Compra conclu�da'
    else if (FieldByName('RESTO').AsFloat > 0) then
      lbStatus.Caption := 'Restante: R$ '+FormatFloat('#,##0.00', FieldByName('RESTO').AsFloat)
    else
      lbStatus.Caption := 'Compra n�o conclu�da';
      
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmPagamentoCompra);
finalization
  UnRegisterClass(TfrmPagamentoCompra);
end.
