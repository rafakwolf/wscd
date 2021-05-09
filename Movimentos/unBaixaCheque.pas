unit unBaixaCheque;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, Buttons, DBCtrls, ZDataset, 
  DB, memds, Sqldb, FMTBcd;

type

  { TfrmBaixaCheque }

  TfrmBaixaCheque = class(TfrmSimplePadrao)
    dsCaixa: TDataSource;
    lbContaCaixa: TLabel;
    lbDataBaixa: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    medtDataBaixa: TEdit;
    cedHistorico: TEdit;
    dblcbContaCaixa: TDBLookupComboBox;
    ZQuery1: TZQuery;
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
  ZQuery1.Close;
  inherited;
end;

class function TfrmBaixaCheque.Execute(var IdContaCaixa: Integer;
  var Historico, DataBaixa: string): Boolean;
begin
   frmBaixaCheque := TfrmBaixaCheque.Create(Application);
   with frmBaixaCheque do
   try

     ZQuery1.Open;
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
     ZQuery1.Close;
     FreeAndNil(frmBaixaCheque);
   end;
end;

procedure TfrmBaixaCheque.FormShow(Sender: TObject);
begin
  inherited;
  SetFocusIfCan(cedHistorico);
end;

end.
