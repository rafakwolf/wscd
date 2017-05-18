 unit unVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, Mask, DBCtrls, ComCtrls,
  Menus, ExtCtrls, Db, DBClient,
   ConstPadrao, Datasnap.Provider,
  Data.SqlExpr, FMTBcd, unPadrao, System.Actions, Vcl.ActnList;

type
  TfrmVendas = class(TfrmPadrao)
    mnVenda: TMainMenu;
    miRegistros: TMenuItem;
    miIncluir: TMenuItem;
    miAlterar: TMenuItem;
    miCancelar: TMenuItem;
    miFerramentas: TMenuItem;
    miLocalizar: TMenuItem;
    miOutrosFiltros: TMenuItem;
    miFiltrarData: TMenuItem;
    miFiltrarCli: TMenuItem;
    miMostrarTodos: TMenuItem;
    N5: TMenuItem;
    miRelatorio: TMenuItem;
    miRelVendaAtual: TMenuItem;
    LabelObs: TLabel;
    lbNumero: TLabel;
    dbeNumero: TDBEdit;
    grdItens: TDBGrid;
    dbConcluida: TDBEdit;
    LabelConcluida: TLabel;
    N6: TMenuItem;
    miRelVendaMes: TMenuItem;
    miRelVendaAno: TMenuItem;
    miRelVendaPeriodo: TMenuItem;
    N7: TMenuItem;
    miRelVendaCliente: TMenuItem;
    miRelComissaoVendedor: TMenuItem;
    miVendasNaoConc: TMenuItem;
    sqldClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    sqldProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    sqldSelecao: TSQLDataSet;
    dspSelecao: TDataSetProvider;
    cdsSelecao: TClientDataSet;
    dbProduto: TDBEdit;
    dsSelecao: TDataSource;
    dbQtde: TDBEdit;
    dbCusto: TDBEdit;
    dbVenda: TDBEdit;
    dbDescto: TDBEdit;
    dbValorDescto: TDBEdit;
    dbTotalProduto: TDBEdit;
    btnInsereProduto: TBitBtn;
    dbCodCliente: TDBEdit;
    sqlVendas: TSQLQuery;
    sqlItens: TSQLQuery;
    dsLigaVenda: TDataSource;
    dtVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    cdsItens: TClientDataSet;
    dsVendas: TDataSource;
    dsItens: TDataSource;
    cdsVendasCODIGO: TIntegerField;
    cdsVendasCODCLIENTE: TIntegerField;
    cdsVendasCLIENTE: TStringField;
    cdsVendasDATA: TDateField;
    cdsVendasOBS: TStringField;
    cdsVendasCONCLUIDA: TStringField;
    cdsVendasBAIXADO: TStringField;
    cdsVendassqlItens: TDataSetField;
    cdsItensCODIGO: TIntegerField;
    cdsItensCODPRODUTO: TIntegerField;
    cdsItensPRODUTO: TStringField;
    dbdDataVenda: TDBEdit;
    N10: TMenuItem;
    miVendaBobina: TMenuItem;
    dbmObs: TDBMemo;
    pnlTotal: TPanel;
    lbTotalDesc: TLabel;
    dbeTotalDesc: TDBEdit;
    lbTotal: TLabel;
    dbeTotal: TDBEdit;
    dbeIdVendedor: TDBEdit;
    dbeVendedor: TDBEdit;
    dbeCliente: TDBEdit;
    bvlLinha: TBevel;
    cdsVendasIDVENDEDOR: TIntegerField;
    cdsVendasVENDEDOR: TStringField;
    sqldVendedor: TSQLDataSet;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    sqldVendedorIDVENDEDOR: TIntegerField;
    sqldVendedorVENDEDOR: TStringField;
    sqldVendedorATIVO: TStringField;
    cdsVendedorIDVENDEDOR: TIntegerField;
    cdsVendedorVENDEDOR: TStringField;
    cdsVendedorATIVO: TStringField;
    spDeleta: TSQLDataSet;
    dbeCancelada: TDBEdit;
    N11: TMenuItem;
    miCadastroCliente: TMenuItem;
    dbeComissao: TDBEdit;
    N12: TMenuItem;
    sqldClientesCODCLIENTE: TIntegerField;
    sqldClientesNOME: TStringField;
    sqldClientesTELEFONE: TStringField;
    sqldClientesRG_IE: TStringField;
    sqldClientesCPF_CNPJ: TStringField;
    sqldClientesDATA_NASC: TDateField;
    sqldClientesDESCRICAO: TStringField;
    cdsClientesCODCLIENTE: TIntegerField;
    cdsClientesNOME: TStringField;
    cdsClientesTELEFONE: TStringField;
    cdsClientesRG_IE: TStringField;
    cdsClientesCPF_CNPJ: TStringField;
    cdsClientesDATA_NASC: TDateField;
    cdsClientesDESCRICAO: TStringField;
    sqlVendasCODIGO: TIntegerField;
    sqlVendasCODCLIENTE: TIntegerField;
    sqlVendasCLIENTE: TStringField;
    sqlVendasIDVENDEDOR: TIntegerField;
    sqlVendasVENDEDOR: TStringField;
    sqlVendasDATA: TDateField;
    sqlVendasOBS: TStringField;
    sqlVendasTOTALDESCTO: TFMTBCDField;
    sqlVendasTOTAL: TFMTBCDField;
    sqlVendasCONCLUIDA: TStringField;
    sqlVendasBAIXADO: TStringField;
    sqlItensCODIGO: TIntegerField;
    sqlItensCODPRODUTO: TIntegerField;
    sqlItensPRODUTO: TStringField;
    sqlItensQTD: TIntegerField;
    sqlItensCUSTO: TFMTBCDField;
    sqlItensVENDA: TFMTBCDField;
    sqlItensDESCTO: TFMTBCDField;
    sqlItensVALORDESCTO: TFMTBCDField;
    sqlItensTOTAL: TFMTBCDField;
    sqlItensCOMISSAO: TFMTBCDField;
    sqlItensVALORCOMISSAO: TFMTBCDField;
    cdsVendasTOTALDESCTO: TFMTBCDField;
    cdsVendasTOTAL: TFMTBCDField;
    cdsItensQTD: TIntegerField;
    cdsItensCUSTO: TFMTBCDField;
    cdsItensVENDA: TFMTBCDField;
    cdsItensDESCTO: TFMTBCDField;
    cdsItensVALORDESCTO: TFMTBCDField;
    cdsItensTOTAL: TFMTBCDField;
    cdsItensCOMISSAO: TFMTBCDField;
    cdsItensVALORCOMISSAO: TFMTBCDField;
    sqldProdutosIDPRODUTO: TIntegerField;
    sqldProdutosCODBARRA: TStringField;
    sqldProdutosDESCRICAO: TStringField;
    sqldProdutosABREVIACAO: TStringField;
    sqldProdutosPRECO_PROMOCAO: TFMTBCDField;
    sqldProdutosCUSTO: TFMTBCDField;
    sqldProdutosLUCRO: TFMTBCDField;
    sqldProdutosVENDA: TFMTBCDField;
    sqldProdutosESTOQUE: TIntegerField;
    sqldProdutosESTOQUEMINIMO: TIntegerField;
    sqldProdutosPROMOCAO: TStringField;
    cdsProdutosIDPRODUTO: TIntegerField;
    cdsProdutosCODBARRA: TStringField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosABREVIACAO: TStringField;
    cdsProdutosPRECO_PROMOCAO: TFMTBCDField;
    cdsProdutosCUSTO: TFMTBCDField;
    cdsProdutosLUCRO: TFMTBCDField;
    cdsProdutosVENDA: TFMTBCDField;
    cdsProdutosESTOQUE: TIntegerField;
    cdsProdutosESTOQUEMINIMO: TIntegerField;
    cdsProdutosPROMOCAO: TStringField;
    spEstorna: TSQLDataSet;
    spBaixa: TSQLDataSet;
    sqlVendasCANCELADO: TStringField;
    cdsVendasCANCELADO: TStringField;
    miCadastravendedor: TMenuItem;
    miCadastraproduto: TMenuItem;
    sqldSelecaoPRODUTO: TIntegerField;
    sqldSelecaoNOMEPRODUTO: TStringField;
    sqldSelecaoQTDE: TSingleField;
    sqldSelecaoCUSTO: TSingleField;
    sqldSelecaoVENDA: TSingleField;
    sqldSelecaoDESCTO: TSingleField;
    sqldSelecaoVALORDESCTO: TSingleField;
    sqldSelecaoTOTAL: TSingleField;
    sqldSelecaoCOMISSAO: TSingleField;
    cdsSelecaoPRODUTO: TIntegerField;
    cdsSelecaoNOMEPRODUTO: TStringField;
    cdsSelecaoQTDE: TSingleField;
    cdsSelecaoCUSTO: TSingleField;
    cdsSelecaoVENDA: TSingleField;
    cdsSelecaoDESCTO: TSingleField;
    cdsSelecaoVALORDESCTO: TSingleField;
    cdsSelecaoTOTAL: TSingleField;
    cdsSelecaoCOMISSAO: TSingleField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure miConcluirClick(Sender: TObject);
    procedure miAplicarDescClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure miMostrarTodosClick(Sender: TObject);
    procedure miContarClick(Sender: TObject);
    procedure miImportarOrcamentoClick(Sender: TObject);
    procedure miFiltrarDataClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miFiltrarCliClick(Sender: TObject);
    procedure miRelVendaClienteClick(Sender: TObject);
    procedure grdItensDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbProdutoClickButton(Sender: TObject);
    procedure dbCodClienteClickButton(Sender: TObject);
    procedure btnInsereProdutoClick(Sender: TObject);
    procedure cdsSelecaoAfterPost(DataSet: TDataSet);
    procedure dbVendaExit(Sender: TObject);
    procedure dbDesctoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbCustoKeyPress(Sender: TObject; var Key: Char);
    procedure dbVendaKeyPress(Sender: TObject; var Key: Char);
    procedure dbDesctoKeyPress(Sender: TObject; var Key: Char);
    procedure dbValorDesctoKeyPress(Sender: TObject; var Key: Char);
    procedure dbTotalProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure cdsVendasAfterInsert(DataSet: TDataSet);
    procedure cdsVendasCODCLIENTEValidate(Sender: TField);
    procedure cdsItensCODPRODUTOValidate(Sender: TField);
    procedure cdsItensBeforePost(DataSet: TDataSet);
    procedure cdsItensBeforeDelete(DataSet: TDataSet);
    procedure cdsSelecaoPRODUTOValidate(Sender: TField);
    procedure miRecebimentoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure miVendaBobinaClick(Sender: TObject);
    procedure dbeIdVendedorClickButton(Sender: TObject);
    procedure cdsVendasIDVENDEDORValidate(Sender: TField);
    procedure miCadastroClienteClick(Sender: TObject);
    procedure miRelComissaoVendedorClick(Sender: TObject);
    procedure miRelVendaAtualClick(Sender: TObject);
    procedure miVendasNaoConcClick(Sender: TObject);
    procedure miEstornarClick(Sender: TObject);
    procedure miReabrirClick(Sender: TObject);
    procedure miCadastravendedorClick(Sender: TObject);
    procedure miCadastraprodutoClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    procedure ReceberVenda;
    procedure BaixarEstoque;
    procedure InsereProduto;
    procedure TotaisDetalhe;

    function CamposNulos: Boolean;
  protected
    procedure VendaConcluida(var Msg: TMessage); message WM_VENDA_CONCLUIDA;
  public
    SQLPadraoTela: string;
  end;

