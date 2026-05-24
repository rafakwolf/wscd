unit unPrevNotaProm;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls, FileCtrl,
  ConstPadrao, ZDataset, ZAbstractRODataset, FMTBcd;

type

  { TfrmPrevNotaProm }

  TfrmPrevNotaProm = class(TForm)
    ComboBox1: TComboBox;
    pnlBotoes: TPanel;
    btnImp: TBitBtn;
    btnCancel: TBitBtn;
    btnImprimir: TBitBtn;
    dsPadrao: TDataSource;
    ZQuery1: TZQuery;
    ZQuery1CODCLIENTE: TZIntegerField;
    ZQuery1NOME: TZRawStringField;
    procedure btnCancelClick(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure Imprime(p: Boolean);
  public
  end;

var
  frmPrevNotaProm: TfrmPrevNotaProm;

implementation

uses
  Funcoes, unPrevContasClientes, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmPrevNotaProm.Imprime(p: Boolean);
var selected: string;
    selectedID : string;
begin
    if (ComboBox1.ItemIndex < 0) then
  begin
    ShowMessage('Selecione um cliente.');
    exit;
  end;

  selected := ComboBox1.Items[ComboBox1.ItemIndex];

  selectedID:=selected.Substring(
      0, selected.IndexOf('-') - 1
     );

  with TfrmPrevContasClientes.Create(Self) do
  try
    with sqldPadrao do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select '+
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
     Params.ParamByName('PCLIENTE').AsInteger := Strtoint(selectedID);
     Open;
     PrintIfNotEmptyRL(rrPadrao, p);
   end;
  finally
    sqldPadrao.Close;
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


procedure TfrmPrevNotaProm.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
  ReordenaBotoes([btnImprimir, btnImp, btnCancel]);
end;


procedure TfrmPrevNotaProm.btnImprimirClick(Sender: TObject);
begin
  Imprime(True);
end;

procedure TfrmPrevNotaProm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ZQuery1.Close;
  Action := caFree;
end;

procedure TfrmPrevNotaProm.FormShow(Sender: TObject);
begin
  zquery1.Close;
  ZQuery1.open;

  ComboBox1.Clear;

  while not zquery1.EOF do
begin
  ComboBox1.Items.Add(ZQuery1CODCLIENTE.AsString +' - '+ ZQuery1NOME.AsString);
  zquery1.Next;
end;

end;

initialization
  RegisterClass(TfrmPrevNotaProm);
finalization
  UnRegisterClass(TfrmPrevNotaProm);
end.
