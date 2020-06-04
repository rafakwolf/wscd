unit unCadastroGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, Mask, DBCtrls,
  FMTBcd, System.Actions, uniGUIClasses, uniEdit, uniDBEdit, uniButton,
  uniBitBtn, uniSpeedButton, uniPanel, uniGUIBaseClasses, uniStatusBar;

type
  TfrmCadastroGrupo = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
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