var
  frmVendas: TfrmVendas;

implementation

uses Funcoes, unModeloConsulta, VarGlobal, unPagamentoVenda,
     unImportaOrcam, unFiltroSimples,  unPagamentoCheque,
     unParcelaVenda, unRelatorioBobinaVenda, unPrevNotaVenda,
     unPrevNotaVendaMatric, unAguarde, unDmPrincipal, udatabaseutils,
  System.Math;

{$R *.dfm}

procedure TfrmVendas.BaixarEstoque;
begin
  if cdsVendasBAIXADO.AsString = 'N' then
  begin
    spBaixa.Close;
    spBaixa.Params.ParamByName('CODIGO').AsInteger := cdsVendasCODIGO.AsInteger;
    spBaixa.ExecSQL;
  end;  
end;

procedure TfrmVendas.btnNovoClick(Sender: TObject);
begin
  cdsVendas.Append;
  cdsVendasCONCLUIDA.AsString  := 'N';
  cdsVendasBAIXADO.AsString    := 'N';
  cdsVendasCANCELADO.AsString  := 'N';
  cdsVendasDATA.AsDateTime     := Date;
  cdsVendasTOTALDESCTO.AsFloat := 0;
  cdsVendasTOTAL.AsFloat       := 0;
  SetFocusIfcan(dbeIdVendedor);
