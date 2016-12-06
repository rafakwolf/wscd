unit unRelatorioCompraData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls,
  DB, DBClient, Provider, SqlExpr, ComCtrls, PLDBEditDateTimePicker, FMTBcd;

const
  cs_nf_data: string = 'select '+
                       'nf.NUMERO, '+
                       'nf.CODFORNECEDOR, '+
                       'fn.FANTAZIA FORNECEDOR, '+
                       'nf.DATANOTA, '+
                       'nf.DATAENTRADA, '+
                       'nf.DESCONTO, '+
                       'nf.ICMS, '+
                       'nf.IPI, '+
                       'nf.FRETE, '+
                       'nf.DESPESAS, '+
                       'nf.TOTALPRODUTO, '+
                       'nf.TOTAL, '+
                       'nf.OBS, '+
                       'nf.CFOP, '+
                       ' c.OPERACAO, '+
                       'nf.BAIXADO, '+
                       'nf.CONCLUIDA '+
                       'from NOTAS_FISCAIS nf '+
                       'left join FORNECEDORES fn on(nf.CODFORNECEDOR = fn.CODFORNECEDOR) '+
                       'left join CFOP c on (c.NUMERO = nf.CFOP) '+
                       'where DATANOTA between :DATAI and :DATAF '+
                       'order by nf.DATANOTA';

type
  TfrmRelatorioCompraData = class(TfrmDialogoRelatorioPadrao)
    edDataIni: TPLDBEditDateTimePicker;
    edDataFim: TPLDBEditDateTimePicker;
    sqldSelecao: TSQLDataSet;
    sqldSelecaoDATAINI: TSQLTimeStampField;
    sqldSelecaoDATAFIM: TSQLTimeStampField;
    dspSelecao: TDataSetProvider;
    cdsSelecao: TClientDataSet;
    cdsSelecaoDATAINI: TSQLTimeStampField;
    cdsSelecaoDATAFIM: TSQLTimeStampField;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioCompraData: TfrmRelatorioCompraData;

implementation

uses Funcoes, unPrevCompras, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmRelatorioCompraData.Imprimir(p: Boolean);
begin
  if ValidaDataIniFim(cdsSelecaoDATAINI.AsDateTime,
    cdsSelecaoDATAFIM.AsDateTime, edDataIni)then
  begin
    with TfrmPrevCompras.Create(Self), cdsPadrao do
    try
      Close;
      CommandText := cs_nf_data;
      Params.ParamByName('DATAI').AsDate := Trunc(cdsSelecaoDATAINI.AsDateTime);
      Params.ParamByName('DATAF').AsDate := Trunc(cdsSelecaoDATAFIM.AsDateTime);
      Open;
      Titulo := 'Compras do período: ' + edDataIni.DBEdit.Text + ' até ' + edDataFim.DBEdit.Text;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioCompraData.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioCompraData.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(true);
end;

procedure TfrmRelatorioCompraData.FormCreate(Sender: TObject);
begin
  inherited;
  cdsSelecao.Open;
end;

procedure TfrmRelatorioCompraData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSelecao.Close;
  inherited;
end;

initialization
  RegisterClass(TfrmRelatorioCompraData);
finalization
  UnRegisterClass(TfrmRelatorioCompraData);
end.
