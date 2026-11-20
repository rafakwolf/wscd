unit unRelatorioFornecedorData;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons,  
  ComCtrls,  DBCtrls, DateTimePicker;

type

  { TfrmRelatorioFornecedorData }

  TfrmRelatorioFornecedorData = class(TfrmDialogoRelatorioPadrao)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioFornecedorData: TfrmRelatorioFornecedorData;

implementation

uses
  Funcoes, uConfiguraRelatorio, unPrevRelFornData, VarGlobal;

{$R *.dfm}

procedure TfrmRelatorioFornecedorData.Imprimir(p: Boolean);
begin

    with TfrmPrevRelFornData.Create(Self) do
    try
      with sqldPadrao do
      begin
        sqldPadrao.Close;
        Params.ParamByName('PDATAINI').AsDate :=
          DateTimePicker1.Date;
        Params.ParamByName('PDATAFIM').AsDate :=
          DateTimePicker2.Date;
        sqldPadrao.Open;
      end;
        TipoRelatorio := 2;
        PrintIfNotEmptyRL(rrPadrao, p);
    finally
      sqldPadrao.Close;
      Free;
    end;

end;

procedure TfrmRelatorioFornecedorData.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioFornecedorData.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

initialization
  RegisterClass(TfrmRelatorioFornecedorData);
finalization
  UnRegisterClass(TfrmRelatorioFornecedorData);
end.
