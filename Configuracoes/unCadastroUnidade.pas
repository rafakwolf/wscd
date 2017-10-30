unit unCadastroUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, DB, DBClient, Provider, SqlExpr, Menus,
  ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask,
  DBCtrls,  FMTBcd, System.Actions, uniGUIClasses, uniEdit, uniDBEdit,
  uniButton, uniBitBtn, uniSpeedButton, uniPanel, uniGUIBaseClasses,
  uniStatusBar;

type
  TfrmCadastroUnidade = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldPadraoCODUNIDADE: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODUNIDADE: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    dbeNomeUnidade: TUniDBEdit;
    dbeCodUnidade: TUniDBEdit;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmCadastroUnidade: TfrmCadastroUnidade;

implementation

uses
  ConstPadrao;

{$R *.dfm}

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