end;

procedure TfrmVendas.btnCancelClick(Sender: TObject);
begin
  cdsVendas.CancelUpdates;
  cdsSelecao.CancelUpdates;
end;

procedure TfrmVendas.btnPrimeiroClick(Sender: TObject);
begin
//  Primeiro(cdsVendas);
cdsVendas.First;
end;

procedure TfrmVendas.btnAnteriorClick(Sender: TObject);
begin
  //Anterior(cdsVendas);
  cdsVendas.Prior;
end;

procedure TfrmVendas.btnProximoClick(Sender: TObject);
begin
  //Proximo(cdsVendas);
  cdsVendas.Next;
end;

procedure TfrmVendas.btnUltimoClick(Sender: TObject);
begin
  //Ultimo(cdsVendas);
  cdsVendas.Last;
end;

procedure TfrmVendas.FormShow(Sender: TObject);
var
  NumRegs: Integer;
begin
  try
    TfrmAguarde.Execute('Preparando dados...');
    cdsSelecao.Open;
    cdsProdutos.Open;
    cdsClientes.Open;
    cdsVendas.Open;
    
    if Configuracao.VendaConcluida then
    begin
      NumRegs :=
        SelectSingleField('select count(1) NUM from VENDA where CONCLUIDA = '+
          QuotedStr('N')+' and CANCELADO = '+QuotedStr('N'), GetConnection);

        if (NumRegs > 0) then
        begin
          frmAguarde.Fecha;
          if MsgSn('Existe(m) ' + IntToStr(NumRegs) +
            ' Vendas(s) não concluída(s). Por favor verifique, pois estas podem' +
            ' causar inconsistências no banco de dados, e no controle de estoque.'+#13#10+
            'Deseja exibir somente as vendas não concluídas agora?') then
          begin
            cdsVendas.Filtered := False;
            cdsVendas.Filter := '(CONCLUIDA = '+QuotedStr('N')+') and (CANCELADO = '+QuotedStr('N')+')';
            cdsVendas.Filtered := True;
          end;
        end;
    end;
    SQLPadraoTela := sqlVendas.SQL.GetText;
  finally
    if frmAguarde.Visible then
      frmAguarde.Fecha;
  end;
