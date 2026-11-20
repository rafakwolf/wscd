unit unRelatorioClienteCidade;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons,  
  memds,  DB, SqlDb,  DBCtrls,  FMTBcd;

type
  TfrmRelatorioClienteCidade = class(TfrmDialogoRelatorioPadrao)
    sqldCidade: TSQLQuery;
    sqldCidadeCODCIDADE: TIntegerField;
    sqldCidadeDESCRICAO: TStringField;
    dspCidade: TComponent;
    cdsCidade: TMemDataSet;
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
var idCidade: Integer;
begin
  inherited;
  cdsCidade.Close;
  sqldCidade.SQL.Clear;
  sqldCidade.SQL.Text :=SQLPadrao;
  
  idCidade := TfrmModeloConsulta.Execute('Cidade', 'CIDADES', FN_CIDADES, DL_CIDADES, self);

  if idCidade <> 0 then
  begin
    cdsCidade.Open;
    cdsCidade.Locate('CODCIDADE', idCidade, []);
  end;
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
                       'where CODCIDADE = :COD '+
                       'order by NOME';
        sqldPadrao.Params.ParamByName('COD').AsInteger := cdsCidadeCODCIDADE.AsInteger;
        Open;
      end;
      TipoRelatorio := 1;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      sqldPadrao.Close;
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
  SQLPadrao := sqldCidade.sql.text;
end;

initialization
  RegisterClass(TfrmRelatorioClienteCidade);
finalization
  UnRegisterClass(TfrmRelatorioClienteCidade);
end.
