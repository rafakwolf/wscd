unit unRelatorioFornecedorCidade;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls, 
  DBCtrls,  uniEdit, uniDBEdit,  
   uniPanel;

type
  TfrmRelatorioFornecedorCidade = class(TfrmDialogoRelatorioPadrao)
    dbeCidade: TDBEdit;
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
    SQLPadrao: string;
  end;

var
  frmRelatorioFornecedorCidade: TfrmRelatorioFornecedorCidade;

implementation

uses
  Funcoes, uConfiguraRelatorio, unPrevRelFornData, ConstPadrao, VarGlobal,
  unModeloConsulta;

{$R *.dfm}

procedure TfrmRelatorioFornecedorCidade.Imprimir(p: Boolean);
begin
  if (dbeCidade.Text = '') then
  begin
    MsgErro(UM_FILTROINVALIDO);
    dbeCidade.SetFocus;
    Abort;
  end
  else
  begin
    with TfrmPrevRelFornData.Create(Self) do
    try
      with cdsPadrao do
      begin
        Close;
        SQL.Clear; SQL.Text :='select'+
                       ' CODIGO,'+
                       ' DATA,'+
                       ' FANTAZIA,'+
                       ' CNPJ,'+
                       ' ENDERECO,'+
                       ' CIDADE,'+
                       ' TELEFONE '+
                       'from VIEWRELFORN '+
                       'where CIDADE = :PCIDADE '+
                       'order by FANTAZIA';
        //Params.ParamByName('PCIDADE').AsString := GetDmPesquisar.cdsPesqCidadeDESCRICAO.asstring;
        Open;
      end;
      TipoRelatorio := 1;
      PrintIfNotEmptyRL(rrPadrao);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioFornecedorCidade.dbeCidadeClickButton(
  Sender: TObject);
begin
  inherited;
//  GetDmPesquisar.cdsPesqCidade.Close;
//  GetDmPesquisar.cdsPesqCidade.SQL.Clear; SQL.Text :=SQLPadrao;
//  if not TfrmModeloConsulta.Execute('Cidade', GetDmPesquisar.cdsPesqCidade, FN_CIDADES,
//    DL_CIDADES) then
//    GetDmPesquisar.cdsPesqCidade.Close;
end;

procedure TfrmRelatorioFornecedorCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //GetDmPesquisar.cdsPesqCidade.Close;
  inherited;
end;

procedure TfrmRelatorioFornecedorCidade.btnVisualizarClick(
  Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioFornecedorCidade.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioFornecedorCidade.FormCreate(Sender: TObject);
begin
  inherited;
//  dsPadrao.DataSet := GetDmPesquisar.cdsPesqCidade;
//  SQLPadrao := GetDmPesquisar.sqldPesqCidade.CommandText;
end;

initialization
  RegisterClass(TfrmRelatorioFornecedorCidade);
finalization
  UnRegisterClass(TfrmRelatorioFornecedorCidade);
end.