end;

procedure TfrmVendas.btnExcluirClick(Sender: TObject);
begin
  if cdsVendas.IsEmpty then
    Exit;

  { cancelada }
  if cdsVendasCANCELADO.AsString = 'S' then
  begin
    MsgErro('Venda já cancelada.');
    Exit;
  end;

  if MsgSN('Deseja realmente cancelar esta venda?') then
  begin
    cdsVendas.Edit;
    cdsVendasCONCLUIDA.AsString := 'N';
    cdsVendas.ApplyUpdates(0);
    
    spDeleta.Close;
    spDeleta.Params.ParamByName('CODIGO').AsInteger := cdsVendasCODIGO.AsInteger;
    spDeleta.ExecSQL;

    ReabreDataSet(cdsVendas);
  end;
end;

procedure TfrmVendas.miConcluirClick(Sender: TObject);
begin
  BaixarEstoque;
  ReceberVenda;
end;

procedure TfrmVendas.miAplicarDescClick(Sender: TObject);
var
  Percent, Valor: Real;
begin
  Percent := 0;
  if (cdsVendasCONCLUIDA.AsString = 'N') then
  begin
    if (ObterValor(Percent,'','')) then
    if (Percent <> 0) then
    begin
      Valor := cdsVendasTOTAL.AsFloat * (Percent / 100);
      cdsVendas.Edit;
      cdsVendasTOTAL.AsFloat := (cdsVendasTOTAL.AsFloat - Valor);
      cdsVendas.ApplyUpdates(0);
    end
    else
      MsgErro('Informe a valor do desconto.');
  end
  else
    MsgAviso('Venda já está concluída.');
end;

procedure TfrmVendas.btnConsultarClick(Sender: TObject);
var
  S: String;
begin
  S := '0';
  if InputQuery('Localizar por número', 'Número da venda', S) and (S <> '0') then
  begin
    cdsVendas.IndexFieldNames := 'CODIGO';

    if not cdsVendas.Locate('CODIGO', S, []) then
      MsgAviso(S + ' não encontrado');
  end;
end;

procedure TfrmVendas.miMostrarTodosClick(Sender: TObject);
begin
  try
    cdsVendas.DisableControls;
    cdsVendas.Close;
    cdsVendas.Filtered := False;
    cdsVendas.CommandText := SQLPadraoTela;
    cdsVendas.Open;
  finally
    cdsVendas.EnableControls;
  end;
end;

procedure TfrmVendas.miContarClick(Sender: TObject);
begin
  //Ed_Quantificar(cdsVendas, frmVendas);
end;

procedure TfrmVendas.miImportarOrcamentoClick(Sender: TObject);
begin
  ChamaForm('TfrmImportaOrcam', 'Importar orçamento', Self);
  miMostrarTodos.Click;
end;

procedure TfrmVendas.miFiltrarDataClick(Sender: TObject);
var
  dtI, dtF: String;
begin
  if ObterDatas(dtI, dtF) then
  begin
    if (ClearMask(dtI) <> '') and (ClearMask(dtF) <> '') then
    begin
      cdsVendas.Close;
      cdsVendas.Filtered := False;
      cdsVendas.Filter := 'DATA >= ' + QuotedStr(dtI) + ' AND DATA <= ' + QuotedStr(dtF);
      cdsVendas.Filtered := True;
      cdsVendas.Open;

      if cdsVendas.IsEmpty then
      begin
        MsgCuidado(UM_PESQUISAVAZIO);
        cdsVendas.Filtered := False;
      end;
    end
    else
      MsgErro(UM_DATAINVALIDA);
  end;
end;

procedure TfrmVendas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  UpdatesPending(cdsVendas, Self);
end;

procedure TfrmVendas.miFiltrarCliClick(Sender: TObject);
var
  IdRetorno: Integer;
  Order, SQL: string;
