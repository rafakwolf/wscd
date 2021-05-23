unit unRepararIndice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, ComCtrls, Buttons, DB,
  SqlExpr, FMTBcd;

type
  TfrmRepararIndice = class(TfrmSimplePadrao)
    pbProcesso: TProgressBar;
    lbStatus: TLabel;
    btnReparar: TBitBtn;
    btnCancelar: TBitBtn;
    sqldPK: TSQLDataSet;
    sqldPKPK: TStringField;
    sqldPKTABELA: TStringField;
    sqldFK: TSQLDataSet;
    sqldFKFK: TStringField;
    sqldFKTABELA: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRepararClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Repara(IndexName: string);
  public
  end;

var
  frmRepararIndice: TfrmRepararIndice;

implementation

uses Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmRepararIndice.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRepararIndice.Repara(IndexName: string);
begin
  with TSQLDataSet.Create(nil) do
  try
    //SQLConnection:= GetConnection;
    CommandText := 'set statistics index '+trim(IndexName);
    ExecSQL;
  finally
    Free;
  end;    
end;

procedure TfrmRepararIndice.btnRepararClick(Sender: TObject);
begin
  inherited;

  // chaves primárias
  sqldPK.Open;
  sqldPK.First;
  pbProcesso.Position := 0;
  pbProcesso.Max := sqldPK.RecordCount;
  lbStatus.Caption := 'Reparando chaves primárias...';
  while not sqldPK.Eof do
  begin
    Repara(sqldPKPK.AsString);
    pbProcesso.Position := pbProcesso.Position + 1;
    sqldPK.Next;
    Application.ProcessMessages;
  end;
  sqldPK.Close;

  // chaves estrangeiras
  sqldFK.Open;
  sqldFK.First;
  pbProcesso.Position := 0;
  pbProcesso.Max := sqldFK.RecordCount;
  lbStatus.Caption := 'Reparando chaves estrangeiras...';
  while not sqldFK.Eof do
  begin
    Repara(sqldFKFK.AsString);
    pbProcesso.Position := pbProcesso.Position + 1;
    sqldFK.Next;
    Application.ProcessMessages;
  end;
  sqldPK.Close;

  lbStatus.Caption := 'Reparação concluída!';
end;

procedure TfrmRepararIndice.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
end;

initialization
  RegisterClass(TfrmRepararIndice);
finalization
  UnRegisterClass(TfrmRepararIndice);
end.
