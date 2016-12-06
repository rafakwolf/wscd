unit unPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, Buttons, DBClient, DB, ActnList, DBXCommon,
  ComCtrls, Variants, SQLExpr, Funcoes, ConstPadrao, Provider, DBGrids,
  System.Actions;

type
  TfrmPadrao = class(TForm)
    actlNavigateActions: TActionList;
    actInsert: TAction;
    actPrint: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actSearch: TAction;
    actPost: TAction;
    dsPadrao: TDataSource;
    actCancelUpdates: TAction;
    actClose: TAction;
    sbStatus: TStatusBar;
    pnBotoesPadrao: TPanel;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actPrintPerson: TAction;
    actLimparFiltro: TAction;
    actOrdenar: TAction;
    actExportar: TAction;
    actContar: TAction;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnSair: TSpeedButton;
    btnPrint: TSpeedButton;
    mmPadrao: TMainMenu;
    miNavigate: TMenuItem;
    miPrimeiro: TMenuItem;
    miAnterior: TMenuItem;
    miProximo: TMenuItem;
    miUltimo: TMenuItem;
    N1: TMenuItem;
    miNovo: TMenuItem;
    miEditar: TMenuItem;
    miExcluir: TMenuItem;
    N2: TMenuItem;
    miSalvar: TMenuItem;
    miCancel: TMenuItem;
    N3: TMenuItem;
    miFechar: TMenuItem;
    miOpcoes: TMenuItem;
    miPesquisar: TMenuItem;
    N4: TMenuItem;
    miOrdenar: TMenuItem;
    miExportar: TMenuItem;
    miContar: TMenuItem;
    N8: TMenuItem;
    miLimpaFiltro: TMenuItem;
    miRelatorios: TMenuItem;
    mImprimir: TMenuItem;
    miRelPerson: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NumericoKeyPress(Sender: TObject; var Key: Char);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure actCancelUpdatesExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actPrintPersonExecute(Sender: TObject);
    procedure actLimparFiltroExecute(Sender: TObject);
    procedure actContarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOrdenarExecute(Sender: TObject);
  private
    Closing: Boolean;
    Cds: TClientDataSet;
    Qry: TDataSet;
    ComponentFocusWhenPost: TWinControl;

    FTransacao: TDBXTransaction;

    function GetQuery(CDS: TClientDataSet): TDataSet;
    procedure SetDataSets;
    function TabelaNaoExiste(Tabela: string): Boolean;
    procedure AjustaStatusBar;
    procedure WMMove(var Msg: TWMMove); message WM_MOVE;
  protected
    EditModes: Boolean;
    aCaption, TableName, FieldNames, DisplayLabels, ComandoSQLPadrao: string;

    procedure MyHandleReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind; var Action:
        TReconcileAction);

    function Pesquisa(pCaption: string; pCDS: TClientDataSet;
      pFieldNames, pDisplayLabels, pTableName: string): Boolean;

    procedure AntesSalvar; virtual;
    procedure DepoisSalvar; virtual;

    procedure AfterShow(var Msg: TMessage); message WM_AFTER_SHOW;    
  public  
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses unModeloConsulta, unGeraRelatorio,
     FuncoesWin, unOrdenarDados, VarGlobal;

{$R *.DFM}