begin
  SQL := '';
  SQL := AnsiUpperCase(SQLPadraoTela);
  Order := Copy(SQL, Pos('ORDER', SQL), Length(SQL));
  Delete(SQL, Pos('ORDER', SQL), Length(SQL));

  if TfrmFiltroSimples.Execute(IdRetorno, 'CLIENTES', 'NOME', 'CODCLIENTE') then
  begin
    cdsVendas.DisableControls;
    cdsVendas.Close;
    cdsVendas.CommandText := '';
    cdsVendas.CommandText := SQL + ' where ven.CODCLIENTE = ' +
      QuotedStr(IntToStr(IdRetorno))+' order by ven.CODCLIENTE';

    cdsVendas.Open;
    cdsVendas.EnableControls;
  end;
end;

procedure TfrmVendas.miRelVendaClienteClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioVendaCliente', 'Vendas por cliente', Self);
end;

procedure TfrmVendas.grdItensDblClick(Sender: TObject);
begin
  if cdsVendas.State in [dsEdit, dsInsert] then
    if MsgSN('Deseja realmente excluir (' + cdsItensPRODUTO.AsString + ') da listagem de produtos?') then
      cdsItens.Delete;
end;

procedure TfrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 51,'');
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsProdutos.Close;
  cdsClientes.Close;
  Action := caFree;
end;

function TfrmVendas.CamposNulos: Boolean;
begin
  Result :=
    (ValidaFieldsVazios([cdsVendasCODCLIENTE, cdsVendasDATA, cdsVendasIDVENDEDOR],
      ['Cliente', 'Data', 'Vendedor']) <> '');
  if Result then
  begin
    MsgAviso('Venda incompleta.');
    Abort;
  end;
end;

procedure TfrmVendas.InsereProduto;

  function ProdutoPromocao(IdProduto: Integer): Boolean;
  begin
    Result :=
      SQLFind('PROMOCAO', 'PRODUTO', IntToStr(IdProduto), sqlVendas.SQLConnection);
  end;

  function DescontoPromocao(IdProduto: Integer): Extended;
  begin
    Result :=
      SelectSingleField('select DESCONTO from PROMOCAO where PRODUTO = '+
        QuotedStr(IntToStr(IdProduto)), sqlVendas.SQLConnection);
  end;

  function PrecoPromocao(IdProduto: Integer): Extended;
  begin
    Result :=
      SelectSingleField('select PRECO from PROMOCAO where PRODUTO = '+
        QuotedStr(IntToStr(IdProduto)), sqlVendas.SQLConnection);
  end;

begin
  cdsSelecao.Edit;
  cdsSelecaoPRODUTO.AsInteger := cdsProdutosIDPRODUTO.AsInteger;
  cdsSelecaoQTDE.AsFloat      := 1;
  cdsSelecaoCUSTO.AsFloat     := StrToFloatDef(FormatFloat('#,##0.00', cdsProdutosCUSTO.AsFloat), 0);

  if not ProdutoPromocao(cdsSelecaoPRODUTO.AsInteger) then
  begin
    cdsSelecaoVENDA.AsFloat     := StrToFloatDef(FormatFloat('#,##0.00', cdsProdutosVENDA.AsFloat), 0);
    cdsSelecaoDESCTO.AsFloat    := 0;
  end
  else
  begin
    cdsSelecaoVENDA.AsFloat     :=
      StrToFloatDef(FormatFloat('#,##0.00', PrecoPromocao(cdsSelecaoPRODUTO.AsInteger)), 0);
    cdsSelecaoDESCTO.AsFloat    :=
      StrToFloatDef(FormatFloat('#,##0.00', DescontoPromocao(cdsSelecaoPRODUTO.AsInteger)), 0);
  end;

  cdsSelecaoCOMISSAO.AsFloat := 0;

  cdsSelecao.Post;
end;

procedure TfrmVendas.dbProdutoClickButton(Sender: TObject);
begin
//  if(cdsVendas.State in dsEditModes)then
//  begin
//    if TfrmModeloConsulta.Execute('Busca Produto', cdsProdutos, FN_PRODUTOS,DL_PRODUTOS) then
//    begin
//      if cdsProdutos.Locate('CODBARRA', cdsProdutosCODBARRA.AsString,[]) then
//      begin
//        if (not Configuracao.EstoqueVenda) then
//        begin
//          cdsProdutos.Open;
//          if (cdsProdutosESTOQUE.AsFloat > cdsProdutosESTOQUEMINIMO.AsFloat) then
//            InsereProduto
//          else
//          begin
//            MsgErro('Produto com estoque mínimo, não é possível inseri-lo.');
//            Exit;
//          end;
//        end
//        else
//          InsereProduto;
//      end;
//    end;
//  end;
end;

