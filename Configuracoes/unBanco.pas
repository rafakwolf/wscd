unit unBanco;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,    SqlDb, DBCtrls, ZDataset, ZSqlUpdate,
   FMTBcd;

type

  { TfrmBanco }

  TfrmBanco = class(TfrmPadrao)
    dbeCodCompensacao: TDBEdit;
    dbeBanco: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    sqldPadrao: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  frmBanco: TfrmBanco;

implementation

uses ConstPadrao;

{$R *.dfm}

procedure TfrmBanco.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_BANCO;
  DisplayLabels := DL_BANCO;
  aCaption := 'Bancos';
  TableName:='BANCO';
end;

procedure TfrmBanco.FormShow(Sender: TObject);
begin
  IgnoreAutoGenerateLabels:=true;
  inherited;
end;

initialization
  RegisterClass(TfrmBanco);
finalization
  UnRegisterClass(TfrmBanco);

end.
