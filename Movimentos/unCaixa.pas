unit unCaixa;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, Buttons, memds,  SqlDb,
  Menus, ComCtrls, ConstPadrao, unSimplePadrao, LCLType, ZDataset;

const
  SQLPadrao90Dias: string = 'select '+
                            'cx.CODCAIXA, '+
                            'cx.CODCAIXAS, '+
                            'cxs.NOME, '+
                            'cx.DATA_LANC, '+
                            'cx.DESCRICAO, '+
                            'cx.DOCUMENTO, '+
                            'cx.TIPO, '+
                            'cx.VALOR, '+
                            'cx.EXCLUIR '+
                            'from CAIXA cx '+
                            'left join CAIXAS cxs on (cx.CODCAIXAS = cxs.CODIGO) '+
                            'where (cx.DATA_LANC >= (CURRENT_DATE - 90)) '+
                            'order by cx.DATA_LANC';

  SQLPadraoTodos: string = 'select '+
                           'cx.CODCAIXA, '+
                           'cx.CODCAIXAS, '+
                           'cxs.NOME, '+
                           'cx.DATA_LANC, '+
                           'cx.DESCRICAO, '+
                           'cx.DOCUMENTO, '+
                           'cx.TIPO, '+
                           'cx.VALOR, '+
                           'cx.EXCLUIR '+
                           'from CAIXA cx '+
                           'left join CAIXAS cxs on (cx.CODCAIXAS = cxs.CODIGO) '+
                           'order by cx.DATA_LANC';

type

  { TfrmCaixa }

  TfrmCaixa = class(TfrmSimplePadrao)
    dsCaixa: TDataSource;
    dsCaixas: TDataSource;
    mnCaixa: TMainMenu;
    miRegistro: TMenuItem;
    miNovo: TMenuItem;
    miAlterar: TMenuItem;
    miExcluir: TMenuItem;
    N1: TMenuItem;
    miSair: TMenuItem;
    miFerramenta: TMenuItem;
    miCadContaCaixa: TMenuItem;
    N6: TMenuItem;
    miExcluirPeriodo: TMenuItem;
    miExcluirVarios: TMenuItem;
    N7: TMenuItem;
    miContarReg: TMenuItem;
    miExportaDados: TMenuItem;
    miPesquisar: TMenuItem;
    miFiltraData: TMenuItem;
    miFiltraCredito: TMenuItem;
    miFiltraDebito: TMenuItem;
    miFiltraPorContaCaixa: TMenuItem;
    miFiltraColuna: TMenuItem;
    N3: TMenuItem;
    miLimpaFiltro: TMenuItem;
    miRelatorio: TMenuItem;
    miRelTodos: TMenuItem;
    N4: TMenuItem;
    miRelMesAno: TMenuItem;
    miRelContaCaixa: TMenuItem;
    N8: TMenuItem;
    miRelFluxoCaixa: TMenuItem;
    miMovimentoHoje: TMenuItem;
    N5: TMenuItem;
    miRelPersonalCaixa: TMenuItem;
    stbCaixa: TStatusBar;
    pnBotoes: TPanel;
    btnNovo: TSpeedButton;
    btnLocate: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnFiltrar: TSpeedButton;
    btnFechar: TSpeedButton;
    dbgdCaixa: TDBGrid;
    PopupConsulta: TPopupMenu;
    miDeleteItem: TMenuItem;
    miLocalizaColuna: TMenuItem;
    sqldCredDeb: TZQuery;
    sqlPadrao: TZQuery;
    ZQuery3: TZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miExcluirPeriodoClick(Sender: TObject);
    procedure miFiltraDataClick(Sender: TObject);
    procedure miFiltraCreditoClick(Sender: TObject);
    procedure miFiltraDebitoClick(Sender: TObject);
    procedure miLimpaFiltroClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure miCadContaCaixaClick(Sender: TObject);
    procedure miContarRegClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure miRelFluxoCaixaClick(Sender: TObject);
    procedure miRelTodosClick(Sender: TObject);
    procedure miRelMesAnoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miRelContaCaixaClick(Sender: TObject);
    procedure miExcluirVariosClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dsCaixaStateChange(Sender: TObject);
    procedure miMovimentoHojeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

uses  unLancCaixa, Funcoes, unModeloConsulta,
     VarGlobal, unPrevCaixaTodos,  uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmCaixa.Totais_Caixa;
