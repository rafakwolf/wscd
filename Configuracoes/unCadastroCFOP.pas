unit unCadastroCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, Mask, DBCtrls,
   FMTBcd, System.Actions;

type
  TfrmCadastroCFOP = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dbeCodCfop: TDBEdit;
    dbeNomeCfop: TDBEdit;
    dbmCfNota: TDBMemo;
    lblDescricao: TLabel;
    sqldPadraoNUMERO: TStringField;
    sqldPadraoOPERACAO: TStringField;
    cdsPadraoNUMERO: TStringField;
    cdsPadraoOPERACAO: TStringField;
    N5: TMenuItem;
    sqldPadraoCFNOTA: TStringField;
    cdsPadraoCFNOTA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
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
end;

procedure TfrmCadastroCFOP.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  SetFocusIfCan(dbeCodCfop);
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

