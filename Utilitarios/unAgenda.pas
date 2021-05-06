unit unAgenda;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls, SqlDb, DBCtrls, ZDataset, ZSqlUpdate,
  FMTBcd;

type

  { TfrmAgenda }

  TfrmAgenda = class(TfrmPadrao)
    dbeFone1: TDBEdit;
    dbeNome: TDBEdit;
    dbmObs: TDBMemo;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses
  ConstPadrao, unDmPrincipal;

{$R *.lfm}

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  aCaption := 'Agenda';
  FieldNames := FN_AGENDA;
  DisplayLabels := DL_AGENDA;
  TableName:= 'Agenda';
  IdField:='IDAGENDA';
end;

initialization
  RegisterClass(TfrmAgenda);
finalization
  UnRegisterClass(TfrmAgenda);

end.
