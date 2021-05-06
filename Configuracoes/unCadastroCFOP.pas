unit unCadastroCFOP;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb,  DBCtrls, ZDataset, ZSqlUpdate,
  FMTBcd;

type

  { TfrmCadastroCFOP }

  TfrmCadastroCFOP = class(TfrmPadrao)
    dbeNomeCfop: TDBEdit;
    dbeCodCfop: TDBEdit;
    dbmCfNota: TDBMemo;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
  public
  end;

var
  frmCadastroCFOP: TfrmCadastroCFOP;

implementation

uses
  ConstPadrao, funcoes, uConfiguraRelatorio, unPrevRelCFOPs;

{$R *.dfm}

procedure TfrmCadastroCFOP.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_CFOP;
  DisplayLabels := DL_CFOP;
  aCaption := 'Cfop';
  tableName:='CFOP';
end;

procedure TfrmCadastroCFOP.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevRelCFOPs.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.Open;
    lbTitulo.Caption := 'Listagem de CFOPs';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmCadastroCFOP);
finalization
  UnRegisterClass(TfrmCadastroCFOP);
end.

