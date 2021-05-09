unit unCadastroCaixa;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls, DBCtrls, ZDataset, ZSqlUpdate, SqlDb, FMTBcd;

type

  { TfrmCadastroCaixa }

  TfrmCadastroCaixa = class(TfrmPadrao)
    dbeNomeCaixa: TDBEdit;
    dbeCodCaixa: TDBEdit;
    dbchkInativo: TDBCheckBox;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
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

procedure TfrmCadastroCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_CAIXAS;
  DisplayLabels := DL_CAIXAS;
  aCaption := 'Caixas';
  TableName:='CAIXAS';
end;

procedure TfrmCadastroCaixa.actDeleteExecute(Sender: TObject);
begin
  if ZQuery1.FieldByName('INATIVO').AsString = 'S' then
  begin
    MsgAviso('Esta conta caixa já está inativa.');
    Exit;
  end;
  
  if MsgSN('Deseja inativar esta conta caixa?') then
  begin
    ZQuery1.Edit;
    ZQuery1.FieldByName('INATIVO').AsString := 'S';
    ZQuery1.ApplyUpdates;
  end;
end;

initialization
  RegisterClass(TfrmCadastroCaixa);
finalization
  UnRegisterClass(TfrmCadastroCaixa);
end.
