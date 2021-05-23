unit unVendaNaoConc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, DB, DBClient,
  Datasnap.Provider, Data.SqlExpr, Grids, DBGrids, StdCtrls,
  Buttons, FMTBcd;

type
  TfrmVendaNaoConc = class(TfrmSimplePadrao)
    sqldVenda: TSQLDataSet;
    dspVenda: TDataSetProvider;
    cdsVenda: TClientDataSet;
    dsVenda: TDataSource;
    sqldVendaCODIGO: TIntegerField;
    sqldVendaDATA: TDateField;
    sqldVendaCODCLIENTE: TIntegerField;
    sqldVendaNOME: TStringField;
    sqldVendaTOTAL: TFMTBCDField;
    sqldVendaCONCLUIDA: TStringField;
    cdsVendaCODIGO: TIntegerField;
    cdsVendaDATA: TDateField;
    cdsVendaCODCLIENTE: TIntegerField;
    cdsVendaNOME: TStringField;
    cdsVendaTOTAL: TFMTBCDField;
    cdsVendaCONCLUIDA: TStringField;
    dbgrdVendaNaoConc: TDBGrid;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdVendaNaoConcDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
  public
  end;

var
  frmVendaNaoConc: TfrmVendaNaoConc;

implementation

uses Funcoes;

{$R *.dfm}

procedure TfrmVendaNaoConc.FormCreate(Sender: TObject);
begin
  inherited;
  cdsVenda.Open;
end;

procedure TfrmVendaNaoConc.FormShow(Sender: TObject);
begin
  inherited;
  if cdsVenda.IsEmpty then
  begin
    MsgAviso('Todas as vendas concluídas.');
    PostMessage(Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmVendaNaoConc.dbgrdVendaNaoConcDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
//  GridZebrado(TDBGrid(Sender).DataSource.DataSet.RecNo, TDBGrid(Sender), Rect, DataCol,
//    Column, State);
end;

initialization
  RegisterClass(TfrmVendaNaoConc);
finalization
  UnRegisterClass(TfrmVendaNaoConc);
end.
