unit unRelatorioCRAtraso;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons,   
  DBCtrls, ZDataset, ZAbstractRODataset, DB,SqlDb, FMTBcd;

type

  { TfrmRelatorioCRAtraso }

  TfrmRelatorioCRAtraso = class(TfrmDialogoRelatorioPadrao)
    Button1: TButton;
    dbeCliente: TDBEdit;
    sqldCliente: TZQuery;
    sqldClienteCODCLIENTE: TZIntegerField;
    sqldClienteNOME: TZRawStringField;
    procedure Button1Click(Sender: TObject);
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
    with TfrmPrevRelCRAtrasadas.Create(Self),sqldCliente do
    try
      Close;
      sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := sqldClienteCODCLIENTE.AsInteger;
      Open;
      Titulo := 'Contas do cliente: ' + sqldClienteNOME.AsString;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      sqldCliente.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioCRAtraso.Button1Click(Sender: TObject);
begin

end;

procedure TfrmRelatorioCRAtraso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqldCliente.Close;
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
  sqldCliente.Close;
  sqldCliente.SQL.Clear;
  sqldCliente.SQL.Text := SQLPadrao;
  if not TfrmModeloConsulta.Execute('Cliente', 'CLIENTES', FN_CLIENTES, DL_CLIENTES, self) = mrOK then
    sqldCliente.Close;
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
