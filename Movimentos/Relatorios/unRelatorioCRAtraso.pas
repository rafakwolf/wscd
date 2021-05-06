unit unRelatorioCRAtraso;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons,   
  DBCtrls,  memds,  DB, SqlDb, FMTBcd;

type
  TfrmRelatorioCRAtraso = class(TfrmDialogoRelatorioPadrao)
    sqldCliente: TSQLQuery;
    dspCliente: TComponent;
    cdsCliente: TMemDataSet;
    sqldClienteCODCLIENTE: TIntegerField;
    sqldClienteNOME: TStringField;
    sqldClienteTELEFONE: TStringField;
    sqldClienteRG_IE: TStringField;
    sqldClienteCPF_CNPJ: TStringField;
    sqldClienteDATA_NASC: TDateField;
    sqldClienteLIMITE: TFMTBCDField;
    sqldClienteDESCRICAO: TStringField;
    cdsClienteCODCLIENTE: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteRG_IE: TStringField;
    cdsClienteCPF_CNPJ: TStringField;
    cdsClienteDATA_NASC: TDateField;
    cdsClienteLIMITE: TFMTBCDField;
    cdsClienteDESCRICAO: TStringField;
    dbeCliente: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure dbeClienteClickButton(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    SQLPadrao: string;
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioCRAtraso: TfrmRelatorioCRAtraso;

implementation

uses
  Funcoes, uConfiguraRelatorio, unPrevRelCRAtrasadas, unModeloConsulta,
  ConstPadrao;

{$R *.dfm}

procedure TfrmRelatorioCRAtraso.Imprimir(p: Boolean);
begin
  if (dbeCliente.Field.AsString = '') then
  begin
    MsgErro(UM_FILTROINVALIDO);
    SetFocusIfcan(dbeCliente);
    Exit;
  end
  else
  begin
    with TfrmPrevRelCRAtrasadas.Create(Self), cdsPadrao do
    try
      Close;
      sqldpadrao.Params.ParamByName('PCLIENTE').AsInteger := cdsClienteCODCLIENTE.AsInteger;
      Open;
      Titulo := 'Contas do cliente: ' + cdsClienteNOME.AsString;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioCRAtraso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsCliente.Close;
  inherited;
end;

procedure TfrmRelatorioCRAtraso.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(true);
end;

procedure TfrmRelatorioCRAtraso.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioCRAtraso.dbeClienteClickButton(Sender: TObject);
begin
  inherited;
  cdsCliente.Close;
  sqldCliente.SQL.Clear; sqldCliente.SQL.Text :=SQLPadrao;
//  if not TfrmModeloConsulta.Execute('Cliente', cdsCliente, FN_CLIENTES, DL_CLIENTES) then
//    cdsCliente.Close;
end;

procedure TfrmRelatorioCRAtraso.FormCreate(Sender: TObject);
begin
  inherited;
  SQLPadrao := sqldCliente.sql.text;
end;

initialization
  RegisterClass(TfrmRelatorioCRAtraso);
finalization
  UnRegisterClass(TfrmRelatorioCRAtraso);
end.
