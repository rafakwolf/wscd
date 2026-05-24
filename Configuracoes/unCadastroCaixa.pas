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
    Label1: TLabel;
    Label2: TLabel;
    sqldPadrao: TZQuery;
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

  IgnoreAutoGenerateLabels:=true;
end;

procedure TfrmCadastroCaixa.actDeleteExecute(Sender: TObject);
begin
  if sqldPadrao.FieldByName('INATIVO').AsString = 'S' then
  begin
    MsgAviso('Esta conta caixa já está inativa.');
    Exit;
  end;
  
  if MsgSN('Deseja inativar esta conta caixa?') then
  begin
    sqldPadrao.Edit;
    sqldPadrao.FieldByName('INATIVO').AsString := 'S';
    sqldPadrao.ApplyUpdates;
  end;
end;

initialization
  RegisterClass(TfrmCadastroCaixa);
finalization
  UnRegisterClass(TfrmCadastroCaixa);
end.