procedure TfrmVendas.dbCodClienteClickButton(Sender: TObject);
begin
//  if (cdsVendas.State in dsEditModes) then
//    if TfrmModeloConsulta.Execute('Busca Cliente', cdsClientes, FN_CLIENTES, DL_CLIENTES) then
//      cdsVendasCODCLIENTE.AsInteger := cdsClientesCODCLIENTE.AsInteger;
end;

procedure TfrmVendas.btnInsereProdutoClick(Sender: TObject);
begin
  if not cdsSelecaoPRODUTO.IsNull then
  begin
    if (cdsSelecao.Active) and (not cdsSelecao.IsEmpty) then
    begin
      cdsItens.Append;
      cdsItensCODPRODUTO.AsInteger := cdsSelecaoPRODUTO.AsInteger;
      cdsItensQTD.AsFloat          := cdsSelecaoQTDE.AsFloat;
      cdsItensCUSTO.AsFloat        := cdsSelecaoCUSTO.AsFloat;
      cdsItensVENDA.AsFloat        := cdsSelecaoVENDA.AsFloat;
      cdsItensDESCTO.AsFloat       := cdsSelecaoDESCTO.AsFloat;
      cdsItensVALORDESCTO.AsFloat  := cdsSelecaoVALORDESCTO.AsFloat;
      cdsItensTOTAL.AsFloat        := cdsSelecaoTOTAL.AsFloat;
      cdsItensCOMISSAO.AsFloat     := cdsSelecaoCOMISSAO.AsFloat;
      cdsItens.Post;

      cdsSelecao.Close;
      cdsSelecao.Open;
      SetFocusIfCan(dbProduto);

//      if MsgSN('Inserir novo produto?') then
//        dbProduto.OnClickButton(Sender);
    end
    else
      MsgAviso('Selecione um produto.');
  end;  
end;

procedure TfrmVendas.TotaisDetalhe;
begin
  cdsSelecao.Edit;
  cdsSelecaoTOTAL.AsFloat :=
    (cdsSelecaoQTDE.AsFloat * cdsSelecaoVENDA.AsFloat);

  cdsSelecaoVALORDESCTO.AsFloat :=
    (cdsSelecaoQTDE.AsFloat *
     cdsSelecaoVENDA.AsFloat *
     cdsSelecaoDESCTO.AsFloat / 100);
end;

procedure TfrmVendas.cdsSelecaoAfterPost(DataSet: TDataSet);
begin
  TotaisDetalhe;
end;

procedure TfrmVendas.dbVendaExit(Sender: TObject);
begin
  TotaisDetalhe;
end;

procedure TfrmVendas.dbDesctoExit(Sender: TObject);
begin
  TotaisDetalhe;
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  //FieldNames := FN_CLIENTES;
  //DisplayLabels := DL_CLIENTES;
  aCaption := 'Vendas';
  ClientHeight := 570;
  ClientWidth  := 890;
  inherited;
end;

procedure TfrmVendas.dbCustoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmVendas.dbVendaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmVendas.dbDesctoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmVendas.dbValorDesctoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmVendas.dbTotalProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmVendas.cdsVendasAfterInsert(DataSet: TDataSet);
begin
  //Incrementa('VENDA', cdsVendasCODIGO, GetConnection);
end;

procedure TfrmVendas.cdsVendasCODCLIENTEValidate(Sender: TField);
var
  NomeCliente: string;
begin
  inherited;
  NomeCliente := GetFieldByID(GetConnection, 'CLIENTES', 'NOME', 'CODCLIENTE',
    Sender.AsInteger);
  if NomeCliente <> '' then
    cdsVendasCLIENTE.AsString := NomeCliente;
end;

procedure TfrmVendas.cdsItensCODPRODUTOValidate(Sender: TField);
var
  NomeProd: string;
begin
  inherited;
  NomeProd := GetFieldByID(GetConnection, 'PRODUTOS', 'DESCRICAO', 'IDPRODUTO',
    Sender.AsInteger);
  if NomeProd <> '' then
    cdsItensPRODUTO.AsString := NomeProd;
end;

procedure TfrmVendas.cdsItensBeforePost(DataSet: TDataSet);
begin
  if (cdsVendas.State in [dsEdit, dsInsert]) then
  begin
    cdsVendasTOTAL.AsFloat := (cdsVendasTOTAL.AsFloat + cdsItensTOTAL.AsFloat);
    cdsVendasTOTALDESCTO.AsFloat :=
      (cdsVendasTOTALDESCTO.AsFloat + cdsItensVALORDESCTO.AsFloat);
    { calcula valor de comissão }
    cdsItensVALORCOMISSAO.AsFloat :=
      RoundTo((cdsItensTOTAL.AsFloat * cdsItensCOMISSAO.AsFloat)/100, 2);
  end;
end;