begin

  { debitos }
  sqldCredDeb.Close;
  sqldCredDeb.SQL.Clear; sqldCredDeb.SQL.Text :='select'+
                             ' sum(VALOR) as CRED_DEB '+
                             'from CAIXA '+
                             'where (TIPO = :PTIPO)';
  sqldCredDeb.ParamByName('PTIPO').AsString := 'D';
  sqldCredDeb.Open;
  TotalDebito := sqldCredDeb.FieldbyName('CRED_DEB').AsFloat;

  { creditos }
  sqldCredDeb.Close;
  sqldCredDeb.SQL.Clear; sqldCredDeb.SQL.Text :='select'+
                             ' sum(VALOR) as CRED_DEB '+
                             'from CAIXA '+
                             'where (TIPO = :PTIPO)';
  sqldCredDeb.ParamByName('PTIPO').AsString := 'C';
  sqldCredDeb.Open;
  TotalCredito := sqldCredDeb.FieldbyName('CRED_DEB').AsFloat;

end;

procedure TfrmCaixa.btnExcluirClick(Sender: TObject);
begin
  if sqlPadrao.IsEmpty then Exit;

  if MsgSN('Confirma exclusão do lançamento?') then
  begin
    with TZQuery.Create(Self) do
    try
      Close;
      Connection := GetZConnection;
      SQL.Clear;
      SQL.Text :='DELETE FROM CAIXA WHERE CODCAIXA = :CODIGO';
      Params.ParamByName('CODIGO').AsInteger := sqlPadrao.FieldbyName('CODCAIXA').AsInteger;
      ExecSQL;

      sqlPadrao.Close;
      sqlPadrao.Open;
    finally
      Free;
    end;
  end;
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCaixa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  UpdatesPending(sqlPadrao, Self);
end;

procedure TfrmCaixa.miExcluirPeriodoClick(Sender: TObject);
var
  dtI, dtF: String;
begin
  try
    try
      sqlPadrao.DisableControls;

      if ObterDatas(dtI, dtF) then
      begin
        if (ClearMask(dtI) <> '') and (ClearMask(dtF) <> '') then
        begin
          with TZQuery.Create(nil) do
          try
            Connection := sqlPadrao.Connection;
            SQL.Clear;
            SQL.Text :='delete from CAIXA '+
              'where DATA_LANC between :DATAINI and :DATAFIM';
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
    sqlPadrao.Close;
    sqlPadrao.Open;
    sqlPadrao.Last;
    sqlPadrao.EnableControls;
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
      sqlPadrao.Close;
      sqlPadrao.Filtered := False;
      sqlPadrao.Filter :=
        'DATA >= ' + QuotedStr(DataIni) + ' AND DATA <= ' + QuotedStr(DataFim);
      sqlPadrao.Filtered := True;
      sqlPadrao.Open;

      if sqlPadrao.IsEmpty then
      begin
        MsgCuidado(UM_PESQUISAVAZIO);
        sqlPadrao.Filtered := False;
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
    sqlPadrao.Close;
    sqlPadrao.Filtered := False;
    sqlPadrao.Filter := 'TIPO = ' + QuotedStr('C');
    sqlPadrao.Filtered := True;
    sqlPadrao.Open;

    if sqlPadrao.IsEmpty then
    begin
      MsgCuidado('',UM_PESQUISAVAZIO);
      sqlPadrao.Filtered := False;
      Exit;
    end;
  end;
end;

procedure TfrmCaixa.miFiltraDebitoClick(Sender: TObject);
begin
  if MsgSN('Mostrar apenas Saidas efetuadas?') then
  begin
    sqlPadrao.Close;
    sqlPadrao.Filtered := False;
    sqlPadrao.Filter := 'TIPO = ' + QuotedStr('D');
    sqlPadrao.Filtered := True;
    sqlPadrao.Open;

    if sqlPadrao.IsEmpty then
    begin
      MsgCuidado(UM_PESQUISAVAZIO);
      sqlPadrao.Filtered := False;
      Exit;
    end;
  end;
end;

procedure TfrmCaixa.miLimpaFiltroClick(Sender: TObject);
begin
  try
    sqlPadrao.DisableControls;
    sqlPadrao.Close;
    sqlPadrao.SQL.Clear;
    sqlPadrao.SQL.Text :=SQLPadraoTela;

    if sqlPadrao.Filter <> '' then
      sqlPadrao.Filter := '';

    if sqlPadrao.Filtered then
      sqlPadrao.Filtered := False;

    sqlPadrao.Open;
    sqlPadrao.Last;
  finally
    dsCaixa.OnStateChange(dsCaixa);
    sqlPadrao.EnableControls;
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

