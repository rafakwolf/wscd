unit unRelatorioCaixaContaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls,
  DB, DBClient, Provider, SqlExpr, Mask, DBCtrls, 
  ComCtrls,  FMTBcd;

type
  TfrmRelatorioCaixaContaCaixa = class(TfrmDialogoRelatorioPadrao)
    dbeCaixa: TDBEdit;
    sqldCaixa: TSQLDataSet;
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    cdsCaixaCODIGO: TIntegerField;
    cdsCaixaNOME: TStringField;
    dtpDataIni: TDBEdit;
    dtpDataFim: TDBEdit;
    dsData: TDataSource;
    procedure dbeCaixaClickButton(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    SQLPadrao: string;
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioCaixaContaCaixa: TfrmRelatorioCaixaContaCaixa;

implementation

uses
  unModeloConsulta, ConstPadrao, unPrevRelCaixa, uConfiguraRelatorio,
  uDmPesquisar;

{$R *.dfm}

procedure TfrmRelatorioCaixaContaCaixa.Imprimir(p: Boolean);
begin
  with TfrmPrevRelCaixa.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.CommandText := 'SELECT '+
                             ' CODCAIXA CODIGO,'+
                             ' DATA,'+
                             ' DESCRICAO,'+
                             ' DOCUMENTO,'+
                             ' TIPO,'+
                             ' VALOR, '+
                             ' cast(null as numeric(13,2)) TOTAL '+
                             'FROM CAIXA '+
                             'WHERE CODCAIXAS = :CODCAIXA '+
                             'AND DATA BETWEEN :DATAINI AND :DATAFIM '+
                             'ORDER BY DATA, TIPO';

//    cdspadrao.Params.ParamByName('CODCAIXA').AsInteger := cdsCaixaCODIGO.AsInteger;
//    cdsPadrao.Params.ParamByName('DATAINI').AsDate     := DmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime;
//    cdsPadrao.Params.ParamByName('DATAFIM').AsDate     := DmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime;

    cdsPadrao.Open;
    TituloRel := 'Lançamentos do caixa: ' + dbeCaixa.Text;
    PrintIfNotEmptyRL(rrPadrao, p);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmRelatorioCaixaContaCaixa.dbeCaixaClickButton(Sender: TObject);
begin
  inherited;
  cdsCaixa.Close;
  cdsCaixa.CommandText := SQLPadrao;

//  if TfrmModeloConsulta.Execute('Busca Caixa', cdsCaixa, FN_CAIXAS, DL_CAIXAS) then
//    cdsCaixa.Open
//  else
//    cdsCaixa.Close;
end;

procedure TfrmRelatorioCaixaContaCaixa.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioCaixaContaCaixa.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(false);
end;

procedure TfrmRelatorioCaixaContaCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  SQLPadrao := sqldCaixa.CommandText;

//  if not dmPesquisar.cdsPesqData.Active then
//    DmPesquisar.cdsPesqData.Open;
end;

procedure TfrmRelatorioCaixaContaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  if dmPesquisar.cdsPesqData.Active then
//    DmPesquisar.cdsPesqData.Close;
end;

initialization
  RegisterClass(TfrmRelatorioCaixaContaCaixa);
finalization
  UnRegisterClass(TfrmRelatorioCaixaContaCaixa);
end.