procedure TfrmPadrao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  try
    Closing := True;
    CanClose := True;

    SelectNext(ActiveControl, True, False);

    if Assigned(dsPadrao.DataSet) and  (dsPadrao.DataSet is TClientDataSet) then
    begin
      if ((TClientDataSet(dsPadrao.DataSet).ChangeCount <> 0) or (TClientDataSet(dsPadrao.DataSet).Modified)) then
        case
          Application.MessageBox(PChar('Existem alterações pendentes no processo "'
          +
          Caption + '".' + #13#10 + 'Deseja gravar as alterações?'),
            'Confirmação',
          MB_YESNOCANCEL or MB_ICONQUESTION) of

          Id_Yes: actPost.Execute;
          Id_No: actCancelUpdates.Execute;
          Id_Cancel: CanClose := False;
        end;
    end;
  finally
    Closing := False;
  end;
end;

procedure TfrmPadrao.MyHandleReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
const
  CRLF = #13#10;
var
  S: string;
begin
  Action := raAbort;

  if Pos('PRIMARY OR UNIQUE KEY', AnsiUpperCase(E.Message)) <> 0 then
    S := 'Já existe um registro no banco de dados com este mesmo identificador.'
  else
  if Pos('VIOLATION OF FOREIGN KEY', AnsiUpperCase(E.Message)) <> 0 then
    if UpdateKind = ukDelete then
      S := 'O registro que você está tentando excluir já está sendo utilizado em outras partes do sistema.'
    else
      S := 'O registro que você está tentando gravar depende de uma informação que foi excluída.'
        + CRLF +
        'Verifique o preenchimento dos campos com pesquisa e tente novamente.'
  else
  begin
    S := E.Message + CRLF;
    S := S + CRLF + CRLF + 'DataSet: ' + DataSet.Owner.Name + CRLF;

    case UpdateKind of
      ukModify: S := S + 'Operação: Alteração' + CRLF;
      ukInsert: S := S + 'Operação: Inserção' + CRLF;
      ukDelete: S := S + 'Operação: Exclusão' + CRLF;
    end;

    raise EDatabaseError.Create(S);
  end;

  Application.MessageBox(PChar(S), 'Exclusão não permitida', MB_OK or
    MB_ICONWARNING);
  Action := raCancel;
end;

procedure TfrmPadrao.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
var
  x: Integer;
begin
  SetDataSets;
  Closing := False;

  for x := 0 to ComponentCount - 1 do
  begin
    if Components[x] is TCustomSQLDataSet then
    begin
      if not Assigned(TCustomSQLDataSet(Components[x]).SQLConnection) then
        TCustomSQLDataSet(Components[x]).SQLConnection := GetConnection;
    end
    else
    if (Components[x] is TClientDataSet) then
    begin
      if not Assigned(TClientDataSet(Components[x]).OnReconcileError) then
        TClientDataSet(Components[x]).OnReconcileError :=  MyHandleReconcileError;

      TClientDataSet(Components[x]).FetchOnDemand := True;

      if TClientDataSet(Components[x]).Tag <> TAG_IGNORE_FECHPARAMS then
        TClientDataSet(Components[x]).PacketRecords := 1;
    end
    else
    if (Components[x] is TDataSetProvider) then
    begin
      TDataSetProvider(Components[x]).Options := [poAllowCommandText];
    end;
  end;

  ReordenaBotoes([btnPrimeiro, btnAnterior, btnProximo, btnUltimo, btnNovo,
    btnAlterar, btnExcluir, btnSalvar, btnCancelar, btnConsultar, btnPrint,
      btnSair]);

  dsPadrao.AutoEdit := False;
  dsPadrao.DataSet.Open;
  ComandoSQLPadrao := AnsiUpperCase(TSQLDataSet(Qry).CommandText);
  TableName := GetTableNameFromSQLText(ComandoSQLPadrao);
  CentralizaForm(Self);
  AjustaStatusBar;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(dsPadrao.DataSet) then
    dsPadrao.DataSet.Close;
  Action := caFree;
end;

procedure TfrmPadrao.NumericoKeyPress(Sender: TObject; var Key: Char);
begin
  ControlarTeclas(Key);
end;

procedure TfrmPadrao.actAnteriorExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Prior;
end;

procedure TfrmPadrao.actProximoExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Next;
end;

procedure TfrmPadrao.actUltimoExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Last;
end;

procedure TfrmPadrao.actInsertExecute(Sender: TObject);
begin
  try
    Cds.DisableControls;
    with Cds do
    begin
      Close;
      CommandText := ComandoSQLPadrao;
      Open;
    end;
  finally
    Cds.EnableControls;
  end;
  dsPadrao.DataSet.Append;
end;

procedure TfrmPadrao.actEditExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Edit;
end;

procedure TfrmPadrao.actDeleteExecute(Sender: TObject);
begin
  if not dsPadrao.DataSet.IsEmpty then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Exclusão de registro', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) =  IDYES then
    begin
      FTransacao := GetConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dsPadrao.DataSet.Delete;

        if (dsPadrao.DataSet is TClientDataSet) then
          TClientDataSet(dsPadrao.DataSet).ApplyUpdates(0);

        dsPadrao.OnStateChange(dsPadrao);
        GetConnection.CommitFreeAndNil(FTransacao);
      except
        on e: Exception do
          GetConnection.RollbackFreeAndNil(FTransacao);
      end;
    end;
  end;
end;

procedure TfrmPadrao.dsPadraoStateChange(Sender: TObject);
begin
  EditModes := dsPadrao.DataSet.State in [dsEdit, dsInsert];

  actPrimeiro.Enabled := not EditModes;
  actAnterior.Enabled := not EditModes;
  actProximo.Enabled := not EditModes;
  actUltimo.Enabled := not EditModes;
  actInsert.Enabled := not EditModes;
  actEdit.Enabled := not EditModes;
  actDelete.Enabled := not EditModes;
  actPost.Enabled := EditModes;
  actCancelUpdates.Enabled := EditModes;
  actSearch.Enabled := not EditModes;
  actPrint.Enabled := not EditModes;
  actClose.Enabled := not EditModes;

  if (dsPadrao.DataSet.State in [dsInsert]) then
    sbStatus.Panels[0].Text := ' Inserindo registro...'
  else
  if (dsPadrao.DataSet.State in [dsEdit]) then
    sbStatus.Panels[0].Text := ' Alterando registro...'
  else
  if (dsPadrao.DataSet.State in [dsBrowse]) then
    sbStatus.Panels[0].Text := ' Visualizando registro...'
  else
  if (dsPadrao.DataSet.IsEmpty) then
    sbStatus.Panels[0].Text := ' Nenhum item cadastrado...';
end;

procedure TfrmPadrao.actCancelUpdatesExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Cancel;
  if (dsPadrao.DataSet is TClientDataSet) then
    TClientDataSet(dsPadrao.DataSet).CancelUpdates;
end;

procedure TfrmPadrao.actPostExecute(Sender: TObject);
var
  Novo: Boolean;
begin
  AntesSalvar;

  Novo := (dsPadrao.State = dsInsert);

  FTransacao := GetConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    if dsPadrao.DataSet.State in [dsInsert, dsEdit] then
    begin
      dsPadrao.DataSet.Post;
      if (dsPadrao.DataSet is TClientDataSet) then
      begin
        if (TClientDataSet(dsPadrao.DataSet).ApplyUpdates(0) = 0) and Novo then
        begin
          dsPadrao.DataSet.DisableControls;
          dsPadrao.DataSet.Close;
          dsPadrao.DataSet.Open;

          if not dsPadrao.DataSet.IsEmpty then
            dsPadrao.DataSet.Last;

          dsPadrao.DataSet.EnableControls;
        end;
      end;
      GetConnection.CommitFreeAndNil(FTransacao);
    end;
  except
    on e: Exception do
     GetConnection.RollbackFreeAndNil(FTransacao);
  end;

  DepoisSalvar;
end;

procedure TfrmPadrao.actSearchExecute(Sender: TObject);
begin
  if ((TableName = '') or
    (TabelaNaoExiste(TableName)) or
    (aCaption = '') or
    (FieldNames = '') or
    (DisplayLabels = '') or
    (ComandoSQLPadrao = '')) then
    raise
      Exception.Create('Erro ao executar pesquisa, verifique os parâmetros.');
      
  Pesquisa('Pesquisa ' + Caption, Cds, FieldNames, DisplayLabels, TableName);
end;

procedure TfrmPadrao.actPrintPersonExecute(Sender: TObject);
begin
  if ((TableName = '') or (TabelanaoExiste(TableName)) or  (aCaption = '')) then
    raise
      Exception.Create('Erro ao executar o relatório padrão, verifique os parâmetros.');
  if TfrmGeraRelatorio.Execute(aCaption, TableName, GetConnection) then
  begin
  end;
end;

procedure TfrmPadrao.AntesSalvar;
begin
  ComponentFocusWhenPost := ActiveControl;
  SelectNext(ActiveControl, True, False);

  if not VerificaFields(dsPadrao) then
    Abort;
end;

procedure TfrmPadrao.DepoisSalvar;
begin
  SetFocusIfCan(ComponentFocusWhenPost);
end;

procedure TfrmPadrao.actLimparFiltroExecute(Sender: TObject);
begin
  try
    Cds.DisableControls;
    Cds.Close;
    Cds.CommandText := ComandoSQLPadrao;

    if Cds.Filtered then
      Cds.Filtered := False;

    Cds.Open;
  finally
    Cds.EnableControls;
  end;
end;

function TfrmPadrao.GetQuery(CDS: TClientDataSet): TDataSet;
begin
  try
    Result :=
      TDataSet(TDataSetProvider(TComponent(CDS.Owner).FindComponent(CDS.ProviderName)).DataSet);
  except
    raise Exception.Create(CDS.Name +
      '.ProviderName not assigned or Provider.DataSet not assigned');
  end;
end;

procedure TfrmPadrao.SetDataSets;
begin
  if Assigned(dsPadrao.DataSet) then
  begin
    Qry := GetQuery(TClientDataSet(dsPadrao.DataSet));
    Cds := TClientDataSet(dsPadrao.DataSet);
  end
  else
    raise Exception.Create('dsPadrao.DataSet not assigned.');
end;

procedure TfrmPadrao.actContarExecute(Sender: TObject);
begin
  Ed_Quantificar(TClientDataSet(dsPadrao.DataSet), Self);
end;

function TfrmPadrao.Pesquisa(pCaption: string; pCDS: TClientDataSet;
  pFieldNames, pDisplayLabels, pTableName: string): Boolean;
begin
  Result := False;
  actLimparFiltro.Execute;
  try
    Result := TfrmModeloConsulta.Execute(pCaption, pCDS, pFieldNames,
      pDisplayLabels);
  finally
    if not Result then
      actLimparFiltro.Execute;
  end;
end;

procedure TfrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl is TCustomMemo) or ((ActiveControl is TCustomCombo) and (TCustomCombo(ActiveControl).DroppedDown)) then
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
    else
    if (ActiveControl is TDBGrid) then
    begin
      with TDBGrid(ActiveControl) do
        if SelectedIndex < (FieldCount - 1) then
          SelectedIndex := SelectedIndex + 1
        else
          SelectedIndex := 0;
    end;
  end;
