unit unCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, Buttons, DBClient, Provider, SqlExpr,
  Menus, ComCtrls, ConstPadrao, DBXCommon, FMTBcd, unSimplePadrao;

const
  SQLPadrao90Dias: string = 'select '+
                            'cx.CODCAIXA, '+
                            'cx.CODCAIXAS, '+
                            'cxs.NOME, '+
                            'cx.DATA, '+
                            'cx.DESCRICAO, '+
                            'cx.DOCUMENTO, '+
                            'cx.TIPO, '+
                            'cx.VALOR, '+
                            'cx.EXCLUIR '+
                            'from CAIXA cx '+
                            'left join CAIXAS cxs on (cx.CODCAIXAS = cxs.CODIGO) '+
                            'where (cx.DATA >= (CURRENT_DATE - 90)) '+
                            'order by cx.DATA';

  SQLPadraoTodos: string = 'select '+
                           'cx.CODCAIXA, '+
                           'cx.CODCAIXAS, '+
                           'cxs.NOME, '+
                           'cx.DATA, '+
                           'cx.DESCRICAO, '+
                           'cx.DOCUMENTO, '+
                           'cx.TIPO, '+
                           'cx.VALOR, '+
                           'cx.EXCLUIR '+
                           'from CAIXA cx '+
                           'left join CAIXAS cxs on (cx.CODCAIXAS = cxs.CODIGO) '+
                           'order by cx.DATA';

type
  TfrmCaixa = class(TfrmSimplePadrao)
    dsCaixa: TDataSource;
    sqldCredDeb: TSQLDataSet;
    mnCaixa: TMainMenu;
    miRegistro: TMenuItem;
    miNovo: TMenuItem;
    miAlterar: TMenuItem;
    miFerramenta: TMenuItem;
    miExcluirPeriodo: TMenuItem;
    miPesquisar: TMenuItem;
    miFiltraData: TMenuItem;
    miFiltraCredito: TMenuItem;
    N1: TMenuItem;
    miSair: TMenuItem;
    N3: TMenuItem;
    miFiltraDebito: TMenuItem;
    miLimpaFiltro: TMenuItem;
    dbgdCaixa: TDBGrid;
    miFiltraPorContaCaixa: TMenuItem;
    miCadContaCaixa: TMenuItem;
    miContarReg: TMenuItem;
    miExcluir: TMenuItem;
    miRelatorio: TMenuItem;
    miRelTodos: TMenuItem;
    miRelMesAno: TMenuItem;
    miRelContaCaixa: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    miRelFluxoCaixa: TMenuItem;
    PopupConsulta: TPopupMenu;
    miLocalizaColuna: TMenuItem;
    N6: TMenuItem;
    miExportaDados: TMenuItem;
    miFiltraColuna: TMenuItem;
    dsCaixas: TDataSource;
    N7: TMenuItem;
    pnBotoes: TPanel;
    btnNovo: TSpeedButton;
    btnLocate: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnFiltrar: TSpeedButton;
    btnFechar: TSpeedButton;
    N8: TMenuItem;
    miRelPersonalCaixa: TMenuItem;
    miExcluirVarios: TMenuItem;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldCaixas: TSQLDataSet;
    dspCaixas: TDataSetProvider;
    cdsCaixas: TClientDataSet;
    cdsCaixasCODIGO: TIntegerField;
    cdsCaixasNOME: TStringField;
    cdsCaixasINATIVO: TStringField;
    sqldPadraoCODCAIXA: TIntegerField;
    sqldPadraoCODCAIXAS: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoEXCLUIR: TStringField;
    cdsPadraoCODCAIXA: TIntegerField;
    cdsPadraoCODCAIXAS: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoEXCLUIR: TStringField;
    miDeleteItem: TMenuItem;
    stbCaixa: TStatusBar;
    miMovimentoHoje: TMenuItem;
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    sqldCredDebCRED_DEB: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgdCaixaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miExcluirPeriodoClick(Sender: TObject);
    procedure miFiltraDataClick(Sender: TObject);
    procedure miFiltraCreditoClick(Sender: TObject);
    procedure miFiltraDebitoClick(Sender: TObject);
    procedure miLimpaFiltroClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure miCadContaCaixaClick(Sender: TObject);
    procedure miFiltraPorContaCaixaClick(Sender: TObject);
    procedure miContarRegClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure miRelFluxoCaixaClick(Sender: TObject);
    procedure miExportaDadosClick(Sender: TObject);
    procedure miRelTodosClick(Sender: TObject);
    procedure miRelMesAnoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miRelPersonalCaixaClick(Sender: TObject);
    procedure miRelContaCaixaClick(Sender: TObject);
    procedure miExcluirVariosClick(Sender: TObject);
    procedure cdsPadraoTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLocateClick(Sender: TObject);
    procedure dsCaixaStateChange(Sender: TObject);
    procedure cdsPadraoAfterOpen(DataSet: TDataSet);
    procedure miMovimentoHojeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dspPadraoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: WideString);
  private
    SQLPadraoTela: string;
    procedure SetCaixaDefault;
  protected
    procedure CaixaInserido(var Msg: TMessage); message WM_CAIXA_INSERIDO;
    procedure ExclusaoCaixa(var Msg: TMessage); message WM_EXCLUSAO_CAIXA;
  public
     procedure Totais_Caixa;
     procedure Totais_Rel(DataIni: string = ''; DataFim: string = '');
  end;

