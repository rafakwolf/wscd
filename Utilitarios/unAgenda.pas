unit unAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, DBCtrls, Mask,
  FMTBcd, System.Actions, uniMainMenu, uniBitBtn, uniButton,
  uniSpeedButton, uniGUIClasses, uniPanel, uniGUIBaseClasses, uniStatusBar,
  uniEdit, uniDBEdit, uniGroupBox, uniMemo, uniDBMemo, UniGUIVars;

type
  TfrmAgenda = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldPadraoNOME: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoTELEFONE2: TStringField;
    sqldPadraoTELEFONE3: TStringField;
    sqldPadraoFAX: TStringField;
    sqldPadraoOBS: TMemoField;
    cdsPadraoNOME: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoTELEFONE2: TStringField;
    cdsPadraoTELEFONE3: TStringField;
    cdsPadraoFAX: TStringField;
    cdsPadraoOBS: TMemoField;
    sqldPadraoIDAGENDA: TIntegerField;
    cdsPadraoIDAGENDA: TIntegerField;
    dbeNome: TDBEdit;
    dbeFax: TDBEdit;
    grpTelefone: TGroupBox;
    dbeFone1: TDBEdit;
    dbeFone2: TDBEdit;
    dbeFone3: TDBEdit;
    dbmObs: TDBMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses
  ConstPadrao;

{$R *.dfm}

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  aCaption := 'Agenda';
  FieldNames := FN_AGENDA;
  DisplayLabels := DL_AGENDA;
end;

initialization
  RegisterClass(TfrmAgenda);
finalization
  UnRegisterClass(TfrmAgenda);

end.
