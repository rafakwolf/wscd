unit unSelecionaCaixa;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, memds,  SqlDb, DBCtrls, StdCtrls,
  Buttons, Funcoes, ZDataset, FMTBcd;

type

  { TfrmSelecionaCaixa }

  TfrmSelecionaCaixa = class(TForm)
    dsCaixa: TDataSource;
    lbCaixa: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dblcbCaixa: TDBLookupComboBox;
    ZQuery1: TZQuery;
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
    ZQuery1.Open;

    Result := ShowModal = mrOk;

    if Result then
      Retorno := dblcbCaixa.KeyValue
    else
      Retorno := -1;
  finally
    ZQuery1.Close;
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
