unit unAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, DBCtrls, Mask,
  PLDBEdit, FMTBcd, System.Actions, VarGlobal;

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
    dbeNome: TPLDBEdit;
    dbeFax: TPLDBEdit;
    grpTelefone: TGroupBox;
    btnObs: TBitBtn;
    sqldPadraoIDAGENDA: TIntegerField;
    cdsPadraoIDAGENDA: TIntegerField;
    N5: TMenuItem;
    dbeFone1: TDBEdit;
    dbeFone2: TDBEdit;
    dbeFone3: TDBEdit;
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