procedure TfrmVendas.cdsItensBeforeDelete(DataSet: TDataSet);
begin
  if cdsVendas.State in [dsEdit, dsInsert] then
  begin
    cdsVendasTOTAL.AsFloat := (cdsVendasTOTAL.AsFloat - cdsItensTOTAL.AsFloat);
    cdsVendasTOTALDESCTO.AsFloat :=
      (cdsVendasTOTALDESCTO.AsFloat - cdsItensVALORDESCTO.AsFloat);
  end;
end;

procedure TfrmVendas.cdsSelecaoPRODUTOValidate(Sender: TField);
var
  NomeProd: string;
begin
  inherited;
  NomeProd := GetFieldByID(GetConnection, 'PRODUTOS', 'DESCRICAO', 'IDPRODUTO',
    Sender.AsInteger);
  if NomeProd <> '' then
    cdsSelecaoNOMEPRODUTO.AsString := NomeProd;
end;

procedure TfrmVendas.VendaConcluida(var Msg: TMessage);
begin
  ReabreDataSet(cdsVendas);
end;

procedure TfrmVendas.miRecebimentoClick(Sender: TObject);
begin
  frmPagamentoVenda := TfrmPagamentoVenda.Create(Self);
  frmPagamentoVenda.IdVenda := cdsVendasCODIGO.AsInteger;
  frmPagamentoVenda.ShowModal;
end;

procedure TfrmVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl is TCustomMemo) or
            ((ActiveControl is TCustomCombo) and
             (TCustomCombo(ActiveControl).DroppedDown)) then
    begin
      Key := #0;
      Exit;
    end
    else if not (ActiveControl is TDBGrid) then
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

procedure TfrmVendas.miVendaBobinaClick(Sender: TObject);
begin
  frmRelatorioBobinaVenda := TfrmRelatorioBobinaVenda.Create(Self);
  frmRelatorioBobinaVenda.IdVenda := cdsVendasCODIGO.AsInteger;
  frmRelatorioBobinaVenda.Caption := 'Venda em bobina';
  frmRelatorioBobinaVenda.ShowModal;
end;

procedure TfrmVendas.actEditExecute(Sender: TObject);
begin
  if cdsVendasCONCLUIDA.AsString = 'S' then
  begin
    if Configuracao.EditarVenda then
      inherited
    else
      MsgAviso('Sem permissão para editar ésta venda.');
  end
  else
    inherited;
end;


procedure TfrmVendas.dbeIdVendedorClickButton(Sender: TObject);
begin
//  if ModoInsertEdit(cdsVendas) then
//    if TfrmModeloConsulta.Execute('Vendedor', cdsVendedor, FN_VENDEDOR, DL_VENDEDOR) then
//      cdsVendasIDVENDEDOR.AsInteger := cdsVendedorIDVENDEDOR.AsInteger;
end;

procedure TfrmVendas.cdsVendasIDVENDEDORValidate(Sender: TField);
var
  NomeVend: string;
begin
  inherited;
  NomeVend := GetFieldByID(GetConnection, 'VENDEDOR', 'VENDEDOR', 'IDVENDEDOR',
    Sender.AsInteger);
  if NomeVend <> '' then
    cdsVendasVENDEDOR.AsString := NomeVend;
end;

procedure TfrmVendas.miCadastroClienteClick(Sender: TObject);
begin
  ChamaForm('TfrmCliente', 'Cadastro de clientes', Self);
end;

procedure TfrmVendas.miRelComissaoVendedorClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioComissaoVenda', 'Comissão de vendedor', Self);
end;

procedure TfrmVendas.miRelVendaAtualClick(Sender: TObject);
begin
  case FormRadioButtons('Impressora Jato/Lazer, Impressora matricial', 'Impressão da venda', 0) of
  0:begin
      with TfrmPrevNotaVenda.Create(Self) do
      try
        cdsVenda.Close;
        cdsVenda.Params.ParamByName('IDVENDA').AsInteger := cdsVendasCODIGO.AsInteger;
        cdsVenda.Open;
        rlrNotaVenda.PreviewModal;
      finally
        Free;
      end;
    end;
  1:begin
      with TfrmPrevNotaVendaMatric.Create(Self) do
      try
        IdVenda := cdsVendasCODIGO.AsInteger;
        ImprimirVDO;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmVendas.miVendasNaoConcClick(Sender: TObject);
begin
  ChamaForm('TfrmVendaNaoConc', 'Vendas não concluídas', Self);
end;

