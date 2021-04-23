unit unCadastroCaixa;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls,  DBCtrls,  memds, 
  SqlDb, FMTBcd,   uniEdit, uniDBEdit, 
    uniPanel,  uniStatusBar,
   uniDBCheckBox;

type
  TfrmCadastroCaixa = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoINATIVO: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoINATIVO: TStringField;
    dbeNomeCaixa: TDBEdit;
    dbeCodCaixa: TDBEdit;
    dbchkInativo: TDBCheckBox;
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
    MsgAviso('Esta conta caixa j� est� inativa.');
    Exit;
  end;
  
  if MsgSN('Deseja inativar �sta conta caixa?') then
  begin
    cdsPadrao.Edit;
    cdsPadraoINATIVO.AsString := 'S';
    //cdsPadrao.ApplyUpdates(0);
  end;
end;

initialization
  RegisterClass(TfrmCadastroCaixa);
finalization
  UnRegisterClass(TfrmCadastroCaixa);
end.
