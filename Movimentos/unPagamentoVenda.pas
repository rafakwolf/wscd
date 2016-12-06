unit unPagamentoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, SqlExpr, DBClient,
  Provider, Grids, DBGrids, FMTBcd, VarGlobal;

type
  TfrmPagamentoVenda = class(TForm)
    btnOk: TSpeedButton;
    sqldVenda: TSQLDataSet;
    sqldVendaDATARECTO: TDateField;
    sqldVendaFORMARECTO: TStringField;
    dspVenda: TDataSetProvider;
    cdsVenda: TClientDataSet;
    dsVenda: TDataSource;
    cdsVendaDATARECTO: TDateField;
    cdsVendaFORMARECTO: TStringField;
    dbgdRectoVenda: TDBGrid;
    lbStatus: TLabel;
    sqldVendaVALORRECDO: TFMTBCDField;
    sqldVendaVALORRESTO: TFMTBCDField;
    cdsVendaVALORRECDO: TFMTBCDField;
    cdsVendaVALORRESTO: TFMTBCDField;
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
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText := 'select RESTO from STPRESTOVENDA(:VENDA)';
    Params.ParamByName('VENDA').AsInteger := FIdVenda;
    Open;

    if (FieldByName('RESTO').AsFloat = 0) then
      lbStatus.Caption := 'Venda concluída'
    else if (FieldByName('RESTO').AsFloat > 0) then
      lbStatus.Caption := 'Restante: R$ '+FormatFloat('#,##0.00', FieldByName('RESTO').AsFloat)
    else
      lbStatus.Caption := 'Venda não concluída';

  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmPagamentoVenda);
finalization
  UnRegisterClass(TfrmPagamentoVenda);
end.