var
  frmCaixa: TfrmCaixa;
  TotalCredito, TotalDebito: Currency;

implementation

uses  unLancCaixa, Funcoes, unFiltroSimples, unModeloConsulta,
     VarGlobal, unGeraRelatorio, unPrevCaixaTodos,  uConfiguraRelatorio,
     unAguarde;

{$R *.dfm}

procedure TfrmCaixa.Totais_Caixa;
begin

  { debitos }
  sqldCredDeb.Close;
  sqldCredDeb.CommandText := 'select'+
                             ' sum(VALOR) as CRED_DEB '+
                             'from CAIXA '+
                             'where (TIPO = :PTIPO)';
  sqldCredDeb.ParamByName('PTIPO').AsString := 'D';
  sqldCredDeb.Open;
  TotalDebito := sqldCredDebCRED_DEB.AsFloat;

  { creditos }
  sqldCredDeb.Close;
  sqldCredDeb.CommandText := 'select'+
                             ' sum(VALOR) as CRED_DEB '+
                             'from CAIXA '+
                             'where (TIPO = :PTIPO)';
  sqldCredDeb.ParamByName('PTIPO').AsString := 'C';
  sqldCredDeb.Open;
  TotalCredito := sqldCredDebCRED_DEB.AsFloat;

end;

