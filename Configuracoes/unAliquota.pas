unit unAliquota;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, Buttons, ExtCtrls,
  ComCtrls, memds,  SqlDb, StdCtrls,  DBCtrls,
    ConstPadrao, Funcoes, FMTBcd,  VarGlobal;

type
  TfrmAliquota = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    cdsPadraoCODALIQUOTA: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    dbeAliquota: TDBEdit;
    dbeCodAliquota: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
  private
  public
  end;

var
  frmAliquota: TfrmAliquota;

implementation

{$R *.dfm}

procedure TfrmAliquota.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_ALIQUOTAS;
  DisplayLabels := DL_ALIQUOTAS;
  aCaption := 'Aliquotas'; 
end;

procedure TfrmAliquota.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('ALIQUOTAS', cdsPadraoCODALIQUOTA, GetConnection);
  SetFocusIfCan(dbeCodAliquota);
end;

initialization
  RegisterClass(TfrmAliquota);
finalization
  UnRegisterClass(TfrmAliquota);
end.
