unit unVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, Buttons, ExtCtrls, ComCtrls,
  DBClient,  Datasnap.Provider,
  Data.SqlExpr, StdCtrls, DBCtrls, Mask,  FMTBcd, System.Actions, uniGUIClasses,
  uniEdit, uniDBEdit, uniButton, uniBitBtn, uniSpeedButton, uniPanel,
  uniGUIBaseClasses, uniStatusBar, uniCheckBox, uniDBCheckBox;

type
  TfrmVendedor = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldPadraoIDVENDEDOR: TIntegerField;
    sqldPadraoVENDEDOR: TStringField;
    sqldPadraoATIVO: TStringField;
    cdsPadraoIDVENDEDOR: TIntegerField;
    cdsPadraoVENDEDOR: TStringField;
    cdsPadraoATIVO: TStringField;
    dbeIdVendedor: TDBEdit;
    dbeVendedor: TDBEdit;
    dbcbAtivo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
  private
  public
  end;

var
  frmVendedor: TfrmVendedor;

implementation

uses ConstPadrao,  Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmVendedor.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_VENDEDOR;
  DisplayLabels := DL_VENDEDOR;
  aCaption := 'Vendedor';
end;

procedure TfrmVendedor.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('VENDEDOR', cdsPadraoIDVENDEDOR, GetConnection);
  cdsPadraoATIVO.AsString := 'S';
  SetFocusIfCan(dbeVendedor);
end;

procedure TfrmVendedor.cdsPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dbcbAtivo.Enabled := (DataSet.State = dsEdit) or
    ((DataSet.State = dsBrowse) and (not DataSet.IsEmpty));
end;

initialization
  RegisterClass(TfrmVendedor);
finalization
  UnRegisterClass(TfrmVendedor);
end.
