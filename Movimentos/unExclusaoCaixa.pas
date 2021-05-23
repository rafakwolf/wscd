unit unExclusaoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, DBClient,
  Provider, SqlExpr, Grids, DBGrids, ExtCtrls, FMTBcd, unSimplePadrao;

type
  TfrmExclusaoCaixa = class(TfrmSimplePadrao)
    stbCaixa: TStatusBar;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dsPadrao: TDataSource;
    dbgrdCaixa: TDBGrid;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    grpBusca: TGroupBox;
    edDescricao: TEdit;
    edtDocumento: TEdit;
    bvlLinha: TBevel;
    sqldPadraoCODCAIXA: TIntegerField;
    sqldPadraoCODCAIXAS: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoEXCLUIR: TStringField;
    cdsPadraoCODCAIXA: TIntegerField;
    cdsPadraoCODCAIXAS: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoEXCLUIR: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure dbgrdCaixaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsPadraoTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure edDescricaoChange(Sender: TObject);
    procedure edtDocumentoExit(Sender: TObject);
    procedure edDescricaoExit(Sender: TObject);
    procedure edtDocumentoEnter(Sender: TObject);
    procedure edDescricaoEnter(Sender: TObject);
    procedure edtDocumentoChange(Sender: TObject);
    procedure dbgrdCaixaDblClick(Sender: TObject);
  private
  public
  end;

var
  frmExclusaoCaixa: TfrmExclusaoCaixa;

implementation

uses Funcoes,  ConstPadrao, unAguarde, VarGlobal, uDatabaseUtils;

{$R *.dfm}

procedure TfrmExclusaoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 71,'');
end;

procedure TfrmExclusaoCaixa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmExclusaoCaixa.dbgrdCaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if cdsPadraoEXCLUIR.AsString = 'S' then
    dbgrdCaixa.Canvas.Brush.Color := $0080FFFF
  else
    dbgrdCaixa.Canvas.Brush.Color := clWindow;

  if (gdSelected in State) then
    dbgrdCaixa.Canvas.Brush.Color := clMenuHighlight;

  dbgrdCaixa.Canvas.FillRect(Rect);
  dbgrdCaixa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmExclusaoCaixa.btnExcluirClick(Sender: TObject);

  function ContasMarcadas: Integer;
  begin
    with TSQLDataSet.Create(nil) do
    try
      //SQLConnection := GetConnection;
      CommandText := 'select count(1) CONT from CAIXA '+
        'where EXCLUIR = '+QuotedStr('S');
      Open;
      Result := FieldByName('CONT').AsInteger;  
    finally
      Free;
    end;
  end;

begin

  if ContasMarcadas < 1 then
  begin
    MsgCuidado('N�o existe nenhum registro marcado para exclus�o.'+#13#10+
      'Para marcar/desmarcar d� duplo clique no lan�amento desejado.');
    Exit;
  end;
  
  if MsgSN('Deseja realmente excluir os lan�amentos marcados?') then
  begin
    with TSQLDataSet.Create(nil) do
    try
      //SQLConnection := GetConnection;
      Close;
      CommandText := 'DELETE FROM CAIXA WHERE EXCLUIR = ' + QuotedStr('S');
      ExecSQL;
      MsgAviso('Exclus�o efetuada com sucesso!');
    finally
      Free;
      cdsPadrao.Close;
      cdsPadrao.Open;
      PostMessageAllForms(WM_EXCLUSAO_CAIXA);
    end;
  end;  
end;

procedure TfrmExclusaoCaixa.FormCreate(Sender: TObject);
begin
  try
    TfrmAguarde.Execute('Ajustando dados...');
    inherited;
    CentralizaForm(Self);
    UpdateSingleField('update CAIXA set EXCLUIR = '+QuotedStr('N'));
    cdsPadrao.Open;
  finally
    FreeAndNil(frmAguarde);
  end;
end;

procedure TfrmExclusaoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPadrao.Close;
  Action := caFree;
end;

procedure TfrmExclusaoCaixa.cdsPadraoTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = 'C' then
    Text:= 'Entrada'
  else if Sender.AsString = 'D' then
    Text := 'Sa�da';
end;

procedure TfrmExclusaoCaixa.edDescricaoChange(Sender: TObject);
begin
  cdsPadrao.Locate('DESCRICAO', edDescricao.Text,
    [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmExclusaoCaixa.edtDocumentoExit(Sender: TObject);
begin
  if Trim(edtDocumento.Text) = '' then
    edtDocumento.Text := 'Documento...';
end;

procedure TfrmExclusaoCaixa.edDescricaoExit(Sender: TObject);
begin
  if Trim(edDescricao.Text) = '' then
    edDescricao.Text := 'Descri��o...';
end;

procedure TfrmExclusaoCaixa.edtDocumentoEnter(Sender: TObject);
begin
  if Trim(edtDocumento.Text) = 'Documento...' then
    edtDocumento.Clear;
end;

procedure TfrmExclusaoCaixa.edDescricaoEnter(Sender: TObject);
begin
  if Trim(edDescricao.Text) = 'Descri��o...' then
    edDescricao.Clear;
end;

procedure TfrmExclusaoCaixa.edtDocumentoChange(Sender: TObject);
begin
  cdsPadrao.Locate('DOCUMENTO', edtDocumento.Text,
    [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmExclusaoCaixa.dbgrdCaixaDblClick(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then
    Exit;
  cdsPadrao.Edit;
  if cdsPadraoEXCLUIR.AsString = 'S' then
    cdsPadraoEXCLUIR.AsString := 'N'
  else
    cdsPadraoEXCLUIR.AsString := 'S';

  cdsPadrao.ApplyUpdates(0);
  cdsPadrao.Next;
end;

initialization
  RegisterClass(TfrmExclusaoCaixa);
finalization
  UnRegisterClass(TfrmExclusaoCaixa);
end.
