unit unSelecionaCaixa;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, memds,  SqlDb, DBCtrls, StdCtrls,
  Buttons, Funcoes, FMTBcd,   uniLabel,
      uniComboBox, uniDBComboBox,
  uniDBLookupComboBox;

type
  TfrmSelecionaCaixa = class(TForm)
    sqldCaixa: TSQLQuery;
    dspCaixa: TComponent;
    cdsCaixa: TMemDataSet;
    dsCaixa: TDataSource;
    sqldCaixaCODIGO: TIntegerField;
    sqldCaixaNOME: TStringField;
    cdsCaixaCODIGO: TIntegerField;
    cdsCaixaNOME: TStringField;
    lbCaixa: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dblcbCaixa: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    class function Execute(var Retorno: Integer): Boolean;
  end;

var
  frmSelecionaCaixa: TfrmSelecionaCaixa;

implementation

{$R *.dfm}

class function TfrmSelecionaCaixa.Execute(var Retorno: Integer): Boolean;
begin
  frmSelecionaCaixa := TfrmSelecionaCaixa.Create(Application);
  with frmSelecionaCaixa do
  try
    cdsCaixa.Open;

    Result := ShowModal = mrOk;

    if Result then
      Retorno := dblcbCaixa.KeyValue
    else
      Retorno := -1;
  finally
    cdsCaixa.Close;
    FreeAndNil(frmSelecionaCaixa);
  end;
end;

procedure TfrmSelecionaCaixa.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

procedure TfrmSelecionaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
