unit unPrevNotaProm;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, SqlDb, DBCtrls, 
  memds,  ConstPadrao,   FMTBcd, lcltype;

type
  TfrmPrevNotaProm = class(TForm)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    dsPadrao: TDataSource;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoRG_IE: TStringField;
    sqldPadraoCPF_CNPJ: TStringField;
    sqldPadraoDATA_NASC: TDateField;
    sqldPadraoLIMITE: TFMTBCDField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoRG_IE: TStringField;
    cdsPadraoCPF_CNPJ: TStringField;
    cdsPadraoDATA_NASC: TDateField;
    cdsPadraoLIMITE: TFMTBCDField;
    cdsPadraoDESCRICAO: TStringField;
    pnlBotoes: TPanel;
    btnImp: TBitBtn;
    btnCancel: TBitBtn;
    btnImprimir: TBitBtn;
    dbeCliente: TDBEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dbeClienteClickButton(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Imprime(p: Boolean);
  public
  end;

var
  frmPrevNotaProm: TfrmPrevNotaProm;

implementation

uses
  Funcoes, unPrevContasClientes, uConfiguraRelatorio, unModeloConsulta;

{$R *.dfm}

procedure TfrmPrevNotaProm.Imprime(p: Boolean);
begin
  with TfrmPrevContasClientes.Create(Self) do
  try
    with cdsPadrao do
    begin
      Close;
      sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :='select '+
                     'CODIGO, '+
                     'DATA, '+
                     'VENCIMENTO, '+
                     'CODCLIENTE, '+
                     'CLIENTE, '+
                     'CAPITAL, '+
                     'TOTAL '+
                     'from VIEWRELNPCR '+
                     'where CODCLIENTE = :PCLIENTE '+
                     'order by VENCIMENTO';
     sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := Self.cdsPadraoCODCLIENTE.AsInteger;
     Open;
     PrintIfNotEmptyRL(rrPadrao, p);
   end;
  finally
    cdsPadrao.Close;
    Free;
  end;
end;
 
procedure TfrmPrevNotaProm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrevNotaProm.btnImpClick(Sender: TObject);
begin
  Imprime(False);
end;

procedure TfrmPrevNotaProm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmPrevNotaProm.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
  ReordenaBotoes([btnImprimir, btnImp, btnCancel]);
end;

procedure TfrmPrevNotaProm.dbeClienteClickButton(Sender: TObject);
begin
//  cdsPadrao.Close;
//  if not TfrmModeloConsulta.Execute('Cliente', cdsPadrao, FN_CLIENTES, DL_CLIENTES) then
//    cdsPadrao.Close;
end;

procedure TfrmPrevNotaProm.btnImprimirClick(Sender: TObject);
begin
  Imprime(True);
end;

procedure TfrmPrevNotaProm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPadrao.Close;
  Action := caFree;
end;

initialization
  RegisterClass(TfrmPrevNotaProm);
finalization
  UnRegisterClass(TfrmPrevNotaProm);
end.
