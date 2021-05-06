unit unRelatorioClienteData;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons,  
  DB, memds,  SqlDb, ComCtrls, FMTBcd, DBCtrls;

type
  TfrmRelatorioClienteData = class(TfrmDialogoRelatorioPadrao)
    sqldSelecao: TSQLQuery;
    sqldSelecaoDATAINI: TDateTimeField;
    sqldSelecaoDATAFIM: TDateTimeField;
    dspSelecao: TComponent;
    cdsSelecao: TMemDataSet;
    cdsSelecaoDATAINI: TDateTimeField;
    cdsSelecaoDATAFIM: TDateTimeField;
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
  cdsSelecao.Open;
end;

procedure TfrmRelatorioClienteData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSelecao.Close;
  inherited;
end;

procedure TfrmRelatorioClienteData.Imprimir(p: Boolean);
begin
  with TfrmPrevListagemClientes.Create(Self) do
  try
//    if ValidaDataIniFim(cdsSelecaoDATAINI.AsDateTime, cdsSelecaoDATAFIM.AsDateTime,
//      edDataIni)then
//    begin
      with cdsPadrao do
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
        sqldPadrao.Params.ParamByName('PDATAINI').AsDate := Trunc(cdsSelecaoDATAINI.AsDateTime);
        sqldPadrao.Params.ParamByName('PDATAFIM').AsDate := Trunc(cdsSelecaoDATAFIM.AsDateTime);
        Open;
      end;
      DataIni := edDataIni.Text;
      DataFim := edDataFim.Text;
      TipoRelatorio := 2;
      PrintIfNotEmptyRL(rrPadrao, p);
    //end;
  finally
    cdsPadrao.Close;
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
