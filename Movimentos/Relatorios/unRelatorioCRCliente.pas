unit unRelatorioCRCliente;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls, 
  memds, DB,  DBCtrls,  uniEdit, uniDBEdit, 
    uniPanel;

type
  TfrmRelatorioCRCliente = class(TfrmDialogoRelatorioPadrao)
    dbeCliente: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbeClienteClickButton(Sender: TObject);
  private
    SQLPadrao: string;
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioCRCliente: TfrmRelatorioCRCliente;

implementation

uses
  VarGlobal, Funcoes, uConfiguraRelatorio, unPrevContasReceber, ConstPadrao,
  unModeloConsulta;

{$R *.dfm}

procedure TfrmRelatorioCRCliente.Imprimir(p: Boolean);
begin
  if (dbeCliente.Text = '') then
  begin
    MsgErro(UM_FILTROINVALIDO);
    SetFocusIfCan(dbeCliente);
    Abort;
  end
  else
  begin
//    with TfrmPrevContasReceber.Create(Self) do
//    try
//      with cdsPadrao do
//      begin
//        Close;
//        Params.ParamByName('PCLIENTE').AsString := GetDmPesquisar.cdsPesqCliente.FieldByName('NOME').AsString;
//        Open;
//      end;
//      Titulo := 'Contas a Receber do Cliente: ' + GetDmPesquisar.cdsPesqCliente.FieldByName('NOME').AsString;
//      PrintIfNotEmptyRL(rrPadrao, p);
//    finally
//      cdsPadrao.CLose;
//      Free;
//    end;
  end;
end;

procedure TfrmRelatorioCRCliente.FormCreate(Sender: TObject);
begin
//  dsPadrao.DataSet := GetDmPesquisar.cdsPesqCliente;
//  GetDmPesquisar.cdsPesqCliente.Close;
//  SQLPadrao := GetDmPesquisar.sqldPesqCliente.CommandText;
  inherited;
end;

procedure TfrmRelatorioCRCliente.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioCRCliente.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioCRCliente.dbeClienteClickButton(Sender: TObject);
begin
  inherited;
//  GetDmPesquisar.cdsPesqCliente.Close;
//  GetDmPesquisar.cdsPesqCliente.SQL.Clear; SQL.Text :=SQLPadrao;
//  if not TfrmModeloConsulta.Execute('Cliente', GetDmPesquisar.cdsPesqCliente,
//    FN_CLIENTES, DL_CLIENTES) then
//    GetDmPesquisar.cdsPesqCliente.Close;
end;

initialization
  RegisterClass(TfrmRelatorioCRCliente);
finalization
  UnRegisterClass(TfrmRelatorioCRCliente);
end.