procedure TfrmCaixa.miContarRegClick(Sender: TObject);
begin
  miLimpaFiltro.Click;
end;

procedure TfrmCaixa.btnAlterarClick(Sender: TObject);
begin
  if sqlPadrao.IsEmpty then Exit;
  frmLancCaixa := TfrmLancCaixa.Create(Self);
  frmLancCaixa.IdCaixa := sqlPadrao.FieldByName('CODCAIXA').AsInteger;
  frmLancCaixa.ShowModal;
end;

procedure TfrmCaixa.miRelFluxoCaixaClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioFluxoCaixa', 'Relatorio de caixa', Self);
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
    if not sqlPadrao.Active then
      sqlPadrao.Open;

    sqlPadrao.Filtered := False;
    sqlPadrao.Filter   := 'DATA_LANC >= '+QuotedStr(vDataIni)+' and DATA_LANC <= '+QuotedStr(vDataFim);
    sqlPadrao.Filtered := True;

    lbCreditos.Caption := 'Creditos R$: ' + FormatFloat('#,##0.00', TotalCredito);
    lbDebitos.Caption  := 'Debitos R$: ' + FormatFloat('#,##0.00', TotalDebito);
    lbSaldo.Caption    := 'Saldo R$: ' + FormatFloat('#,##0.00', (TotalCredito - TotalDebito));

    lbSaldo.Visible := Configuracao.MostrarSaldoCaixa;
    Titulo  := 'Livro caixa entre '+vDataIni+' e '+vDataFim;
    DataIni := vDataIni;
    DataFim := vDataFim;

    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqlPadrao.Close;
    Free;
  end;
end;

procedure TfrmCaixa.miRelMesAnoClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioCaixaMensal', 'Caixa por mes e ano', Self);
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
  if TfrmModeloConsulta.Execute('Consulta Caixa', 'CAIXA', FN_CAIXA, DL_CAIXA, self) > 0 then
  begin
    sqlPadrao.Close;
    sqlPadrao.SQL.Clear;
    sqlPadrao.SQL.Text :=SQLPadraoTela;
    sqlPadrao.Open;
    sqlPadrao.Last;
  end;
end;

procedure TfrmCaixa.Totais_Rel(DataIni: string = ''; DataFim: string = '');
begin

  if (DataIni <> '') and (DataFim <> '') then
  begin

    { debitos }
    sqldCredDeb.Close;
    sqldCredDeb.SQL.Clear; sqldCredDeb.SQL.Text :='select'+
                               ' sum(VALOR) as CRED_DEB '+
                               'from CAIXA '+
                               'where (TIPO = :PTIPO) '+
                               'and (DATA_LANC >= :DATAINI) '+
                               'and (DATA_LANC <= :DATAFIM)';

    sqldCredDeb.Params.ParamByName('DATAINI').AsDate := StrToDateTime(DataIni);
    sqldCredDeb.Params.ParamByName('DATAFIM').AsDate := StrToDateTime(DataFim);
    sqldCredDeb.ParamByName('PTIPO').AsString        := 'D';

    sqldCredDeb.Open;
    TotalDebito := sqldCredDeb.FieldByName('CRED_DEB').AsFloat;

    { creditos }
    sqldCredDeb.Close;
    sqldCredDeb.SQL.Clear; sqldCredDeb.SQL.Text :='select'+
                               ' sum(VALOR) as CRED_DEB '+
                               'from CAIXA '+
                               'where (TIPO = :PTIPO) '+
                               'and (DATA_LANC >= :DATAINI) '+
                               'and (DATA_LANC <= :DATAFIM)';

    sqldCredDeb.Params.ParamByName('DATAINI').AsDate := StrToDateTime(DataIni);
    sqldCredDeb.Params.ParamByName('DATAFIM').AsDate := StrToDateTime(DataFim);
    sqldCredDeb.ParamByName('PTIPO').AsString        := 'C';

    sqldCredDeb.Open;
    TotalCredito := sqldCredDeb.FieldByName('CRED_DEB').AsFloat;
  end
  else
  begin

    { debitos }
    sqldCredDeb.Close;
    sqldCredDeb.SQL.Clear; sqldCredDeb.SQL.Text :='select'+
                               ' sum(VALOR) as CRED_DEB '+
                               'from CAIXA '+
                               'where (TIPO = :PTIPO)';
    sqldCredDeb.ParamByName('PTIPO').AsString := 'D';
    sqldCredDeb.Open;
    TotalDebito := sqldCredDeb.FieldByName('CRED_DEB').AsFloat;

    { creditos }
    sqldCredDeb.Close;
    sqldCredDeb.SQL.Clear; sqldCredDeb.SQL.Text :='select'+
                               ' sum(VALOR) as CRED_DEB '+
                               'from CAIXA '+
                               'where (TIPO = :PTIPO)';
    sqldCredDeb.ParamByName('PTIPO').AsString := 'C';
    sqldCredDeb.Open;
    TotalCredito := sqldCredDeb.FieldByName('CRED_DEB').AsFloat;
  end;
