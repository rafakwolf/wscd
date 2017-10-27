unit unAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, DBCtrls, Mask,
   FMTBcd, System.Actions, VarGlobal, uniMainMenu, uniBitBtn, uniButton,
  uniSpeedButton, uniGUIClasses, uniPanel, uniGUIBaseClasses, uniStatusBar,
  uniEdit, uniDBEdit, uniGroupBox;

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
    mmPadrao: TUniMainMenu;
    miRelatorios: TUniMenuItem;
    mImprimir: TUniMenuItem;
    N5: TUniMenuItem;
    btnObs: TUniBitBtn;
    dbeNome: TUniDBEdit;
    dbeFax: TUniDBEdit;
    grpTelefone: TUniGroupBox;
    dbeFone1: TUniDBEdit;
    dbeFone2: TUniDBEdit;
    dbeFone3: TUniDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure btnObsClick(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
  private
  public
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses
  Funcoes, ConstPadrao;

{$R *.dfm}

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  aCaption := 'Agenda';
  FieldNames := FN_AGENDA;
  DisplayLabels := DL_AGENDA;
end;

procedure TfrmAgenda.actPrintExecute(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioAgenda', 'Listagem dos telefones', Self);
end;

procedure TfrmAgenda.btnObsClick(Sender: TObject);
begin
  inherited;
  FormMemo(dsPadrao, 'OBS');
end;

procedure TfrmAgenda.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('AGENDA', cdsPadraoIDAGENDA, GetConnection);
  SetFocusIfCan(dbeNome);
end;

initialization
  RegisterClass(TfrmAgenda);
finalization
  UnRegisterClass(TfrmAgenda);
end.
