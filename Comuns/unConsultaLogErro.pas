unit unConsultaLogErro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, Buttons, Mask, Grids, DBGrids, DateUtils,
  ExtCtrls, DB, ShellAPI, Provider, DBClient,
  Data.SqlExpr, FMTBcd, uniGUIBaseClasses, uniGUIClasses, uniLabel, uniButton,
  uniBitBtn, uniPanel, uniEdit, uniBasicGrid, uniDBGrid;

type
  TfrmConsultaLogErro = class(TfrmSimplePadrao)
    dsLogErro: TDataSource;
    sdlgLogErro: TSaveDialog;
    sqldLogErro: TSQLDataSet;
    sqldLogErroIDLOGERRO: TIntegerField;
    sqldLogErroDATAHORA: TSQLTimeStampField;
    sqldLogErroFORM: TStringField;
    sqldLogErroCONTROLE: TStringField;
    sqldLogErroMSG: TStringField;
    cdsLogErro: TClientDataSet;
    cdsLogErroIDLOGERRO: TIntegerField;
    cdsLogErroDATAHORA: TSQLTimeStampField;
    cdsLogErroFORM: TStringField;
    cdsLogErroCONTROLE: TStringField;
    cdsLogErroMSG: TStringField;
    dspLogErro: TDataSetProvider;
    lbPeriodo: TUniLabel;
    lbPeriodo2: TUniLabel;
    btnPesquisar: TUniBitBtn;
    btnRelatorio: TUniBitBtn;
    btnFechar: TUniBitBtn;
    btnLimpar: TUniBitBtn;
    bvlLinha: TUniPanel;
    medtDataI: TUniEdit;
    medtDataF: TUniEdit;
    dbgrdLog: TUniDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdLogDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
  public
  end;

var
  frmConsultaLogErro: TfrmConsultaLogErro;

implementation

uses  Funcoes, unAguarde, VarGlobal;

{$R *.dfm}

procedure TfrmConsultaLogErro.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
  if not dsLogErro.DataSet.Active then
    dsLogErro.DataSet.Open;

  medtDataI.Text := FormatDateTime('dd/mm/yyyy', Date);
  medtDataF.Text := FormatDateTime('dd/mm/yyyy', Date); 
end;

procedure TfrmConsultaLogErro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsLogErro.DataSet.Close;
  inherited;
end;

procedure TfrmConsultaLogErro.btnPesquisarClick(Sender: TObject);
var
  DataI, DataF: TDatetime;
begin
  try
    DataI := StrToDate(medtDataI.text);
  except
    MsgAviso('Data inicial inválida.');
    medtDataI.SetFocus;
    Exit;
  end;

  try
    DataF := strtodate(medtDataF.text);
  except
    MsgAviso('Data final inválida.');
    medtDataF.setFocus;
    exit;
  end;

  with dsLogErro.DataSet do
  begin
    Close;
    Filtered := False;
    Filter   := 'DataHora>='+QuotedStr(FormatDateTime('dd/mm/yyyy', DataI))+
                ' and DataHora<='+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DataF)));
    Filtered := True;
    open;
  end;
end;

procedure TfrmConsultaLogErro.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaLogErro.btnRelatorioClick(Sender: TObject);
var
  mensagem: TStringList;
begin

  if dsLogErro.DataSet.IsEmpty then
  begin
    MsgAviso('Não existem dados para gerar relatório.');
    Exit;
  end;

  TfrmAguarde.Execute('Gerando...');

  mensagem := TStringList.Create;
  mensagem.Add('********************RELATÓRIO DE ERROS********************');

  try
    with dsLogErro.DataSet do
    begin
      DisableControls;
      First;
      While not(eof) do
      begin
        mensagem.Add('----------------------------------------------------------');
        mensagem.Add('Data......: '+FieldbyName('DataHora').asString);
        mensagem.Add('Form......: '+FieldbyName('Form').asString);
        mensagem.Add('Controle..: '+FieldByName('Controle').asString);
        mensagem.Add('Mensagem..: '+FieldByName('Msg').asString);
        mensagem.Add('----------------------------------------------------------'+#13#10);
        Next;
      end;
      EnableControls;
    end;

    sdlgLogErro.InitialDir := ExtractFilePath(ParamStr(0));
    sdlgLogErro.FileName := 'Relatório de erros.txt';
    frmAguarde.Fecha;
    if sdlgLogErro.Execute then
    begin

      mensagem.SaveToFile(sdlgLogErro.FileName);
      if MsgSN('Relatório gerado com sucesso, deseja visualizá-lo?') then
        ShellExecute(Handle, 'open', PChar(sdlgLogErro.FileName), nil, nil, SW_SHOWMAXIMIZED);
    end;
  finally
    mensagem.Free;
    if Assigned(frmAguarde) then  
      FreeAndNil(frmAguarde);
  end;  
end;

procedure TfrmConsultaLogErro.btnLimparClick(Sender: TObject);
begin
  inherited;
  if not MsgSN('Deseja excluir o histórico de erros do sistema?') then
    Exit;
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText := 'delete from LOGERRO';
    ExecSQL;
    dsLogErro.DataSet.Close;
    dsLogErro.DataSet.Open;
  finally
    Free;
  end;
end;

procedure TfrmConsultaLogErro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    if (ActiveControl is TCustomMemo) or
            ((ActiveControl is TCustomCombo) and
             (TCustomCombo(ActiveControl).DroppedDown)) then
    begin
      Key := #0;
      Exit;
    end
    else
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
    end
    else if (ActiveControl is TDBGrid) then
    begin
      with TDBGrid(ActiveControl) do
        if SelectedIndex < (FieldCount-1) then
          SelectedIndex := SelectedIndex+1
        else
          SelectedIndex := 0;
    end;
  end; 
end;

procedure TfrmConsultaLogErro.dbgrdLogDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  //GridZebrado(dsLogErro.DataSet.RecNo, dbgrdLog, Rect, DataCol, Column, State);
end;

initialization
  RegisterClass(TfrmConsultaLogErro);
finalization
  UnRegisterClass(TfrmConsultaLogErro);
end.
