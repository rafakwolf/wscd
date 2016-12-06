unit unVisualizarDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DBClient,
  PLClientDataSet, Provider, PLDataSetProvider, DB, SqlExpr, PLSQLDataSet,
  Buttons, FMTBcd;

type
  TfrmVisualizarDados = class(TForm)
    dbgrdDados: TDBGrid;
    pnlTop: TPanel;
    sqldTabelas: TPLSQLDataSet;
    dspTabelas: TPLDataSetProvider;
    cdsTabelas: TPLClientDataSet;
    sqldTabelasTABELA: TStringField;
    cdsTabelasTABELA: TStringField;
    dsTabelas: TDataSource;
    sqldDados: TPLSQLDataSet;
    dspDados: TPLDataSetProvider;
    cdsDados: TPLClientDataSet;
    dsDados: TDataSource;
    btnExecuteSQL: TBitBtn;
    cbbTabela: TComboBox;
    lblTabela: TLabel;
    sqldUpdate: TPLSQLDataSet;
    sqldFilter: TPLSQLDataSet;
    sqldFilterCAMPO: TStringField;
    sqldFilterTIPO: TStringField;
    sqldFilterVALOR: TStringField;
    dspFilter: TPLDataSetProvider;
    cdsFilter: TPLClientDataSet;
    dsFilter: TDataSource;
    cdsFilterCAMPO: TStringField;
    cdsFilterTIPO: TStringField;
    cdsFilterVALOR: TStringField;
    ckFilter: TCheckBox;
    dbgrdFilter: TDBGrid;
    pnlBotoesPadrao: TPanel;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnSair: TSpeedButton;
    btnPrint: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExecuteSQLClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbTabelaChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cdsDadosAfterEdit(DataSet: TDataSet);
    procedure cdsDadosAfterInsert(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure cdsDadosAfterOpen(DataSet: TDataSet);
    procedure cdsFilterAfterPost(DataSet: TDataSet);
    procedure ckFilterClick(Sender: TObject);
    procedure cdsDadosBeforeOpen(DataSet: TDataSet);
    procedure cdsDadosAfterDelete(DataSet: TDataSet);
    procedure btnPrintClick(Sender: TObject);
    procedure dbgrdDadosTitleClick(Column: TColumn);
  private
    procedure CarregaTabelas;
    procedure HabilitaBotoes(e: Boolean);

    procedure RefreshTable;
    procedure SetCaption(aCaption: string);

    procedure UpdateSQL(SQL: string);
    procedure Select(SQL: string);

    procedure OpenFilter;
    procedure FilterCDSDados;

    function SetValueFilter(const Tipo : String; const Value : String): string;

    procedure Error(e: Exception);

    procedure ConfigGrid;
  public
  end;

var
  frmVisualizarDados: TfrmVisualizarDados;

implementation

uses unCommandoSQL, Funcoes, unGeraRelatorio;

{$R *.dfm}

function TfrmVisualizarDados.SetValueFilter(const Tipo : String; const Value : String): string;
begin
  if Tipo = 'Igual' then
  begin
    Result := ' = '+QuotedStr(Value);
  end
  else if Tipo = 'Maior que' then
  begin
    Result := ' > '+QuotedStr(Value);
  end
  else if Tipo = 'Menor que' then
  begin
    Result := ' < '+QuotedStr(Value);
  end
  else if Tipo = 'Diferente' then
  begin
    Result := ' <> '+QuotedStr(Value);
  end
  else if Tipo = 'Contendo' then
  begin
    Result := ' like '+QuotedStr('*'+Value+'*');
  end
  else if Tipo = 'Terminando com' then
  begin
    Result := ' = '+QuotedStr('*'+Value);
  end
  else if Tipo = 'Começando com' then
  begin
    Result := ' = '+QuotedStr(Value+'*');
  end;
end;

procedure TfrmVisualizarDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmVisualizarDados.FormCreate(Sender: TObject);
begin
  CarregaTabelas;
  Constraints.MinHeight := 550;
  Constraints.MinWidth  := 870;
end;

procedure TfrmVisualizarDados.CarregaTabelas;
begin
  with cdsTabelas do
  try
    Open;
    First;
    while not Eof do
    begin
      cbbTabela.Items.Add(FieldByName('TABELA').AsString);
      Next;
    end;
  finally
    Close;
  end;
end;

procedure TfrmVisualizarDados.btnExecuteSQLClick(Sender: TObject);
var
  SQL : String;
begin
  if not TfrmCommandoSQL.Execute(SQL) then
    Exit;

    if Trim(SQL) <> '' then
    begin
      try
        if (Pos('SELECT',AnsiUpperCase(SQL)) > 0) then
          Select(SQL)
        else
        begin
          UpdateSQL(SQL);

          btnAlterar.Enabled  := False;
          btnExcluir.Enabled  := False;
          btnNovo.Enabled     := False;
          dbgrdDados.ReadOnly := True;
        end;
      finally
        CriaTxt(DiretorioSistema+'SQL.txt', SQL);
        SetCaption(GetTableNameFromSQLText(SQL));
      end;
  end;
end;

procedure TfrmVisualizarDados.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVisualizarDados.btnNovoClick(Sender: TObject);
begin
  if not cdsDados.Active then
    Exit;

  if not (cdsDados.State in dsEditModes) then
    cdsDados.Append;
    
  HabilitaBotoes(True);
end;

procedure TfrmVisualizarDados.HabilitaBotoes(e: Boolean);
begin
   if cdsDados.Active then
   begin
     btnNovo.Enabled      := not e;
     btnAlterar.Enabled   := not e;
     btnExcluir.Enabled   := not e;
     btnSalvar.Enabled    := e;
     btnCancelar.Enabled  := e;
     btnConsultar.Enabled := not e;
     btnPrint.Enabled     := not e;
   end
   else
   begin
     btnNovo.Enabled      := False;
     btnAlterar.Enabled   := False;
     btnExcluir.Enabled   := False;
     btnSalvar.Enabled    := False;
     btnCancelar.Enabled  := False;
     btnConsultar.Enabled := False;
     btnPrint.Enabled     := False;
   end;
end;

procedure TfrmVisualizarDados.btnAlterarClick(Sender: TObject);
begin
  cdsDados.Edit;
  HabilitaBotoes(True);
end;

procedure TfrmVisualizarDados.btnExcluirClick(Sender: TObject);
begin
  if cdsDados.IsEmpty then
    Exit;

  try
    if Application.MessageBox('Deseja realmente excluir este registro?', 'Confirme',
      MB_YESNO or MB_ICONINFORMATION) = ID_YES then
    begin
      with TSQLQuery.Create(nil) do
      begin
        try
          SQLConnection := sqldDados.SQLConnection;
          SQL.Clear;
          SQL.Add('delete from '+Trim(cbbTabela.Text));
          SQL.Add('where '+cdsDados.Fields[0].FieldName+' = :id');

          ParamByName('id').Value := cdsDados.Fields[0].Value;
          ExecSQL;

          RefreshTable;
        finally
          Free;
        end;
      end;
    end;
  except
    on e: Exception do
      raise Exception.Create('Houve um erro ao tentar excluir este registro.'+#13+e.Message);
  end;

  HabilitaBotoes(False);
end;

procedure TfrmVisualizarDados.RefreshTable;
begin
  if (Trim(cbbTabela.Text) = '') then
  begin
    cbbTabela.SetFocus;
    Exit;
  end;

  SetCaption(Trim(cbbTabela.Text));
  
  with cdsDados do
  begin
    Close;
    sqldDados.CommandText := '';
    sqldDados.CommandText := 'SELECT * FROM ' + Trim(cbbTabela.Text);
    Open;
  end;
end;

procedure TfrmVisualizarDados.SetCaption(aCaption: string);
begin
  Caption := 'Visualizar Dados - Tabela: ' + aCaption;
end;

procedure TfrmVisualizarDados.Select(SQL: string);
begin
  if cdsDados.State in dsEditModes then
    btnSalvar.Click;
  try
    if (SQL <> '') then
    begin
      with cdsDados do
      begin
        Close;
        sqldDados.CommandText := '';
        sqldDados.CommandText := Trim(SQL);
        Open;
      end;
    end;
  except
    on e: Exception do
    begin
      MsgErro('Erro ao executar o texto SQL.'+#13+
        'Mensagem original: '+e.Message,'Erro');
    end;
  end;
end;

procedure TfrmVisualizarDados.UpdateSQL(SQL: string);
begin
  if cdsDados.State in dsEditModes then
    btnSalvar.Click;
  try
    if Pos('select', AnsiLowerCase(SQL)) > 0 then
      Exit;
    if (SQL <> '') then
    begin
      with sqldUpdate do
      begin
        Close;
        CommandText := '';
        CommandText := Trim(SQL);
        ExecSQL;
        if cdsDados.Active then
          cdsDados.Refresh;
      end;
    end;
  except
    on e: Exception do
    begin
      MsgErro('Erro ao executar o texto SQL.'+#13+
        'Mensagem original: '+e.Message,'Erro');
    end;
  end;

  if sqldDados.CommandText <> '' then
  begin
    cdsDados.Close;
    cdsDados.Open;
  end;
end;

procedure TfrmVisualizarDados.FormShow(Sender: TObject);
begin
  HabilitaBotoes(False);
end;

procedure TfrmVisualizarDados.cbbTabelaChange(Sender: TObject);
begin
  RefreshTable;
  HabilitaBotoes(False);
  dbgrdDados.ReadOnly := False;
end;

procedure TfrmVisualizarDados.btnSalvarClick(Sender: TObject);
begin
  try
    if cdsDados.State in [dsEdit, dsInsert] then
    begin
      cdsDados.Post;
      cdsDados.ApplyUpdates(0);
    end;
  except
    on e: Exception do
      raise Exception.Create('Houve um erro ao tentar salvar estes registros.'+#13+e.Message);
  end;
  
  HabilitaBotoes(False);
end;

procedure TfrmVisualizarDados.cdsDadosAfterEdit(DataSet: TDataSet);
begin
  HabilitaBotoes(True);
end;

procedure TfrmVisualizarDados.cdsDadosAfterInsert(DataSet: TDataSet);
var
  Tabela: string;
begin
  Tabela := Trim(cbbTabela.Text);
  
  if (Tabela <> '') then
    Incrementa(Tabela,cdsDados.Fields[0],sqldDados.SQLConnection);
end;

procedure TfrmVisualizarDados.btnCancelarClick(Sender: TObject);
begin
  cdsDados.CancelUpdates;
  HabilitaBotoes(False);
end;

procedure TfrmVisualizarDados.OpenFilter;
var
  i : Integer;
begin
  if not cdsFilter.Active then
    cdsFilter.Open;

  cdsFilter.EmptyDataSet;

  for i := (cdsDados.Fields.Count - 1) downto 0 do
  begin
    cdsFilter.Insert;
    cdsFilterCAMPO.AsString := cdsDados.Fields.Fields[i].FieldName;
    cdsFilterTIPO.AsString := 'Igual';
    cdsFilter.Post;
  end;
end;

procedure TfrmVisualizarDados.btnConsultarClick(Sender: TObject);
begin
  dbgrdFilter.Visible := not dbgrdFilter.Visible;

  if dbgrdFilter.Visible then
    OpenFilter;
    
  ckFilter.Visible := True;
end;

procedure TfrmVisualizarDados.cdsDadosAfterOpen(DataSet: TDataSet);
begin
  HabilitaBotoes(False);

  if dbgrdFilter.Visible then
    OpenFilter;

  ckFilter.Checked := False;
  ckFilter.Visible := dbgrdFilter.Visible;

  ConfigGrid;
end;

procedure TfrmVisualizarDados.FilterCDSDados;
var
  book : TBookmark;
begin
  book := cdsFilter.GetBookmark;
  cdsFilter.DisableControls;

  cdsDados.Filtered := False;
  cdsDados.Filter := '';

  cdsFilter.First;

  while not cdsFilter.Eof do
  begin
    if Trim(cdsFilterVALOR.AsString) <> '' then
    begin
      if cdsDados.Filter = '' then
      begin
        cdsDados.Filter := cdsFilterCAMPO.AsString+SetValueFilter(cdsFilterTIPO.AsString,cdsFilterVALOR.AsString);
      end
      else
      begin
        cdsDados.Filter := cdsDados.Filter+' and '+cdsFilterCAMPO.AsString+
          SetValueFilter(cdsFilterTIPO.AsString,cdsFilterVALOR.AsString);
      end;
    end;

    cdsFilter.Next;
  end;

  cdsFilter.GotoBookmark(book);
  cdsFilter.FreeBookmark(book);
  cdsFilter.EnableControls;

  if cdsDados.Filter <> '' then
  begin
    try
      cdsDados.Filtered := True;
    except
      on e : Exception do
        Error(e);
    end;
  end;
end;

procedure TfrmVisualizarDados.Error(e: Exception);
var
  msg : string;
begin
  if Pos('integer',LowerCase(e.Message)) > 0 then
  begin
    msg := 'INTEIRO';
  end
  else
  if Pos('data',LowerCase(e.Message)) > 0 then
  begin
    msg := 'DATA';
  end
  else
    msg := 'INVÁLIDO';

  msg := 'Houve um erro ao tentar filtar os resultados. O tipo do campo é '+msg+
    ' e não pode ser utilizado o valor informado.'+#13+'Verifique o valor e o tipo escolhido para o filtro'+
    #13#13+'Mensagem original:'+#13+e.Message;

  MsgErro(msg);
end;

procedure TfrmVisualizarDados.cdsFilterAfterPost(DataSet: TDataSet);
begin
  FilterCDSDados;
  try
    ckFilter.Checked := cdsDados.Filtered;
  except
    on e : Exception do
      Error(e);
  end;
end;

procedure TfrmVisualizarDados.ckFilterClick(Sender: TObject);
begin
  if ckFilter.Checked then
    FilterCdsDados;
  try
    cdsDados.Filtered := ckFilter.Checked;
  except
    on e : Exception do
      Error(e);
  end;
end;

procedure TfrmVisualizarDados.cdsDadosBeforeOpen(DataSet: TDataSet);
begin
  cdsDados.Filtered := False;
end;

procedure TfrmVisualizarDados.cdsDadosAfterDelete(DataSet: TDataSet);
begin
  DataSet.Edit;
end;

procedure TfrmVisualizarDados.ConfigGrid;
var
  i: Integer;
begin
  for i := 0 to dbgrdDados.Columns.Count -1 do
    if dbgrdDados.Columns[i].Width > 300 then
      dbgrdDados.Columns[i].Width := 300;
end;

procedure TfrmVisualizarDados.btnPrintClick(Sender: TObject);
begin
  TfrmGeraRelatorio.Execute(Caption,cbbTabela.Items[cbbTabela.ItemIndex],sqldDados.SQLConnection);
end;

procedure TfrmVisualizarDados.dbgrdDadosTitleClick(Column: TColumn);
begin
  if cdsDados.Active then
    OrdenaColunasGrid(dbgrdDados,Column,cdsDados);
end;

initialization
  RegisterClass(TfrmVisualizarDados);
finalization
  UnRegisterClass(TfrmVisualizarDados);
end.
