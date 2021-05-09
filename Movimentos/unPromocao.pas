unit unPromocao;

interface

uses
  Messages, ExtCtrls, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, Buttons, ComCtrls, VarGlobal, Grids,
  DBGrids, memds, Sqldb, ConstPadrao, DateUtils, FMTBcd, lcltype, ZDataset,
  ZSqlUpdate;

type

  { TfrmPromocao }

  TfrmPromocao = class(TfrmPadrao)
    dbgrdPromocao: TDBGrid;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure miExcluirtodasClick(Sender: TObject);
  private
  public
  end;

var
  frmPromocao: TfrmPromocao;

implementation

uses Funcoes, unModeloConsulta, unPrevPromocao, uConfiguraRelatorio, udatabaseutils;

{$R *.dfm}

procedure TfrmPromocao.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames    := FN_PROMOCAO;
  DisplayLabels := DL_PROMOCAO;
  aCaption      := 'Promocao';
end;


procedure TfrmPromocao.actPrintExecute(Sender: TObject);
begin
  with TfrmPrevPromocao.Create(nil) do
  try
    cdsPadrao.Close;
    cdsPadrao.Open;
    lbTitulo.Caption := 'Listagem de promocoes';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmPromocao.miExcluirtodasClick(Sender: TObject);
begin
  inherited;
  if not MsgSN('Deseja realmente excluir todas as promocoes?') then
    Exit;
  with TZQuery.Create(nil) do
  try
    Connection := getzConnection;
    SQL.Clear;
    SQL.Text :='delete from PROMOCAO';
    ExecSQL;
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmPromocao);
finalization
  UnRegisterClass(TfrmPromocao);
end.