procedure TfrmVendas.ReceberVenda;

  procedure ConcluirVenda(FormaRecto: string; ValorRecdo: Currency);
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := GetConnection;
      CommandType := ctStoredProc;
      CommandText := 'STPRECTOVENDA';
      Params.ParamByName('IDVENDA').AsInteger     := cdsVendasCODIGO.AsInteger;
      Params.ParamByName('DATARECTO').AsDate      := Date;
      Params.ParamByName('FORMARECTO').AsString   := Trim(FormaRecto);
      Params.ParamByName('VALORRECDO').AsFMTBCD   := DoubleToBcd(ValorRecdo);
      ExecSQL;
    finally
      ReabreDataSet(cdsVendas);
      Free;
    end;
  end;

  function Restante: Real;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := GetConnection;
      CommandText := 'select RESTO from STPRESTOVENDA(:VENDA)';
      Params.ParamByName('VENDA').AsInteger := cdsVendasCODIGO.AsInteger;
      Open;
      Result := RoundTo(FieldByName('RESTO').AsFloat, 2);
    finally
      Free;
    end;
  end;

var
  FormaRecto: Integer;
  ValorDinheiro: Real;
begin

  if (cdsVendasCONCLUIDA.AsString = 'N') then
  begin

    FormaRecto :=
      FormRadioButtons('&1 - Dinheiro, &2 - Cheque a Vista, &3 - Cheque Pré-datado, &4 - Crediário', 'Forma de recebimento');

    case FormaRecto of
      0: {dinheiro}
      begin
        if ObterValor(ValorDinheiro, '0', 'Total/Resto') then
        begin

          if RoundTo(ValorDinheiro, 2) > RoundTo(Restante, 2) then
          begin
            MsgErro('Valor digitado é maior que o restante a receber, digite novamente.');
            Exit;
          end;

          if ValorDinheiro = 0 then
          begin
            MsgErro('Valor digitado é inválido, digite novamente.');
            Exit;
          end;

          if GetDataModule.EnviaCaixa(Date, 'Venda Nro: '+IntToStr(cdsVendasCODIGO.AsInteger),
            'V'+IntToStr(cdsVendasCODIGO.AsInteger), 'C', ValorDinheiro) then
            ConcluirVenda('Dinheiro', ValorDinheiro)
          else
            MsgAviso('Venda não foi concluída.');

        end;
      end;
      1: {cheque a vista}
      begin
        frmPagamentoCheque := TfrmPagamentoCheque.Create(Self);
        frmPagamentoCheque.TipoCheque := tcAVista;
        frmPagamentoCheque.IdVenda := cdsVendasCODIGO.AsInteger;
        frmPagamentoCheque.TipoChamada := tcmVenda;
        if frmPagamentoCheque.ShowModal <> mrOk then
          MsgAviso('Venda não foi concluída.');
      end;
      2: {cheque pre-datado}
      begin
        frmPagamentoCheque := TfrmPagamentoCheque.Create(Self);
        frmPagamentoCheque.TipoCheque := tcPreDatado;
        frmPagamentoCheque.IdVenda := cdsVendasCODIGO.AsInteger;
        frmPagamentoCheque.TipoChamada := tcmVenda;
        if frmPagamentoCheque.ShowModal <> mrOk then
          MsgAviso('Venda não foi concluída.');
      end;
      3: {parcelamento}
      begin
        frmParcelaVenda := TfrmParcelaVenda.Create(Self);
        frmParcelaVenda.IdVenda := cdsVendasCODIGO.AsInteger;
        if frmParcelaVenda.ShowModal <> mrOk then
          MsgAviso('Venda não foi concluída.');
      end;
    end;
  end
  else
    MsgAviso('Venda já foi concluída.');
end;

procedure TfrmVendas.miEstornarClick(Sender: TObject);
begin
  if cdsVendas.IsEmpty then
    Exit;

  if cdsVendasCONCLUIDA.AsString = 'N' then
  begin
    MsgAviso('Venda não concluída.');
    Exit;
  end;

  if MsgSN('Deseja realmente estornar ésta venda?') then
  begin
    spEstorna.Close;
    spEstorna.Params.ParamByName('CODIGO').AsInteger := cdsVendasCODIGO.AsInteger;
    spEstorna.ExecSQL;
    PostMessage(Handle, WM_VENDA_CONCLUIDA, 0, 0);
    MsgAviso('Venda estornada!');
  end;
end;

procedure TfrmVendas.miReabrirClick(Sender: TObject);
begin
  cdsVendas.Edit;
  cdsVendasCANCELADO.AsString := 'N';
  cdsVendas.ApplyUpdates(0);
  ReabreDataSet(cdsVendas);
  MsgAviso('Venda reaberta!');
end;

procedure TfrmVendas.miCadastravendedorClick(Sender: TObject);
begin
  ChamaForm('TfrmVendedor', 'Vendedores', Self);
end;

procedure TfrmVendas.miCadastraprodutoClick(Sender: TObject);
begin
  ChamaForm('TfrmProduto', 'Cadastro de produtos', Self);
end;

initialization
  RegisterClass(TfrmVendas);
finalization
  UnRegisterClass(TfrmVendas);
end.
