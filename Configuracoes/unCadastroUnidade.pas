unit unCadastroUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, DB, DBClient, Provider, SqlExpr, Menus,
  ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask,
  DBCtrls,  FMTBcd, System.Actions;

type
  TfrmCadastroUnidade = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dbeCodUnidade: TDBEdit;
    dbeNomeUnidade: TDBEdit;
    sqldPadraoCODUNIDADE: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODUNIDADE: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmCadastroUnidade: TfrmCadastroUnidade;

implementation

uses
  Funcoes, ConstPadrao, VarGlobal;

{$R *.dfm}

procedure TfrmCadastroUnidade.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('UNIDADES', cdsPadraoCODUNIDADE, GetConnection);
  SetFocusIfCan(dbeNomeUnidade);
end;

procedure TfrmCadastroUnidade.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_UNIDADES;
  DisplayLabels := DL_UNIDADES;
  aCaption:= 'Unidades';
end;

initialization
  RegisterClass(TfrmCadastroUnidade);
finalization
  UnRegisterClass(TfrmCadastroUnidade);
end.
