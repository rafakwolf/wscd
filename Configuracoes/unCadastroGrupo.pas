unit unCadastroGrupo;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb,  DBCtrls, ZSqlUpdate, ZDataset,
  FMTBcd;

type

  { TfrmCadastroGrupo }

  TfrmCadastroGrupo = class(TfrmPadrao)
    dbeNomeGrupo: TDBEdit;
    dbeCodGrupo: TDBEdit;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmCadastroGrupo: TfrmCadastroGrupo;

implementation

uses
  ConstPadrao;

{$R *.dfm}

procedure TfrmCadastroGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_GRUPOS;
  DisplayLabels := DL_GRUPOS;
  aCaption := 'Grupos';
end;

initialization
  RegisterClass(TfrmCadastroGrupo);
finalization
  UnRegisterClass(TfrmCadastroGrupo);
end.

