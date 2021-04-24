unit unCadastroGrupo;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, memds,  SqlDb,  DBCtrls,
  FMTBcd;

type
  TfrmCadastroGrupo = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    sqldPadraoCODGRUPO: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODGRUPO: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    dbeNomeGrupo: TDBEdit;
    dbeCodGrupo: TDBEdit;
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