procedure TfrmCaixa.btnExcluirClick(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then Exit;
  if MsgSN('Confirma exclusão do lançamento?') then
  begin
    with TSQLDataSet.Create(Self) do
    try
      Close;
      //SQLConnection := GetConnection;
      CommandType := ctStoredProc;
      CommandText := 'STPDELCAIXA';
      Params.ParamByName('CODIGO').AsInteger := cdsPadraoCODCAIXA.AsInteger;
      ExecSQL;
      cdsPadrao.DisableControls;
      cdsPadrao.Close;
      cdsPadrao.Open;
      cdsPadrao.Last;
      cdsPadrao.EnableControls;
    finally
      dsCaixaStateChange(dsCaixa);
      Free;
    end;
  end;
end;

procedure TfrmCaixa.dbgdCaixaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (cdsPadraoDATA.AsDateTime < Date) then
    dbgdCaixa.Canvas.Font.Color := clGrayText;

  if (gdSelected in State) then
    dbgdCaixa.Canvas.Font.Color := clWhite;

  dbgdCaixa.Canvas.FillRect(Rect);
  dbgdCaixa.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCaixa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  UpdatesPending(cdsPadrao, Self);
end;

procedure TfrmCaixa.miExcluirPeriodoClick(Sender: TObject);
var
  dtI, dtF: String;
  //cmd: TDBXCommand;
  //tx: TDBXTransaction;
  //data: TDBXValue;
begin
  try
    try
      cdsPadrao.DisableControls;

      if ObterDatas(dtI, dtF) then
      begin
        if (ClearMask(dtI) <> '') and (ClearMask(dtF) <> '') then
        begin
//          tx := sqldPadrao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
//          cmd := sqldPadrao.SQLConnection.DBXConnection.CreateCommand;
//          try
//            try
//              cmd.Text := 'delete from CAIXA '+
//                'where DATA between ? and ?';
//              cmd.Prepare;
//
//              ShowMessage('parametros '+IntToStr(cmd.Parameters.Count));
//
//              cmd.Parameters.Parameter[0].Value.SetDate(StrToDate(dtI));
//              cmd.Parameters.Parameter[1].Value.SetDate(StrToDate(dtF));
//              cmd.ExecuteQuery;
//
//              sqldPadrao.SQLConnection.CommitFreeAndNil(tx);
//            except
//              sqldPadrao.SQLConnection.RollbackFreeAndNil(tx);
//            end;
//          finally
//            cmd.Free;
//          end;
          with TSQLDataSet.Create(nil) do
          try
            SQLConnection := sqldPadrao.SQLConnection;
            CommandText := 'delete from CAIXA '+
              'where DATA between :DATAINI and :DATAFIM';
            ParamByName('DATAINI').AsDate := StrToDate(dtI);
            ParamByName('DATAFIM').AsDate := StrToDate(dtF);
            ExecSQL;
          finally
            Free;
          end;
        end
        else
          MsgErro('',UM_DATAINVALIDA);

        MsgAviso('','Exclusão concluida com sucesso.');
      end;
    except
      raise Exception.Create('Erro excluindo caixa por periodo');
    end;
  finally
    cdsPadrao.Close;
    cdsPadrao.Open;
    cdsPadrao.Last;
    cdsPadrao.EnableControls;
  end;
end;

procedure TfrmCaixa.miFiltraDataClick(Sender: TObject);
var
  DataIni, DataFim: String;
begin
  if ObterDatas(DataIni, DataFim) then
  begin
    if (ClearMask(DataIni) <> '') and (ClearMask(DataFim) <> '') then
    begin
      cdsPadrao.Close;
      cdsPadrao.Filtered := False;
      cdsPadrao.Filter :=
        'DATA >= ' + QuotedStr(DataIni) + ' AND DATA <= ' + QuotedStr(DataFim);
      cdsPadrao.Filtered := True;
      cdsPadrao.Open;

      if cdsPadrao.IsEmpty then
      begin
        MsgCuidado(UM_PESQUISAVAZIO);
        cdsPadrao.Filtered := False;
        Exit;
      end;
    end
    else
      MsgErro('',UM_DATAINVALIDA);
  end;
end;

procedure TfrmCaixa.miFiltraCreditoClick(Sender: TObject);
begin
  if MsgSN('Mostrar apenas Entradas efetuadas?') then
  begin
    cdsPadrao.Close;
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := 'TIPO = ' + QuotedStr('C');
    cdsPadrao.Filtered := True;
    cdsPadrao.Open;

    if cdsPadrao.IsEmpty then
    begin
      MsgCuidado('',UM_PESQUISAVAZIO);
      cdsPadrao.Filtered := False;
      Exit;
    end;
  end;
end;

procedure TfrmCaixa.miFiltraDebitoClick(Sender: TObject);
begin
  if MsgSN('Mostrar apenas Saídas efetuadas?') then
  begin
    cdsPadrao.Close;
    cdsPadrao.Filtered := False;
    cdsPadrao.Filter := 'TIPO = ' + QuotedStr('D');
    cdsPadrao.Filtered := True;
    cdsPadrao.Open;

    if cdsPadrao.IsEmpty then
    begin
      MsgCuidado(UM_PESQUISAVAZIO);
      cdsPadrao.Filtered := False;
      Exit;
    end;
  end;
end;

procedure TfrmCaixa.miLimpaFiltroClick(Sender: TObject);
begin
  try
    cdsPadrao.DisableControls;
    cdsPadrao.Close;
    cdsPadrao.CommandText := SQLPadraoTela;

    if cdsPadrao.Filter <> '' then
      cdsPadrao.Filter := '';
    if cdsPadrao.Filtered then
      cdsPadrao.Filtered := False;

    cdsPadrao.Open;
    cdsPadrao.Last;
  finally
    dsCaixa.OnStateChange(dsCaixa);
    cdsPadrao.EnableControls;
  end;
end;

procedure TfrmCaixa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCaixa.miCadContaCaixaClick(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCaixa', 'Contas caixa', Self);
end;

procedure TfrmCaixa.miFiltraPorContaCaixaClick(Sender: TObject);
var
  IdRetorno: Integer;
  Order, SQL: string;
begin

  SQL := SQLPadraoTela;
  Order := Copy(SQL, Pos('ORDER', SQL), Length(SQL));
  Delete(SQL, Pos('ORDER', SQL), Length(SQL));

  if TfrmFiltroSimples.Execute(IdRetorno, 'VIEWCAIXASATIVOS', 'NOME', 'CODIGO') then
  begin
    cdsPadrao.DisableControls;
    cdsPadrao.Close;

    cdsPadrao.Filtered := False;
    cdsPadrao.Filter   := 'CODCAIXAS = '+QuotedStr(IntToStr(IdRetorno));
    cdsPadrao.Filtered := True;

    cdsPadrao.Open;
    cdsPadrao.Last;
    cdsPadrao.EnableControls;
  end;
end;

procedure TfrmCaixa.miContarRegClick(Sender: TObject);
begin
  ////Ed_Quantificar(cdsPadrao, frmCaixa);
  miLimpaFiltro.Click;
end;

procedure TfrmCaixa.btnAlterarClick(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then Exit;
  frmLancCaixa := TfrmLancCaixa.Create(Self);
  frmLancCaixa.IdCaixa := cdsPadraoCODCAIXA.AsInteger;
  frmLancCaixa.ShowModal;
end;

procedure TfrmCaixa.miRelFluxoCaixaClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioFluxoCaixa', 'Relatório de caixa', Self);
end;

procedure TfrmCaixa.miExportaDadosClick(Sender: TObject);
begin
//  if TfrmExportaPadrao.MontaDados('CAIXA', 'Caixa', 'Caixa', 'Caixa')then
//  begin
//  end;
end;

procedure TfrmCaixa.miRelTodosClick(Sender: TObject);
var
  vDataIni, vDataFim: String;
begin

  if not ObterDatas(vDataIni,vDataFim) then
    Exit;

  Totais_Rel(vDataIni,vDataFim);
  with TfrmPrevCaixaTodos.Create(Self) do
  try
    if not cdsPadrao.Active then
      cdsPadrao.Open;

    cdsPadrao.Filtered := False;
    cdsPadrao.Filter   := 'DATA >= '+QuotedStr(vDataIni)+' and DATA <= '+QuotedStr(vDataFim);
    cdsPadrao.Filtered := True;

    //lbCreditos.Caption := 'Créditos R$: ' + FormatFloat('#,##0.00', TotalCredito);
    //lbDebitos.Caption  := 'Débitos R$: ' + FormatFloat('#,##0.00', TotalDebito);
    //lbSaldo.Caption    := 'Saldo R$: ' + FormatFloat('#,##0.00', (TotalCredito - TotalDebito));

    //lbSaldo.Visible := Configuracao.MostrarSaldoCaixa;
    //Titulo  := 'Livro caixa entre '+vDataIni+' e '+vDataFim;
    //DataIni := vDataIni;
    //DataFim := vDataFim;

    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCaixa.miRelMesAnoClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioCaixaMensal', 'Caixa por mês e ano', Self);
end;

procedure TfrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 56,'');
end;

procedure TfrmCaixa.btnFiltrarClick(Sender: TObject);
begin
  if not TfrmModeloConsulta.Execute('Consulta Caixa', cdsPadrao, FN_CAIXA, DL_CAIXA) then
  begin
    cdsPadrao.Close;
    cdsPadrao.CommandText := SQLPadraoTela;
    cdsPadrao.Open;
    cdsPadrao.Last;
  end;
end;

procedure TfrmCaixa.Totais_Rel(DataIni: string = ''; DataFim: string = '');
begin

  if (DataIni <> '') and (DataFim <> '') then
  begin

    { debitos }
    sqldCredDeb.Close;
    sqldCredDeb.CommandText := 'select'+
                               ' sum(VALOR) as CRED_DEB '+
                               'from CAIXA '+
                               'where (TIPO = :PTIPO) '+
                               'and (DATA >= :DATAINI) '+
                               'and (DATA <= :DATAFIM)';

    sqldCredDeb.Params.ParamByName('DATAINI').AsDate := StrToDateTime(DataIni);
    sqldCredDeb.Params.ParamByName('DATAFIM').AsDate := StrToDateTime(DataFim);
    sqldCredDeb.ParamByName('PTIPO').AsString        := 'D';

    sqldCredDeb.Open;
    TotalDebito := sqldCredDebCRED_DEB.AsFloat;

    { creditos }
    sqldCredDeb.Close;
    sqldCredDeb.CommandText := 'select'+
                               ' sum(VALOR) as CRED_DEB '+
                               'from CAIXA '+
                               'where (TIPO = :PTIPO) '+
                               'and (DATA >= :DATAINI) '+
                               'and (DATA <= :DATAFIM)';

    sqldCredDeb.Params.ParamByName('DATAINI').AsDate := StrToDateTime(DataIni);
    sqldCredDeb.Params.ParamByName('DATAFIM').AsDate := StrToDateTime(DataFim);
    sqldCredDeb.ParamByName('PTIPO').AsString        := 'C';

    sqldCredDeb.Open;
    TotalCredito := sqldCredDebCRED_DEB.AsFloat;
  end
  else
  begin

    { debitos }
    sqldCredDeb.Close;
    sqldCredDeb.CommandText := 'select'+
                               ' sum(VALOR) as CRED_DEB '+
                               'from CAIXA '+
                               'where (TIPO = :PTIPO)';
    sqldCredDeb.ParamByName('PTIPO').AsString := 'D';
    sqldCredDeb.Open;
    TotalDebito := sqldCredDebCRED_DEB.AsFloat;

    { creditos }
    sqldCredDeb.Close;
    sqldCredDeb.CommandText := 'select'+
                               ' sum(VALOR) as CRED_DEB '+
                               'from CAIXA '+
                               'where (TIPO = :PTIPO)';
    sqldCredDeb.ParamByName('PTIPO').AsString := 'C';
    sqldCredDeb.Open;
    TotalCredito := sqldCredDebCRED_DEB.AsFloat;
  end;
end;

procedure TfrmCaixa.SetCaixaDefault;
var
  cmd: TDBXCommand;
  tx: TDBXTransaction;
begin
  tx := sqldPadrao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

  cmd := sqldPadrao.SQLConnection.DBXConnection.CreateCommand;
  try
    try
      cmd.Text := 'execute procedure STPCAIXASPADRAO('+IntToStr( Configuracao.CaixaPadrao )+')';
      cmd.Prepare;
      cmd.ExecuteQuery;

      sqldPadrao.SQLConnection.CommitFreeAndNil(tx);
    except
      sqldPadrao.SQLConnection.RollbackFreeAndNil(tx);
    end;
  finally
    cmd.Free;
  end;
end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
  try
    TfrmAguarde.Execute('Preparando dados...');
    inherited;
    ReordenaBotoes([btnNovo, btnAlterar, btnExcluir, btnLocate, btnFiltrar, btnFechar]);
    SetCaixaDefault;

    try
      cdsPadrao.DisableControls;
      cdsPadrao.Close;
      if Configuracao.LancCaixa90Dias then
        cdsPadrao.CommandText := SQLPadrao90Dias
      else
        cdsPadrao.CommandText := SQLPadraoTodos;
      cdsPadrao.Open;
      cdsPadrao.Last;
    finally
      cdsPadrao.EnableControls;
    end;

    SQLPadraoTela := sqldPadrao.CommandText;
    CentralizaForm(Self);
  finally
    FreeAndNil(frmAguarde);
  end;
end;

procedure TfrmCaixa.miRelPersonalCaixaClick(Sender: TObject);
begin
  TfrmGeraRelatorio.Execute('Caixa', 'CAIXA', GetConnection);
end;

procedure TfrmCaixa.miRelContaCaixaClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioCaixaContaCaixa', 'Relatório por conta caixa', Self);
end;

procedure TfrmCaixa.miExcluirVariosClick(Sender: TObject);
begin
  ChamaForm('TfrmExclusaoCaixa', 'Exclusão de lançamentos do caixa', Self);
end;

procedure TfrmCaixa.CaixaInserido(var Msg: TMessage);
begin
  miLimpaFiltro.Click;
end;

procedure TfrmCaixa.cdsPadraoTIPOGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsString = 'C' then
    Text := 'Entrada'
  else
  if Sender.AsString = 'D' then
    Text := 'Saída'
  else
    Text := '';
end;

procedure TfrmCaixa.btnNovoClick(Sender: TObject);
begin
  frmLancCaixa := TfrmLancCaixa.Create(Self);
  frmLancCaixa.IdCaixa := 0;
  frmLancCaixa.ShowModal;
end;

procedure TfrmCaixa.btnLocateClick(Sender: TObject);
begin
  //Ed_Localizar(cdsPadrao, Self, dbgdCaixa);
end;

procedure TfrmCaixa.dsCaixaStateChange(Sender: TObject);
begin

  if Configuracao.MostrarSaldoCaixa then
  begin
    Totais_Caixa;
    stbCaixa.Panels[1].Text := 'Saldo: R$ '+
      FormatFloat('#,##0.00', (TotalCredito - TotalDebito));
  end
  else
    stbCaixa.Panels[1].Text := FormatDateTime('dd/mm/yyyy', Date);

  if Configuracao.LancCaixa90Dias then
    stbCaixa.Panels[0].Text := 'Exibindo lançamentos dos últimos 90 dias'
  else
    stbCaixa.Panels[0].Text := 'Exibindo todos os lançamentos';

end;

procedure TfrmCaixa.dspPadraoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: WideString);
begin
  TableName := 'CAIXA';
end;

procedure TfrmCaixa.cdsPadraoAfterOpen(DataSet: TDataSet);
begin
  dbgdCaixa.DataSource := nil;
  dbgdCaixa.DataSource := dsCaixa;
end;

procedure TfrmCaixa.miMovimentoHojeClick(Sender: TObject);
begin
  Totais_Rel(DateToStr(Date),DateToStr(Date));

  with TfrmPrevCaixaTodos.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.CommandText := 'select'+
                             ' CAIXA,'+
                             ' DATA,'+
                             ' DESCRICAO,'+
                             ' DOCUMENTO,'+
                             ' TIPO,'+
                             ' VALOR '+
                             'from VIEWRELCAIXATODOS '+
                             'where (DATA = CURRENT_DATE) '+
                             'order by CAIXA, DATA, TIPO, DESCRICAO';
    cdsPadrao.Open;
    cdsPadrao.DisableControls;
    //lbCreditos.Caption := 'Entradas R$: ' + FormatFloat('#,##0.00', TotalCredito);
    //lbDebitos.Caption := 'Saídas R$: ' + FormatFloat('#,##0.00', TotalDebito);

    //if Configuracao.MostrarSaldoCaixa then
    //  lbSaldo.Caption := 'Saldo R$: ' + FormatFloat('#,##0.00', (TotalCredito - TotalDebito))
    //else
    //  lbSaldo.Caption := '';

    //Titulo  := 'Movimentação do dia '+FormatDateTime('dd/mm/yyyy', Date);
    //DataIni := FormatDateTime('dd/mm/yyyy', Date);
    //DataFim := FormatDateTime('dd/mm/yyyy', Date);

    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.EnableControls;
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  miMovimentoHoje.Caption :=
    miMovimentoHoje.Caption +' '+ FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TfrmCaixa.ExclusaoCaixa(var Msg: TMessage);
begin
  miLimpaFiltro.Click;
end;

initialization
  RegisterClass(TfrmCaixa);
finalization
  UnRegisterClass(TfrmCaixa);
end.

