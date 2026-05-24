unit unRelatorioClienteData;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons,  
  DB, SqlDb, ComCtrls, FMTBcd, DBCtrls, ZDataset;

type
  TfrmRelatorioClienteData = class(TfrmDialogoRelatorioPadrao)
    sqldSelecao: TZQuery;
    sqldSelecaoDATAINI: TDateTimeField;
    sqldSelecaoDATAFIM: TDateTimeField;




    edDataIni: TDBEdit;
    edDataFim: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioClienteData: TfrmRelatorioClienteData;

implementation

uses
  Funcoes, unPrevListagemClientes, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmRelatorioClienteData.FormCreate(Sender: TObject);
begin
  inherited;
  sqldSelecao.Open;
end;

procedure TfrmRelatorioClienteData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqldSelecao.Close;
  inherited;
end;

procedure TfrmRelatorioClienteData.Imprimir(p: Boolean);
begin
  with TfrmPrevListagemClientes.Create(Self) do
  try
//    if ValidaDataIniFim(sqldSelecaoDATAINI.AsDateTime, sqldSelecaoDATAFIM.AsDateTime,
//      edDataIni)then
//    begin
      with sqldPadrao do
      begin
        Close;
        sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select '+
                       ' CODIGO, '+
                       ' NOME, '+
                       ' ENDERECO, '+
                       ' CPF_CNPJ, '+
                       ' RG_IE, '+
                       ' DATANASCIMENTO, '+
                       ' CODCIDADE, '+
                       ' CIDADE, '+
                       ' TELEFONE, '+
                       ' TIPO '+
                       'from VIEWRELCLIENTES '+
                       'where DATANASCIMENTO between :PDATAINI and :PDATAFIM '+
                       'order by NOME, DATANASCIMENTO';
        sqldPadrao.Params.ParamByName('PDATAINI').AsDate := Trunc(sqldSelecaoDATAINI.AsDateTime);
        sqldPadrao.Params.ParamByName('PDATAFIM').AsDate := Trunc(sqldSelecaoDATAFIM.AsDateTime);
        Open;
      end;
      DataIni := edDataIni.Text;
      DataFim := edDataFim.Text;
      TipoRelatorio := 2;
      PrintIfNotEmptyRL(rrPadrao, p);
    //end;
  finally
    sqldPadrao.Close;
    Free;
  end;
end;

procedure TfrmRelatorioClienteData.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioClienteData.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

initialization
  RegisterClass(TfrmRelatorioClienteData);
finalization
  UnRegisterClass(TfrmRelatorioClienteData);
end.
