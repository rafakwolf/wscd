unit unBaixaCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, Buttons, DBCtrls, PLEdit,
  DB, DBClient, PLClientDataSet, Provider, PLDataSetProvider,
  SqlExpr, PLSQLDataSet, Mask, FMTBcd;

type
  TfrmBaixaCheque = class(TfrmSimplePadrao)
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    cedHistorico: TPLEdit;
    dblcbContaCaixa: TDBLookupComboBox;
    lbContaCaixa: TLabel;
    sqldCaixa: TPLSQLDataSet;
    dspCaixa: TPLDataSetProvider;
    cdsCaixa: TPLClientDataSet;
    dsCaixa: TDataSource;
    sqldCaixaCODIGO: TIntegerField;
    sqldCaixaNOME: TStringField;
    cdsCaixaCODIGO: TIntegerField;
    cdsCaixaNOME: TStringField;
    medtDataBaixa: TMaskEdit;
    lbDataBaixa: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
  public
    class function Execute(var IdContaCaixa: Integer;
      var Historico, DataBaixa: string): Boolean;
  end;

var
  frmBaixaCheque: TfrmBaixaCheque;

implementation

uses Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmBaixaCheque.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
end;

procedure TfrmBaixaCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsCaixa.Close;
  inherited;
end;

class function TfrmBaixaCheque.Execute(var IdContaCaixa: Integer;
  var Historico, DataBaixa: string): Boolean;
begin
   frmBaixaCheque := TfrmBaixaCheque.Create(Application);
   with frmBaixaCheque do
   try

     cdsCaixa.Open;
     dblcbContaCaixa.KeyValue := Configuracao.CaixaPadrao;
     medtDataBaixa.Text := FormatDateTime('dd/mm/yyyy', Date);

     Result := ShowModal = mrOk;

     if Result then
     begin
       IdContaCaixa := dblcbContaCaixa.KeyValue;
       Historico    := cedHistorico.Text;
       DataBaixa    := medtDataBaixa.Text;
     end
     else
     begin
       IdContaCaixa := -1;
       Historico    := '';
       DataBaixa    := '';
     end;
   finally
     cdsCaixa.Close;
     FreeAndNil(frmBaixaCheque);
   end;
end;

procedure TfrmBaixaCheque.FormShow(Sender: TObject);
begin
  inherited;
  SetFocusIfCan(cedHistorico);
end;

end.