end;

procedure TfrmPadrao.actPrimeiroExecute(Sender: TObject);
begin
  dsPadrao.DataSet.First;
end;

function TfrmPadrao.TabelaNaoExiste(Tabela: string): Boolean;
var List: TStrings;
begin
  List := TStringList.Create;
  try
    GetConnection.GetTableNames(List);

    Result := List.IndexOf(Trim(AnsiUpperCase(Tabela))) < 0;
  finally
    FreeAndNil(List);
  end;
end;

procedure TfrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 3,'');
end;

procedure TfrmPadrao.AjustaStatusBar;
var
  Size: Integer;
begin
  Size := (ClientWidth div 2);
  sbStatus.Panels[0].Width := Size;
  sbStatus.Panels[1].Width := Size;
  sbStatus.Update;
end;

procedure TfrmPadrao.FormResize(Sender: TObject);
begin
  AjustaStatusBar;
end;

procedure TfrmPadrao.AfterShow(var Msg: TMessage);

  procedure ConfigMsgEmptyTable;
  begin
    WriteIniFile('Cadastros', 'Msg Cadastro Vazio', '0');
  end;

begin
  if ReadIniFile('Cadastros', 'Msg Cadastro Vazio') <> '0' then
  begin
    if dsPadrao.DataSet.IsEmpty then
    begin
      if MessageDlgCheck('Não existe nenhum registro cadastrado nesta tela.' +
        #13 + 'Deseja cadastrar agora?', mtConfirmation, [mbYes, mbNo], -1, mrOk,
          True, True, 'Não exibir novamente esta mensagem.', @ConfigMsgEmptyTable) = ID_YES then
        actInsert.Execute;
    end;
  end;
end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_AFTER_SHOW, 0, 0);
  PostMessageAllForms(WM_NOTIFY_OPEN_FORM, Application.MainForm);
end;

procedure TfrmPadrao.WMMove(var Msg: TWMMove);
begin
  if Left < 0 then
    Left := 0;
  if Top < 0 then
    Top := 0;
  if Screen.Width - (Left + Width) < 0 then
    Left := Screen.Width - Width;
  if Screen.Height - (Top + Height) < 0 then
    Top := Screen.Height - Height;
end;

procedure TfrmPadrao.actOrdenarExecute(Sender: TObject);
var
  SQLRetorno: string;
begin
  try
    if TfrmOrdenarDados.Execute(ComandoSQLPadrao, SQLRetorno) then
    begin
      dsPadrao.DataSet.DisableControls;
      dsPadrao.DataSet.Close;
      TClientDataSet(dspadrao.DataSet).CommandText := SQLRetorno;
      dsPadrao.DataSet.Open;
      dsPadrao.DataSet.EnableControls;
    end;
  except
    on e: Exception do
      raise Exception.Create('Erro ordenando dados: ' + e.Message);
  end;
end;

end.