end;

procedure TfrmCaixa.SetCaixaDefault;
begin
  with TZQuery.create(nil) do
  try
    Connection:=GetZConnection;
    SQL.Clear;
    SQL.Add('UPDATE CAIXA cx SET cx.Codcaixas = :ID WHERE (cx.Codcaixas IS NULL)');
    Prepare;
    ParamByName('ID').AsInteger := Configuracao.CaixaPadrao;
    ExecSQL;
  finally
    free;
  end;
end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
  try
    inherited;
    ReordenaBotoes([btnNovo, btnAlterar, btnExcluir, btnLocate, btnFiltrar, btnFechar]);
    SetCaixaDefault;

    try
      sqlPadrao.DisableControls;
      sqlPadrao.Close;
      sqlPadrao.SQL.Clear;
      if Configuracao.LancCaixa90Dias then
      begin
        sqlPadrao.SQL.Text :=SQLPadrao90Dias
      end
      else
      begin
        sqlPadrao.SQL.Text :=SQLPadraoTodos;
      end;
      sqlPadrao.Open;
      sqlPadrao.Last;
    finally
      sqlPadrao.EnableControls;
    end;

    SQLPadraoTela := sqlPadrao.SQL.text;
    CentralizaForm(Self);
  finally
  end;
end;

procedure TfrmCaixa.miRelContaCaixaClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioCaixaContaCaixa', 'Relatorio por conta caixa', Self);
end;

procedure TfrmCaixa.miExcluirVariosClick(Sender: TObject);
begin
  ChamaForm('TfrmExclusaoCaixa', 'Exclusão de lançamentos do caixa', Self);
end;

procedure TfrmCaixa.CaixaInserido(var Msg: TMessage);
begin
  miLimpaFiltro.Click;
end;

procedure TfrmCaixa.btnNovoClick(Sender: TObject);
begin
  frmLancCaixa := TfrmLancCaixa.Create(Self);
  frmLancCaixa.IdCaixa := 0;
  frmLancCaixa.ShowModal;
end;

procedure TfrmCaixa.dsCaixaStateChange(Sender: TObject);
begin
  if (stbCaixa.Panels.Count > 0) then
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

end;

procedure TfrmCaixa.miMovimentoHojeClick(Sender: TObject);
begin
  Totais_Rel(DateToStr(Date),DateToStr(Date));

  with TfrmPrevCaixaTodos.Create(Self) do
  try
    //sqlPadrao.Close;
    //sqlPadrao.SQL.Clear; SQL.Text :='select'+
    //                         ' CAIXA,'+
    //                         ' DATA,'+
    //                         ' DESCRICAO,'+
    //                         ' DOCUMENTO,'+
    //                         ' TIPO,'+
    //                         ' VALOR '+
    //                         'from VIEWRELCAIXATODOS '+
    //                         'where (DATA = CURRENT_DATE) '+
    //                         'order by CAIXA, DATA, TIPO, DESCRICAO';
    sqlPadrao.Open;
    sqlPadrao.DisableControls;
    lbCreditos.Caption := 'Entradas R$: ' + FormatFloat('#,##0.00', TotalCredito);
    lbDebitos.Caption := 'Saídas R$: ' + FormatFloat('#,##0.00', TotalDebito);

    if Configuracao.MostrarSaldoCaixa then
      lbSaldo.Caption := 'Saldo R$: ' + FormatFloat('#,##0.00', (TotalCredito - TotalDebito))
    else
      lbSaldo.Caption := '';

    Titulo  := 'Movimentação do dia '+FormatDateTime('dd/mm/yyyy', Date);
    DataIni := FormatDateTime('dd/mm/yyyy', Date);
    DataFim := FormatDateTime('dd/mm/yyyy', Date);

    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqlPadrao.EnableControls;
    sqlPadrao.Close;
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

