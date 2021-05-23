unit unCadastroCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, Mask, DBCtrls,  DBClient, Provider,
  SqlExpr, FMTBcd, System.Actions;

type
  TfrmCadastroCaixa = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dbeCodCaixa: TDBEdit;
    dbeNomeCaixa: TDBEdit;
    dbchkInativo: TDBCheckBox;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoINATIVO: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoINATIVO: TStringField;
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
    procedure actDeleteExecute(Sender: TObject);
  private
  public
  end;

var
  frmCadastroCaixa: TfrmCadastroCaixa;

implementation

uses
  Funcoes, ConstPadrao, VarGlobal;

{$R *.dfm}

procedure TfrmCadastroCaixa.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('CAIXAS', cdsPadraoCODIGO, GetConnection);
  cdsPadraoINATIVO.AsString := 'N';
  SetFocusIfCan(dbeNomeCaixa);
end;

procedure TfrmCadastroCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_CAIXAS;
  DisplayLabels := DL_CAIXAS;
  aCaption := 'Caixas';
end;

procedure TfrmCadastroCaixa.cdsPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dbchkInativo.Enabled := (DataSet.State = dsEdit) or
    ((DataSet.State = dsBrowse) and (not DataSet.IsEmpty));
end;

procedure TfrmCadastroCaixa.actDeleteExecute(Sender: TObject);
begin
  if cdsPadraoINATIVO.AsString = 'S' then
  begin
    MsgAviso('Esta conta caixa já está inativa.');
    Exit;
  end;
  
  if MsgSN('Deseja inativar ésta conta caixa?') then
  begin
    cdsPadrao.Edit;
    cdsPadraoINATIVO.AsString := 'S';
    cdsPadrao.ApplyUpdates(0);
  end;
end;

initialization
  RegisterClass(TfrmCadastroCaixa);
finalization
  UnRegisterClass(TfrmCadastroCaixa);
end.
