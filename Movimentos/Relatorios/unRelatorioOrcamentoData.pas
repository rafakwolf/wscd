unit unRelatorioOrcamentoData;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, DBCtrls;

type
  TfrmRelatorioOrcamentoData = class(TfrmDialogoRelatorioPadrao)
    edDataFim: TDBEdit;
    edDataIni: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public

  end;

var
  frmRelatorioOrcamentoData: TfrmRelatorioOrcamentoData;

implementation

uses
  VarGlobal, Funcoes, uConfiguraRelatorio, unPrevOrcammento;

{$R *.dfm}

procedure TfrmRelatorioOrcamentoData.Imprimir(p: Boolean);
begin
//  if ValidaDataIniFim(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime,
//    GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime, edDataIni)then
//  begin
    with TfrmPrevOrcamento.Create(Self) do
    try
      cdsPadrao.Close;
      sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select '+
                               ' orc.CODIGO, '+
                               ' orc.CODCLIENTE, '+
                               ' cli.Nome NOMECLIENTE, '+
                               ' orc.DATA, '+
                               ' orc.OBS, '+
                               ' orc.TOTAL, '+
                               ' orc.ITENS, '+
                               ' orc.STATUS, '+
                               ' orc.CONCLUIDO '+
                               'from ORCAMENTO orc '+
                               'left join CLIENTES cli on (orc.Codcliente = cli.Codcliente) '+
                               'where orc.DATA between :DATAINI and :DATAFIM';
//      cdsPadrao.Params.ParamByName('DATAINI').AsDate :=
//        Trunc(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime);
//      cdsPadrao.Params.ParamByName('DATAFIM').AsDate :=
//        Trunc(GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime);
      cdsPadrao.Open;
      lbTitulo.Caption := Global.TituloOrcamento;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  //end;
end;

procedure TfrmRelatorioOrcamentoData.FormCreate(Sender: TObject);
begin
  inherited;
//  dsPadrao.DataSet := GetDmPesquisar.cdsPesqData;
//  GetDmPesquisar.cdsPesqData.Open;
end;

procedure TfrmRelatorioOrcamentoData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //GetDmPesquisar.cdsPesqData.Close;
  inherited;
end;

procedure TfrmRelatorioOrcamentoData.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioOrcamentoData.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

initialization
  RegisterClass(TfrmRelatorioOrcamentoData);
finalization
  UnRegisterClass(TfrmRelatorioOrcamentoData);

end.
