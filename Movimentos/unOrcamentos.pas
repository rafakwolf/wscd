unit unOrcamentos;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   DBCtrls, StdCtrls, DB,  Grids, DBGrids, Buttons,
  SqlDb, Menus, ComCtrls, memds, LCLtype, MaskEdit, ZDataset, ZSqlUpdate;

type

  { TfrmOrcamentos }

  TfrmOrcamentos = class(TForm)
    comboVendedor: TDBLookupComboBox;
    comboProduto: TDBLookupComboBox;
    dsCliente: TDataSource;
    dsVendedor: TDataSource;
    dsProdutos: TDataSource;
    dsOrcam: TDataSource;
    dsDetOrcam: TDataSource;
    edtQtde: TMaskEdit;
    edtCusto: TMaskEdit;
    edtVenda: TMaskEdit;
    edtDescto: TMaskEdit;
    edtValorDescto: TMaskEdit;
    edtTotalItem: TMaskEdit;
    Menu: TMainMenu;
    miRegistro: TMenuItem;
    miPrimeiro: TMenuItem;
    miAnterior: TMenuItem;
    miProximo: TMenuItem;
    miUltimo: TMenuItem;
    N1: TMenuItem;
    miNovo: TMenuItem;
    miDeletar: TMenuItem;
    miAlterar: TMenuItem;
    N2: TMenuItem;
    miSalvar: TMenuItem;
    miCancelar: TMenuItem;
    N3: TMenuItem;
    miFechar: TMenuItem;
    mFerramentas: TMenuItem;
    miLocalizar: TMenuItem;
    miOutroFiltro: TMenuItem;
    miFiltrarData: TMenuItem;
    miFiltrarCliente: TMenuItem;
    miLimpaFiltro: TMenuItem;
    N5: TMenuItem;
    miContar: TMenuItem;
    N7: TMenuItem;
    miCadastraCliente: TMenuItem;
    miCadastrarvendedor: TMenuItem;
    miCadastrarproduto: TMenuItem;
    miOpcoes: TMenuItem;
    miConcluir: TMenuItem;
    miReabrir: TMenuItem;
    N6: TMenuItem;
    miAplicarDesc: TMenuItem;
    miRelatorio: TMenuItem;
    miRelOramento: TMenuItem;
    miRelOrcam: TMenuItem;
    N4: TMenuItem;
    Oramentoembobina1: TMenuItem;
    stbOrcamento: TStatusBar;
    pnBotoes: TPanel;
    btnFechar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnCancel: TSpeedButton;
    btnGravar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnProximo: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    pnlTotal: TPanel;
    LabelObs: TLabel;
    lbNumero: TLabel;
    LabelStatus: TLabel;
    LabelConcluido: TLabel;
    lbItens: TLabel;
    lbTotal: TLabel;
    btnInsereProduto: TBitBtn;
    memdse: TDBEdit;
    edtNumero: TDBEdit;
    dbStatus: TDBEdit;
    dbConcluido: TDBEdit;
    dbCodCliente: TDBEdit;
    dbdDataOrcam: TDBEdit;
    dbeItens: TDBEdit;
    dbeTotal: TDBEdit;
    dbmObs: TDBMemo;
    grdItens: TDBGrid;
    qVendedor: TZReadOnlyQuery;
    qProdutos: TZReadOnlyQuery;
    qOrcam: TZQuery;
    qDetOrcam: TZQuery;
    updOrcam: TZUpdateSQL;
    updDetOrcam: TZUpdateSQL;
    qCliente: TZReadOnlyQuery;
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure grdItensDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure miFiltrarDataClick(Sender: TObject);
    procedure miAplicarDescClick(Sender: TObject);
    procedure miLimpaFiltroClick(Sender: TObject);
    procedure miRelOramentoClick(Sender: TObject);
    procedure miRelOrcamClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure miConcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbCodClienteClickButton(Sender: TObject);
    procedure dbProdutoClickButton(Sender: TObject);
    procedure btnInsereProdutoClick(Sender: TObject);
    procedure cdsSelecaoAfterPost(DataSet: TDataSet);
    procedure dbVendaExit(Sender: TObject);
    procedure dbDesctoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsOrcamCODCLIENTEValidate(Sender: TField);
    procedure cdsDetOrcamCODPRODUTOValidate(Sender: TField);
    procedure cdsOrcamAfterInsert(DataSet: TDataSet);
    procedure dsOrcamStateChange(Sender: TObject);
    procedure cdsDetOrcamBeforeDelete(DataSet: TDataSet);
    procedure cdsDetOrcamBeforePost(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Oramentoembobina1Click(Sender: TObject);
    procedure cdsOrcamSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure miReabrirClick(Sender: TObject);
    procedure dbeIdVendedorClickButton(Sender: TObject);
    procedure cdsOrcamIDVENDEDORValidate(Sender: TField);
    procedure miCadastraClienteClick(Sender: TObject);
    procedure miCadastrarvendedorClick(Sender: TObject);
    procedure miCadastrarprodutoClick(Sender: TObject);
  private
    SQLPadrao: string;
    procedure InsereProduto;
    procedure TotaisDetalhe;
    procedure AjustaStatusBar;
  public
  end;

var
  frmOrcamentos: TfrmOrcamentos;

implementation

uses unCliente, Funcoes, unModeloConsulta, VarGlobal, unPrevOrcammento,
     uConfiguraRelatorio, unRelatorioBobinaOrcam,
     uDatabaseUtils;

{$R *.lfm}

procedure TfrmOrcamentos.btnNovoClick(Sender: TObject);
begin
  qOrcam.Append;
  qOrcam.FieldByName('DATA').AsDateTime := Date;
  qOrcam.FieldByName('STATUS').AsString := 'P';
  qOrcam.FieldByName('CONCLUIDO').AsString := 'N';
  qOrcam.FieldByName('TOTAL').AsFloat := 0;
end;

procedure TfrmOrcamentos.btnExcluirClick(Sender: TObject);
begin
  if qOrcam.IsEmpty then Exit;

  if MsgSN('Deseja realmente excluir?') then
  begin
    with TZQuery.Create(nil) do
    try
      Connection := GetZConnection;
      SQL.Add('delete from ITEMORCAMENTO where CODIGO = :CODIGO;');
      SQL.Add('delete from ORCAMENTO where CODIGO = :CODIGO');
      Prepare;
      Params.ParamByName('CODIGO').AsInteger := qOrcam.FieldByname('CODIGO').AsInteger;
      ExecSQL;
    finally
      free;
      qOrcam.Close;
      qOrcam.Open;
    end;
  end;
end;

procedure TfrmOrcamentos.btnCancelClick(Sender: TObject);
begin
  qOrcam.CancelUpdates;
end;

procedure TfrmOrcamentos.grdItensDblClick(Sender: TObject);
begin
  if qOrcam.State in [dsEdit, dsInsert] then
  begin
    if MsgSN('Deseja realmente excluir ' + #13#10 +
      '(' + qDetOrcam.FieldByname('NOMEPRODUTO').AsString + ')' + #13#10 +
      'da listagem de produtos?') then
      qDetOrcam.Delete;
  end;
end;

procedure TfrmOrcamentos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  UpdatesPending(qOrcam, Self);
end;

procedure TfrmOrcamentos.btnConsultarClick(Sender: TObject);
var
  Codigo: String;
begin
  Codigo := '0';
  if InputQuery('Localiza por numero', 'Numero do orcamento:', Codigo) and (Codigo <> '0') then
  begin
    qOrcam.IndexFieldNames := 'CODIGO';
    if not qOrcam.Locate('CODIGO', Codigo, []) then
      MsgAviso(Codigo+' nao encontrado.');
  end;
end;

procedure TfrmOrcamentos.btnAnteriorClick(Sender: TObject);
begin
  qOrcam.Prior;
end;

procedure TfrmOrcamentos.btnPrimeiroClick(Sender: TObject);
begin
  qOrcam.First;
end;

procedure TfrmOrcamentos.btnProximoClick(Sender: TObject);
begin
  qOrcam.Next;
end;

procedure TfrmOrcamentos.btnUltimoClick(Sender: TObject);
begin
  qOrcam.Last;
end;

procedure TfrmOrcamentos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrcamentos.FormShow(Sender: TObject);
var
  NroOrcamentoAberto: Integer;
begin
  try
    qProdutos.Open;
    qCliente.Open;
    qOrcam.Open;
    if Configuracao.OrcamConcluido then
    begin
      NroOrcamentoAberto :=
        SelecSingleField('SELECT COUNT(1) NUM FROM ORCAMENTO WHERE CONCLUIDO = ' +
          QuotedStr('N'), GetZConnection);

      if (NroOrcamentoAberto > 0) then
      begin

        if MsgSN('Existe(m) ' + IntToStr(NroOrcamentoAberto) +
          ' Orcamentos(s), nao concluido(s). '+
          'Por favor verifique, pois estes podem impedir ' +
          'a importacao dos mesmos para vendas.'+#13#10+'Exibir somente orcamentos Nao concluidos agora?') then
        begin
          qOrcam.Filtered := False;
          qOrcam.Filter := 'CONCLUIDO = '+QuotedStr('N');
          qOrcam.Filtered := True;
        end;
      end;
    end;
    SQLPadrao := qOrcam.sql.text;
  finally
  end;
end;

procedure TfrmOrcamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qProdutos.Close;
  qCliente.Close;
  qOrcam.Close;
  Action := caFree;
end;

procedure TfrmOrcamentos.btnGravarClick(Sender: TObject);
begin
  try
    if ValidaFieldsVazios([
       qOrcam.FieldByname('CODCLIENTE'),
       qOrcam.FieldByname('DATA'),
       qOrcam.FieldByname('IDVENDEDOR')],
      ['Cliente', 'Data', 'Vendedor']) = '' then
      qOrcam.ApplyUpdates
    else
      MsgCuidado('Orcamento incompleto.');
  except
    raise Exception.Create('Erro ao salvar orcamento.');
  end;
end;

procedure TfrmOrcamentos.miFiltrarDataClick(Sender: TObject);
var
  dtI, dtF: String;
begin
  if (ObterDatas(dtI, dtF)) then
  begin
    if (ClearMask(dtI) <> '') and (ClearMask(dtF) <> '') then
    begin
      qOrcam.Close;
      qOrcam.SQL.Clear;
      qOrcam.SQL.Text := 'select * from ORCAMENTO ' +
        'where DATA between :DATAINI and :DATAFIM';
      qOrcam.Params.ParamByName('DATAINI').AsDate := StrToDate(dtI);
      qOrcam.Params.ParamByName('DATAFIM').AsDate := StrToDate(dtF);
      qOrcam.Open;

      if qOrcam.IsEmpty then
      begin
        MsgCuidado('Informe as datas para pesquisa.');
        Exit;
      end;
    end
    else
      MsgErro('Datas invalidas.');
  end;
end;

procedure TfrmOrcamentos.miAplicarDescClick(Sender: TObject);
var
  Percent, Valor: Real;
begin

  if qOrcam.FieldByname('CONCLUIDO').AsString = 'S' then
  begin
    MsgAviso('Nao e possivel efetuar descontos em um orcamento ja concluido.');
    Exit;
  end;

  Percent := 0;
  if(ObterValor(Percent,'',''))then
  if(Percent <> 0)then
  begin
    Valor := (qOrcam.FieldByname('TOTAL').AsFloat * (Percent/100));
    qOrcam.Edit;
    qOrcam.FieldByname('TOTAL').AsFloat := (qOrcam.FieldByname('TOTAL').AsFloat - Valor);
    qOrcam.ApplyUpdates;
  end
  else
    MsgErro('Informe o valor do desconto.');
end;

procedure TfrmOrcamentos.miLimpaFiltroClick(Sender: TObject);
begin
  try
    qOrcam.DisableControls;
    qOrcam.Close;
    qOrcam.SQL.Clear;
    qOrcam.SQL.Text :=SQLPadrao;
    qOrcam.Filtered := False;
    qOrcam.Open;
  finally
    qOrcam.EnableControls;
  end;
end;

procedure TfrmOrcamentos.miRelOramentoClick(Sender: TObject);
begin
  with TfrmPrevOrcamento.Create(Self) do
  try
    cdsPadrao.Close;
    //cdsPadrao.Params.ParamByName('PCODIGO').AsInteger :=
    //   qOrcam.FieldByname('CODIGO').AsInteger;
    cdsPadrao.Open;
    lbTitulo.Caption := Global.TituloOrcamento;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmOrcamentos.miRelOrcamClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioOrcamentoData', 'Orcamentos por data', Self);
end;

procedure TfrmOrcamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 4,'');
end;

procedure TfrmOrcamentos.miConcluirClick(Sender: TObject);
begin
  if MsgSN('Concluir este orcamento?') then
  begin
    qOrcam.Edit;
    qOrcam.FieldByname('CONCLUIDO').AsString := 'S';
    qOrcam.ApplyUpdates;
    MsgAviso('Orcamento concluido com sucesso!');
  end;

  if qOrcam.IsEmpty then
    miLimpaFiltro.Click;
end;

procedure TfrmOrcamentos.btnEditarClick(Sender: TObject);
begin
  if qOrcam.FieldByname('CONCLUIDO').AsString = 'S' then
  begin
    if not Configuracao.EditarOrcam then
      MsgAviso('Sem premissao para editar este orcamento.')
    else
      qOrcam.Edit;
  end
  else
    qOrcam.Edit;
end;

procedure TfrmOrcamentos.InsereProduto;

  function ProdutoPromocao(IdProduto: Integer): Boolean;
  begin
    Result :=
      SQLFind('PROMOCAO', 'PRODUTO', IntToStr(IdProduto), GetZConnection);
  end;

  function DescontoPromocao(IdProduto: Integer): Extended;
  begin
    Result :=
      SelecSingleField('select DESCONTO from PROMOCAO where PRODUTO = '+
        QuotedStr(IntToStr(IdProduto)), GetZConnection);
  end;

  function PrecoPromocao(IdProduto: Integer): Extended;
  begin
    Result :=
      SelecSingleField('select PRECO from PROMOCAO where PRODUTO = '+
        QuotedStr(IntToStr(IdProduto)), GetZConnection);
  end;

begin
  comboProduto.KeyValue := qProdutos.FieldByName('IDPRODUTO').AsInteger;
  comboProduto.Text := qProdutos.FieldByName('ABREVIACAO').AsString;
  edtQtde.Text := '1';
  edtCusto.Text := qProdutos.FieldByName('CUSTO').AsString;

  if not ProdutoPromocao(comboProduto.KeyValue) then
  begin
    edtVenda.Text := FormatFloat('#,##0.00', StrToFloat(edtVenda.Text));
    edtDescto.Text := '0';
  end
  else
  begin
    edtVenda.Text :=
      FormatFloat('#,##0.00', PrecoPromocao(comboProduto.KeyValue));
    edtDescto.Text :=
      FormatFloat('#,##0.00', DescontoPromocao(comboProduto.KeyValue));
  end;
end;

procedure TfrmOrcamentos.btnInsereProdutoClick(Sender: TObject);
begin
  if not cdsSelecaoPRODUTO.IsNull then
  begin
    if (cdsSelecao.Active) and (not cdsSelecao.IsEmpty) then
    begin
      cdsDetOrcam.Append;
      cdsDetOrcamCODPRODUTO.AsInteger := cdsSelecaoPRODUTO.AsInteger;
      cdsDetOrcamQTDE.AsFloat := cdsSelecaoQTDE.AsFloat;
      cdsDetOrcamCUSTO.AsFloat := cdsSelecaoCUSTO.AsFloat;
      cdsDetOrcamVENDA.AsFloat := cdsSelecaoVENDA.AsFloat;
      cdsDetOrcamDESCTO.AsFloat := cdsSelecaoDESCTO.AsFloat;
      cdsDetOrcamVALORDESCTO.AsFloat := cdsSelecaoVALORDESCTO.AsFloat;
      cdsDetOrcamTOTAL.AsFloat := cdsSelecaoTOTAL.AsFloat;
      cdsDetOrcam.Post;

      cdsSelecao.Close;
      cdsSelecao.Open;
      dbProduto.SetFocus;
    end
    else
    begin
      MsgAviso('Selecione um Produto, para depois inseri-lo.');
      Exit;
    end;
  end;
end;

procedure TfrmOrcamentos.TotaisDetalhe;
begin
  cdsSelecao.Edit;
  cdsSelecaoTOTAL.AsFloat :=
    (cdsSelecaoQTDE.AsFloat * cdsSelecaoVENDA.AsFloat);

  cdsSelecaoVALORDESCTO.AsFloat :=
    (cdsSelecaoQTDE.AsFloat *
     cdsSelecaoVENDA.AsFloat *
     cdsSelecaoDESCTO.AsFloat / 100);

  cdsSelecaoTOTAL.AsFloat := (cdsSelecaoTOTAL.AsFloat - cdsSelecaoVALORDESCTO.AsFloat);
end;

procedure TfrmOrcamentos.cdsSelecaoAfterPost(DataSet: TDataSet);
begin
  TotaisDetalhe;
end;

procedure TfrmOrcamentos.dbVendaExit(Sender: TObject);
begin
  TotaisDetalhe;
end;

procedure TfrmOrcamentos.dbDesctoExit(Sender: TObject);
begin
  TotaisDetalhe;
end;

procedure TfrmOrcamentos.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
  AjustaStatusBar;
end;

procedure TfrmOrcamentos.dsOrcamStateChange(Sender: TObject);
var
  DadosPendentes: Boolean;
begin

  DadosPendentes := (dsOrcam.DataSet.State in [dsInsert, dsEdit]);

  if (dsOrcam.DataSet <> nil) and (dsOrcam.State <> dsInactive) then
  begin
    btnPrimeiro.Enabled := (not DadosPendentes);
    miPrimeiro.Enabled := btnPrimeiro.Enabled;
    btnAnterior.Enabled := (not DadosPendentes);
    miAnterior.Enabled := btnAnterior.Enabled;
    btnProximo.Enabled := (not DadosPendentes);
    miProximo.Enabled := btnProximo.Enabled;
    btnUltimo.Enabled := (not DadosPendentes);
    miUltimo.Enabled := btnUltimo.Enabled;
    btnNovo.Enabled := (not DadosPendentes);
    miNovo.Enabled := btnNovo.Enabled;
    btnEditar.Enabled := (not DadosPendentes);
    miAlterar.Enabled := btnEditar.Enabled;
    btnExcluir.Enabled := (not DadosPendentes) and (not dsOrcam.DataSet.IsEmpty);
    miDeletar.Enabled := btnExcluir.Enabled;
    btnConsultar.Enabled := (not DadosPendentes);
    btnGravar.Enabled := DadosPendentes;
    miSalvar.Enabled := btnGravar.Enabled;
    btnCancel.Enabled := DadosPendentes;
    miCancelar.Enabled := btnCancel.Enabled;
  end;

  if (dsOrcam.DataSet.State in [dsInsert]) then
    stbOrcamento.Panels[0].Text := ' Inserindo registro...'
  else if (dsOrcam.DataSet.State in [dsEdit]) then
    stbOrcamento.Panels[0].Text := ' Alterando registro...'
  else if (dsOrcam.DataSet.State in [dsBrowse]) then
    stbOrcamento.Panels[0].Text := ' Visualizando registro...'
  else if (dsOrcam.DataSet.IsEmpty) then
    stbOrcamento.Panels[0].Text := ' Nenhum registro...';

end;

procedure TfrmOrcamentos.Oramentoembobina1Click(Sender: TObject);
begin
  frmRelatorioBobinaOrcam := TfrmRelatorioBobinaOrcam.Create(Self);
  frmRelatorioBobinaOrcam.IdOrcamento := cdsOrcamCODIGO.AsInteger;
  frmRelatorioBobinaOrcam.Caption := 'Orcamento em bobina';
  frmRelatorioBobinaOrcam.ShowModal;
end;

procedure TfrmOrcamentos.cdsOrcamSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = 'E' then
    Text := 'Exportado'
  else if Sender.AsString = 'P' then
    Text := 'Pendente';
end;

procedure TfrmOrcamentos.AjustaStatusBar;
begin
end;

procedure TfrmOrcamentos.miReabrirClick(Sender: TObject);
begin
  if cdsOrcam.IsEmpty then
    Exit;

  if qOrcam.FieldByname('CONCLUIDO').AsString = 'N' then
  begin
    MsgAviso('Orcamento nao concluido.');
    Exit;
  end;

  if MsgSN('Reabrir este orcamento?') then
  begin
    qOrcam.Edit;
    qOrcam.FieldByname('CONCLUIDO').AsString := 'N';
    qOrcam.ApplyUpdates;
    MsgAviso('Orcamento reaberto com sucesso!');
  end;
end;

procedure TfrmOrcamentos.miCadastraClienteClick(Sender: TObject);
begin
  ChamaForm('TfrmCliente', 'Cadastro de clientes', Self);
end;

procedure TfrmOrcamentos.miCadastrarvendedorClick(Sender: TObject);
begin
  ChamaForm('TfrmVendedor', 'Vendedores', Self);
end;

procedure TfrmOrcamentos.miCadastrarprodutoClick(Sender: TObject);
begin
  ChamaForm('TfrmProduto', 'Cadastro de produtos', Self);
end;

initialization
  RegisterClass(TfrmOrcamentos);
finalization
  UnRegisterClass(TfrmOrcamentos);
end.

