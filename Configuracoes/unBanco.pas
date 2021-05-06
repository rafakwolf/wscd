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
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
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

initialization
  RegisterClass(TfrmBanco);
finalization
  UnRegisterClass(TfrmBanco);

end.
