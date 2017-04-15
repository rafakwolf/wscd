unit unExclusaoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, Buttons, StdCtrls, VarGlobal,
  SqlExpr, Provider, DBClient, ComCtrls, FMTBcd, unSimplePadrao;

type
  TfrmExclusaoProduto = class(TfrmSimplePadrao)
    Grade: TDBGrid;
    dsPadrao: TDataSource;
    btnFechar: TSpeedButton;
    btnExcluir: TSpeedButton;
    sqlPadrao: TSQLQuery;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    bvlLinha: TBevel;
    stbStatus: TStatusBar;
    grpPesquisa: TGroupBox;
    edCodigo: TEdit;
    edDescricao: TEdit;
    sqlPadraoCODBARRA: TStringField;
    sqlPadraoDESCRICAO: TStringField;
    sqlPadraoESTOQUE: TIntegerField;
    sqlPadraoEXCLUIR: TStringField;
    cdsPadraoCODBARRA: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoESTOQUE: TIntegerField;
    cdsPadraoEXCLUIR: TStringField;
    procedure edDescricaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure GradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCodigoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure edCodigoEnter(Sender: TObject);
    procedure edDescricaoEnter(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure edDescricaoExit(Sender: TObject);
  private
  public
  end;

var
  frmExclusaoProduto: TfrmExclusaoProduto;

implementation

uses Funcoes,  unAguarde, uDatabaseutils;

{$R *.dfm}

procedure TfrmExclusaoProduto.edDescricaoChange(Sender: TObject);
begin
  if edDescricao.Text <> 'Descrição...' then
  begin
    Filtro(cdsPadrao, 'DESCRICAO', edDescricao.Text);
    cdsPadrao.Filtered := True;
  end;  
end;

procedure TfrmExclusaoProduto.FormShow(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then
  begin
    MsgCuidado('Não existem produtos cadastrados.');
    PostMessage(Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmExclusaoProduto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmExclusaoProduto.btnExcluirClick(Sender: TObject);

  function RegMarcados: Integer;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := GetConnection;
      CommandText := 'select count(1) as CONT from PRODUTOS where EXCLUIR = '+QuotedStr('S');
      Open;
      Result := FieldByName('CONT').AsInteger;
    finally
      Free;
    end;
  end;

begin

  if RegMarcados < 1 then
  begin
    MsgCuidado('Nenhum registro marcado, para marcar/desmarcar dê um duplo clique no registro desejado.');
    Exit;
  end;

  with TSQLDataSet.Create(Self) do
  try
    SQLConnection := GetConnection;
    Close;
    CommandText := 'DELETE FROM PRODUTOS WHERE EXCLUIR = ' + QuotedStr('S');
    ExecSQL;
    MsgAviso('Exclusão efetuada com sucesso!');
  finally
    Free;
    cdsPadrao.Close;
    cdsPadrao.Open;
  end;
end;

procedure TfrmExclusaoProduto.GradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if cdsPadraoEXCLUIR.AsString = 'S' then
    Grade.Canvas.Brush.Color := $0080FFFF
  else
    Grade.Canvas.Brush.Color := clWindow;

  if (gdSelected in State) then
    Grade.Canvas.Brush.Color := clMenuHighlight;  

  Grade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmExclusaoProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPadrao.Filtered := False;
  cdsPadrao.Close;
  Action := caFree;
end;

procedure TfrmExclusaoProduto.edCodigoChange(Sender: TObject);
begin
  if edCodigo.Text <> 'Código...' then
  begin
    Filtro(cdsPadrao, 'CODBARRA', edCodigo.Text);
    cdsPadrao.Filtered := True;
  end;
end;

procedure TfrmExclusaoProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 59,'');
end;

procedure TfrmExclusaoProduto.FormCreate(Sender: TObject);
begin
  try
    TfrmAguarde.Execute('Ajustando dados...');
    inherited;
    CentralizaForm(Self);
    UpdateSingleField('UPDATE PRODUTOS SET EXCLUIR = '+QuotedStr('N'));
    cdsPadrao.Open;
  finally
    FreeAndNil(frmAguarde);
  end;
end;

procedure TfrmExclusaoProduto.GradeDblClick(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then Exit;
  cdsPadrao.Edit;
  if cdsPadraoEXCLUIR.AsString = 'S' then
    cdsPadraoEXCLUIR.AsString := 'N'
  else
    cdsPadraoEXCLUIR.AsString := 'S';

  cdsPadrao.ApplyUpdates(0);
  cdsPadrao.Next;
end;

procedure TfrmExclusaoProduto.edCodigoEnter(Sender: TObject);
begin
  if Trim(edCodigo.Text) = 'Código...' then
    edCodigo.Clear;
end;

procedure TfrmExclusaoProduto.edDescricaoEnter(Sender: TObject);
begin
  if Trim(edDescricao.Text) = 'Descrição...' then
    edDescricao.Clear;
end;

procedure TfrmExclusaoProduto.edCodigoExit(Sender: TObject);
begin
  if Trim(edCodigo.Text) = '' then
    edCodigo.Text := 'Código...';
end;

procedure TfrmExclusaoProduto.edDescricaoExit(Sender: TObject);
begin
  if Trim(edDescricao.Text) = '' then
    edDescricao.Text := 'Descrição...';
end;

initialization
  RegisterClass(TfrmExclusaoProduto);
finalization
  UnRegisterClass(TfrmExclusaoProduto);
end.
