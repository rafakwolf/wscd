unit unRelatorioClienteCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls,
  DBClient, Provider, DB, SqlExpr, Mask, DBCtrls,  FMTBcd, uniGUIClasses,
  uniEdit, uniDBEdit, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel;

type
  TfrmRelatorioClienteCidade = class(TfrmDialogoRelatorioPadrao)
    sqldCidade: TSQLDataSet;
    sqldCidadeCODCIDADE: TIntegerField;
    sqldCidadeDESCRICAO: TStringField;
    dspCidade: TDataSetProvider;
    cdsCidade: TClientDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    dbeCidade: TDBEdit;
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    SQLPadrao: string;
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioClienteCidade: TfrmRelatorioClienteCidade;

implementation

uses
  Funcoes, unModeloConsulta, unPrevListagemClientes, ConstPadrao, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmRelatorioClienteCidade.dbeCidadeClickButton(Sender: TObject);
begin
  inherited;
  cdsCidade.Close;
  cdsCidade.CommandText := SQLPadrao;
//  if not TfrmModeloConsulta.Execute('Cidade', cdsCidade, FN_CIDADES, DL_CIDADES) then
//    cdsCidade.Close;
end;

procedure TfrmRelatorioClienteCidade.Imprimir(p: Boolean);
begin
  if (dbeCidade.Text = EmptyStr) then
  begin
    MsgErro(UM_FILTROINVALIDO);
    SetFocusIfCan(dbeCidade);
    Abort;
  end
  else
  begin
    with TfrmPrevListagemClientes.Create(Self)do
    try
      with cdsPadrao do
      begin
        Close;
        CommandText := 'select '+
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
                       'where CODCIDADE = :COD '+
                       'order by NOME';
        Params.ParamByName('COD').AsInteger := cdsCidadeCODCIDADE.AsInteger;
        Open;
      end;
      TipoRelatorio := 1;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioClienteCidade.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioClienteCidade.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioClienteCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsCidade.Close;
  inherited;
end;

procedure TfrmRelatorioClienteCidade.FormCreate(Sender: TObject);
begin
  inherited;
  SQLPadrao := sqldCidade.CommandText;
end;

initialization
  RegisterClass(TfrmRelatorioClienteCidade);
finalization
  UnRegisterClass(TfrmRelatorioClienteCidade);
end.
