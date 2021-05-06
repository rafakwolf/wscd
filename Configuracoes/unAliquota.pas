unit unAliquota;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, Buttons,  
  ComCtrls, SqlDb, StdCtrls,  DBCtrls, ZDataset, ZSqlUpdate,
  ConstPadrao, Funcoes, FMTBcd,  VarGlobal;

type

  { TfrmAliquota }

  TfrmAliquota = class(TfrmPadrao)
    dbeAliquota: TDBEdit;
    dbeCodAliquota: TDBEdit;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
  private
  public
  end;

var
  frmAliquota: TfrmAliquota;

implementation
uses unDmPrincipal;

{$R *.dfm}

procedure TfrmAliquota.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_ALIQUOTAS;
  DisplayLabels := DL_ALIQUOTAS;
  aCaption := 'Aliquotas';
  TableName:='ALIQUOTAS';
end;

procedure TfrmAliquota.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  SetFocusIfCan(dbeCodAliquota);
end;

initialization
  RegisterClass(TfrmAliquota);
finalization
  UnRegisterClass(TfrmAliquota);
end.
