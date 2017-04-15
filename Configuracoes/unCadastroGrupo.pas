unit unCadastroGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, Mask, DBCtrls,
   FMTBcd, System.Actions;

type
  TfrmCadastroGrupo = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dbeCodGrupo: TDBEdit;
    dbeNomeGrupo: TDBEdit;
    sqldPadraoCODGRUPO: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODGRUPO: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmCadastroGrupo: TfrmCadastroGrupo;

implementation

uses
  Funcoes, ConstPadrao, VarGlobal;

{$R *.dfm}

procedure TfrmCadastroGrupo.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('GRUPOS', cdsPadraoCODGRUPO, GetConnection);
  SetFocusIfCan(dbeNomeGrupo);
end;

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

