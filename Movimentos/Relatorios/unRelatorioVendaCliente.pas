unit unRelatorioVendaCliente;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls, 
  DBCtrls,  uniEdit, uniDBEdit,  
   uniPanel;

type
  TfrmRelatorioVendaCliente = class(TfrmDialogoRelatorioPadrao)
    dbeCliente: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeClienteClickButton(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
    SQLpadrao: string;
  end;

var
  frmRelatorioVendaCliente: TfrmRelatorioVendaCliente;

implementation

uses uConfiguraRelatorio, VarGlobal, Funcoes, unPrevVendas, ConstPadrao,
     unModeloConsulta;

{$R *.dfm}

procedure TfrmRelatorioVendaCliente.Imprimir(p: Boolean);
begin
  if dbeCliente.Text = '' then
  begin
    MsgErro(UM_FILTROINVALIDO);
    dbeCliente.SetFocus;
    Exit;
  end
  else
  begin
    with TfrmPrevVendas.Create(Self) do
    try
      cdsPadrao.Close;
      cdsPadrao.SQL.Clear; SQL.Text :='select '+
                               ' v.CODIGO,'+
                               ' v.CODCLIENTE,'+
                               ' cli.NOME CLIENTE,'+
                               ' v.DATA,'+
                               ' v.OBS,'+
                               ' v.TOTALDESCTO,'+
                               ' v.TOTAL,'+
                               ' v.CONCLUIDA,'+
                               ' v.BAIXADO '+
                               'from VENDA v '+
                               'inner join CLIENTES cli on (v.CODCLIENTE = cli.CODCLIENTE) '+
                               'where v.CODCLIENTE = :COD '+
                               'order by v.DATA';
//      cdsPadrao.Params.ParamByName('COD').AsInteger :=
//        GetDmPesquisar.cdsPesqCliente.FieldByName('CODCLIENTE').AsInteger;
//      cdsPadrao.Open;
//      lbTitulo.Caption := 'Vendas do cliente: '+GetDmPesquisar.cdsPesqCliente.FieldByName('NOME').AsString;
//      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioVendaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //GetDmPesquisar.cdsPesqCliente.Close;
  inherited;
end;

procedure TfrmRelatorioVendaCliente.dbeClienteClickButton(Sender: TObject);
begin
  inherited;
//  GetDmPesquisar.cdsPesqCliente.Close;
//  GetDmPesquisar.cdsPesqCliente.SQL.Clear; SQL.Text :=SQLpadrao;
//  if not TfrmModeloConsulta.Execute('Cliente', GetDmPesquisar.cdsPesqCliente, FN_CLIENTES, DL_CLIENTES) then
//    GetDmPesquisar.cdsPesqCliente.Close;
end;

procedure TfrmRelatorioVendaCliente.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(false);
end;

procedure TfrmRelatorioVendaCliente.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(true);
end;

procedure TfrmRelatorioVendaCliente.FormCreate(Sender: TObject);
begin
  inherited;
//  dsPadrao.DataSet := GetDmPesquisar.cdsPesqCliente;
//  SQLpadrao        := GetDmPesquisar.sqldPesqCliente.CommandText;
end;

initialization
  RegisterClass(TfrmRelatorioVendaCliente);
finalization
  UnRegisterClass(TfrmRelatorioVendaCliente);
end.
