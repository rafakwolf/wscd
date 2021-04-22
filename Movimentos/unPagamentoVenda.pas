unit unPagamentoVenda;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, SqlDb, memds,
   Grids, DBGrids, FMTBcd, VarGlobal,  
     uniLabel,  uniBasicGrid,
  uniDBGrid;

type
  TfrmPagamentoVenda = class(TForm)
    sqldVenda: TSQLQuery;
    sqldVendaDATARECTO: TDateField;
    sqldVendaFORMARECTO: TStringField;
    dspVenda: TComponent;
    cdsVenda: TMemDataSet;
    dsVenda: TDataSource;
    cdsVendaDATARECTO: TDateField;
    cdsVendaFORMARECTO: TStringField;
    sqldVendaVALORRECDO: TFMTBCDField;
    sqldVendaVALORRESTO: TFMTBCDField;
    cdsVendaVALORRECDO: TFMTBCDField;
    cdsVendaVALORRESTO: TFMTBCDField;
    btnOk: TSpeedButton;
    lbStatus: TLabel;
    dbgdRectoVenda: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FIdVenda: Integer;
    procedure SetIdVenda(const Value: Integer);
    procedure Status;
  public
    property IdVenda: Integer read FIdVenda write SetIdVenda;
  end;

var
  frmPagamentoVenda: TfrmPagamentoVenda;

implementation

uses  Funcoes;

{$R *.dfm}

procedure TfrmPagamentoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsVenda.Close;
  Action := caFree;
end;

procedure TfrmPagamentoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmPagamentoVenda.SetIdVenda(const Value: Integer);
begin
  FIdVenda := Value;
  if (Value > 0) then
  begin
    cdsVenda.Close;
    cdsVenda.Params.ParamByName('VENDA').AsInteger := FIdVenda;
    cdsVenda.Open;
    Status;
  end;
end;

procedure TfrmPagamentoVenda.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
  CentralizaForm(Self);
end;

procedure TfrmPagamentoVenda.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPagamentoVenda.Status;
begin
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := GetConnection;
    SQL.Clear; SQL.Text :='select RESTO from STPRESTOVENDA(:VENDA)';
    Params.ParamByName('VENDA').AsInteger := FIdVenda;
    Open;

    if (FieldByName('RESTO').AsFloat = 0) then
      lbStatus.Caption := 'Venda conclu�da'
    else if (FieldByName('RESTO').AsFloat > 0) then
      lbStatus.Caption := 'Restante: R$ '+FormatFloat('#,##0.00', FieldByName('RESTO').AsFloat)
    else
      lbStatus.Caption := 'Venda n�o conclu�da';

  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmPagamentoVenda);
finalization
  UnRegisterClass(TfrmPagamentoVenda);
end.
