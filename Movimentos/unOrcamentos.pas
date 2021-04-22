unit unOrcamentos;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, DB,  Grids, DBGrids, Buttons,
  SqlDb, Menus, ComCtrls, memds,  
   ConstPadrao, FMTBcd, uniMainMenu,  
     uniStatusBar, uniPanel, uniLabel,
  uniEdit, uniDBEdit, uniMemo, uniDBMemo, uniBasicGrid, uniDBGrid;

type
  TfrmOrcamentos = class(TForm)
    dtOrcam: TComponent;
    cdsOrcam: TMemDataSet;
    cdsDetOrcam: TMemDataSet;
    dsLink: TDataSource;
    sqlOrcam: TSQLQuery;
    sqlDetOrcam: TSQLQuery;
    sqlProdutos: TSQLQuery;
    dspProdutos: TComponent;
    cdsProdutos: TMemDataSet;
    sqldSelecao: TSQLQuery;
    dspSelecao: TComponent;
    cdsSelecao: TMemDataSet;
    dsSelecao: TDataSource;
    sqldCliente: TSQLQuery;
    dspCliente: TComponent;
    cdsCliente: TMemDataSet;
    cdsOrcamCODIGO: TIntegerField;
    cdsOrcamCODCLIENTE: TIntegerField;
    cdsOrcamNOMECLIENTE: TStringField;
    cdsOrcamDATA: TDateField;
    cdsOrcamOBS: TStringField;
    cdsOrcamSTATUS: TStringField;
    cdsOrcamCONCLUIDO: TStringField;
    cdsOrcamsqlDetOrcam: TDataSetField;
    dsOrcam: TDataSource;
    dsDetOrcam: TDataSource;
    sqldVendedor: TSQLQuery;
    dspVendedor: TComponent;
    cdsVendedor: TMemDataSet;
    sqldVendedorIDVENDEDOR: TIntegerField;
    sqldVendedorVENDEDOR: TStringField;
    sqldVendedorATIVO: TStringField;
    cdsVendedorIDVENDEDOR: TIntegerField;
    cdsVendedorVENDEDOR: TStringField;
    cdsVendedorATIVO: TStringField;
    cdsOrcamIDVENDEDOR: TIntegerField;
    cdsOrcamVENDEDOR: TStringField;
    spDeleta: TSQLQuery;
    sqldClienteCODCLIENTE: TIntegerField;
    sqldClienteNOME: TStringField;
    sqldClienteTELEFONE: TStringField;
    sqldClienteRG_IE: TStringField;
    sqldClienteCPF_CNPJ: TStringField;
    sqldClienteDATA_NASC: TDateField;
    sqldClienteLIMITE: TFMTBCDField;
    sqldClienteDESCRICAO: TStringField;
    cdsClienteCODCLIENTE: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteRG_IE: TStringField;
    cdsClienteCPF_CNPJ: TStringField;
    cdsClienteDATA_NASC: TDateField;
    cdsClienteLIMITE: TFMTBCDField;
    cdsClienteDESCRICAO: TStringField;
    sqlOrcamCODIGO: TIntegerField;
    sqlOrcamCODCLIENTE: TIntegerField;
    sqlOrcamNOMECLIENTE: TStringField;
    sqlOrcamIDVENDEDOR: TIntegerField;
    sqlOrcamVENDEDOR: TStringField;
    sqlOrcamDATA: TDateField;
    sqlOrcamOBS: TStringField;
    sqlOrcamTOTAL: TFMTBCDField;
    sqlOrcamITENS: TIntegerField;
    sqlOrcamSTATUS: TStringField;
    sqlOrcamCONCLUIDO: TStringField;
    sqlDetOrcamCODIGO: TIntegerField;
    sqlDetOrcamCODPRODUTO: TIntegerField;
    sqlDetOrcamNOMEPRODUTO: TStringField;
    sqlDetOrcamQTDE: TIntegerField;
    sqlDetOrcamCUSTO: TFMTBCDField;
    sqlDetOrcamVENDA: TFMTBCDField;
    sqlDetOrcamDESCTO: TFMTBCDField;
    sqlDetOrcamVALORDESCTO: TFMTBCDField;
    sqlDetOrcamTOTAL: TFMTBCDField;
    cdsOrcamTOTAL: TFMTBCDField;
    cdsOrcamITENS: TIntegerField;
    cdsDetOrcamCODIGO: TIntegerField;
    cdsDetOrcamCODPRODUTO: TIntegerField;
    cdsDetOrcamNOMEPRODUTO: TStringField;
    cdsDetOrcamQTDE: TIntegerField;
    cdsDetOrcamCUSTO: TFMTBCDField;
    cdsDetOrcamVENDA: TFMTBCDField;
    cdsDetOrcamDESCTO: TFMTBCDField;
    cdsDetOrcamVALORDESCTO: TFMTBCDField;
    cdsDetOrcamTOTAL: TFMTBCDField;
    sqlProdutosIDPRODUTO: TIntegerField;
    sqlProdutosCODBARRA: TStringField;
    sqlProdutosDESCRICAO: TStringField;
    sqlProdutosABREVIACAO: TStringField;
    sqlProdutosPRECO_PROMOCAO: TFMTBCDField;
    sqlProdutosCUSTO: TFMTBCDField;
    sqlProdutosLUCRO: TFMTBCDField;
    sqlProdutosVENDA: TFMTBCDField;
    sqlProdutosESTOQUE: TIntegerField;
    sqlProdutosESTOQUEMINIMO: TIntegerField;
    sqlProdutosPROMOCAO: TStringField;
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
    sqldSelecaoPRODUTO: TIntegerField;
    sqldSelecaoNOMEPRODUTO: TStringField;
    sqldSelecaoQTDE: TIntegerField;
    sqldSelecaoCUSTO: TSingleField;
    sqldSelecaoVENDA: TSingleField;
    sqldSelecaoDESCTO: TSingleField;
    sqldSelecaoVALORDESCTO: TSingleField;
    sqldSelecaoTOTAL: TSingleField;
    cdsSelecaoPRODUTO: TIntegerField;
    cdsSelecaoNOMEPRODUTO: TStringField;
    cdsSelecaoQTDE: TIntegerField;
    cdsSelecaoCUSTO: TSingleField;
    cdsSelecaoVENDA: TSingleField;
    cdsSelecaoDESCTO: TSingleField;
    cdsSelecaoVALORDESCTO: TSingleField;
    cdsSelecaoTOTAL: TSingleField;
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
    pnBotoes: TContainerPanel;
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
    pnlTotal: TContainerPanel;
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
    dbProduto: TDBEdit;
    dbQtde: TDBEdit;
    dbCusto: TDBEdit;
    dbVenda: TDBEdit;
    dbDescto: TDBEdit;
    dbValorDescto: TDBEdit;
    dbTotalItem: TDBEdit;
    dbdDataOrcam: TDBEdit;
    dbeIdVendedor: TDBEdit;
    dbeVendedor: TDBEdit;
    dbeItens: TDBEdit;
    dbeTotal: TDBEdit;
    bvlLinha: TPanel;
    dbmObs: TDBMemo;
    grdItens: TDBGrid;
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
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
     uDatabaseutils;

{$R *.dfm}

procedure TfrmOrcamentos.btnNovoClick(Sender: TObject);
begin
  cdsOrcam.Append;
  cdsOrcamDATA.AsDateTime := Date;
  cdsOrcamSTATUS.AsString := 'P';
  cdsOrcamCONCLUIDO.AsString := 'N';
  cdsOrcamTOTAL.AsFloat := 0;
  SetFocusIfCan(dbeIdVendedor);
end;

procedure TfrmOrcamentos.btnExcluirClick(Sender: TObject);
begin
  if cdsOrcam.IsEmpty then Exit;
  if MsgSN('Deseja realmente excluir?') then
  begin
    with spDeleta do
    try
      Close;
      Params.ParamByName('CODIGO').AsInteger := cdsOrcamCODIGO.AsInteger;
      ExecSQL;
    finally
      cdsOrcam.Close;
      cdsOrcam.Open;
    end;
  end;
end;

procedure TfrmOrcamentos.btnCancelClick(Sender: TObject);
begin
  cdsOrcam.CancelUpdates;
  cdsSelecao.CancelUpdates;
end;

procedure TfrmOrcamentos.grdItensDblClick(Sender: TObject);
begin
  if cdsOrcam.State in [dsEdit, dsInsert] then
  begin
    if MsgSN('Deseja realmente excluir ' + #13#10 +
      '(' + cdsDetOrcamNOMEPRODUTO.AsString + ')' + #13#10 +
      'da listagem de produtos?') then
      cdsDetOrcam.Delete;
  end;
end;

procedure TfrmOrcamentos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  UpdatesPending(cdsOrcam, Self);
end;

procedure TfrmOrcamentos.btnConsultarClick(Sender: TObject);
var
  Codigo: String;
begin
  Codigo := '0';
  if InputQuery('Localiza por n�mero', 'N�mero do or�amento:', Codigo) and (Codigo <> '0') then
  begin
    cdsOrcam.IndexFieldNames := 'CODIGO';
    if not cdsOrcam.Locate('CODIGO', Codigo, []) then
      MsgAviso(Codigo+' n�o encontrado.');
  end;
end;

procedure TfrmOrcamentos.btnAnteriorClick(Sender: TObject);
begin
//  Anterior(cdsOrcam);
  cdsOrcam.Prior;
end;

procedure TfrmOrcamentos.btnPrimeiroClick(Sender: TObject);
begin
cdsOrcam.First;  //Primeiro(cdsOrcam);
end;

procedure TfrmOrcamentos.btnProximoClick(Sender: TObject);
begin
  cdsOrcam.Next; //Proximo(cdsOrcam);
end;

procedure TfrmOrcamentos.btnUltimoClick(Sender: TObject);
begin
  cdsOrcam.Last;//Ultimo(cdsOrcam);
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
    cdsProdutos.Open;
    cdsCliente.Open;
    cdsSelecao.Open;
    cdsOrcam.Open;
    if Configuracao.OrcamConcluido then
    begin
      NroOrcamentoAberto :=
        SelectSingleField('SELECT COUNT(1) NUM FROM ORCAMENTO WHERE CONCLUIDO = ' +
          QuotedStr('N'), GetConnection);

      if (NroOrcamentoAberto > 0) then
      begin

        if MsgSN('Existe(m) ' + IntToStr(NroOrcamentoAberto) +
          ' Or�amentos(s), n�o conclu�do(s). '+
          'Por favor verifique, pois estes podem impedir ' +
          'a importa��o dos mesmos para vendas.'+#13#10+'Exibir somente or�amentos N�O conclu�dos agora?') then
        begin
          cdsOrcam.Filtered := False;
          cdsOrcam.Filter := 'CONCLUIDO = '+QuotedStr('N');
          cdsOrcam.Filtered := True;
        end;
      end;
    end;
    SQLPadrao := sqlOrcam.CommandText;
  finally
  end;
end;

procedure TfrmOrcamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSelecao.Close;
  cdsProdutos.Close;
  cdsCliente.Close;
  cdsOrcam.Close;
  Action := caFree;
end;

procedure TfrmOrcamentos.btnGravarClick(Sender: TObject);
begin
  try
    if ValidaFieldsVazios([cdsOrcamCODCLIENTE, cdsOrcamDATA, cdsOrcamIDVENDEDOR],
      ['Cliente', 'Data', 'Vendedor']) = '' then
      //Salvar(cdsOrcam)
      cdsOrcam.ApplyUpdates(0)
    else
      MsgCuidado('Or�amento incompleto.');
  except
    raise Exception.Create('Erro ao salvar or�amento.');
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
      cdsOrcam.Close;
      cdsOrcam.SQL.Clear; SQL.Text := 'select * from ORCAMENTO ' +
        'where DATA between :DATAINI and :DATAFIM';
      cdsOrcam.Params.ParamByName('DATAINI').AsDate := StrToDate(dtI);
      cdsOrcam.Params.ParamByName('DATAFIM').AsDate := StrToDate(dtF);
      cdsOrcam.Open;

      if cdsOrcam.IsEmpty then
      begin
        MsgCuidado(UM_PESQUISAVAZIO);
        Exit;
      end;
    end
    else
      MsgErro(UM_DATAINVALIDA);
  end;
end;

procedure TfrmOrcamentos.miAplicarDescClick(Sender: TObject);
var
  Percent, Valor: Real;
begin

  if cdsOrcamCONCLUIDO.AsString = 'S' then
  begin
    MsgAviso('N�o � poss�vel efetuar descontos em um or�amento j� conclu�do.');
    Exit;
  end;

  Percent := 0;
  if(ObterValor(Percent,'',''))then
  if(Percent <> 0)then
  begin
    Valor := (cdsOrcamTOTAL.AsFloat * (Percent/100));
    cdsOrcam.Edit;
    cdsOrcamTOTAL.AsFloat := (cdsOrcamTOTAL.AsFloat - Valor);
    cdsOrcam.ApplyUpdates(0);
  end
  else
    MsgErro('Informe o valor do desconto.');
end;

procedure TfrmOrcamentos.miLimpaFiltroClick(Sender: TObject);
begin
  try
    cdsOrcam.DisableControls;
    cdsOrcam.Close;
    cdsOrcam.SQL.Clear; SQL.Text :=SQLPadrao;
    cdsOrcam.Filtered := False;
    cdsOrcam.Open;
  finally
    cdsOrcam.EnableControls;
  end;
end;

procedure TfrmOrcamentos.miRelOramentoClick(Sender: TObject);
begin
  with TfrmPrevOrcamento.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('PCODIGO').AsInteger := cdsOrcamCODIGO.AsInteger;
    cdsPadrao.Open;
    //lbTitulo.Caption := Global.TituloOrcamento;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmOrcamentos.miRelOrcamClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioOrcamentoData', 'Or�amentos por data', Self);
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
  if MsgSN('Concluir este or�amento?') then
  begin
    cdsOrcam.Edit;
    cdsOrcamCONCLUIDO.AsString := 'S';
    cdsOrcam.ApplyUpdates(0);
    MsgAviso('Or�amento conclu�do com sucesso!');
  end;
  { se houver s� um or�amento n�o conclu�do quando ele for conclu�do o dataset
    ficar� vazio, ent�o limpamos os filtros pra evitar isso }
  if cdsOrcam.IsEmpty then
    miLimpaFiltro.Click;
end;

procedure TfrmOrcamentos.btnEditarClick(Sender: TObject);
begin
  if cdsOrcamCONCLUIDO.AsString = 'S' then
  begin
    if not Configuracao.EditarOrcam then
      MsgAviso('Sem premiss�o para editar este or�amento.')
    else
      cdsOrcam.Edit;
  end
  else
    cdsOrcam.Edit;
end;

procedure TfrmOrcamentos.InsereProduto;

  function ProdutoPromocao(IdProduto: Integer): Boolean;
  begin
    Result :=
      SQLFind('PROMOCAO', 'PRODUTO', IntToStr(IdProduto), sqlOrcam.SQLConnection);
  end;

  function DescontoPromocao(IdProduto: Integer): Extended;
  begin
    Result :=
      SelectSingleField('select DESCONTO from PROMOCAO where PRODUTO = '+
        QuotedStr(IntToStr(IdProduto)), sqlOrcam.SQLConnection);
  end;

  function PrecoPromocao(IdProduto: Integer): Extended;
  begin
    Result :=
      SelectSingleField('select PRECO from PROMOCAO where PRODUTO = '+
        QuotedStr(IntToStr(IdProduto)), sqlOrcam.SQLConnection);
  end;

begin
  cdsSelecao.Edit;
  cdsSelecaoPRODUTO.AsInteger    := cdsProdutosIDPRODUTO.AsInteger;
  cdsSelecaoNOMEPRODUTO.AsString := cdsProdutosABREVIACAO.AsString;
  cdsSelecaoQTDE.AsFloat         := 1;
  cdsSelecaoCUSTO.AsFloat        := cdsProdutosCUSTO.AsFloat;

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

  cdsSelecao.Post;
end;

procedure TfrmOrcamentos.dbCodClienteClickButton(Sender: TObject);
begin
//  if cdsOrcam.State in [dsEdit, dsInsert] then
//  begin
//    if TfrmModeloConsulta.Execute('Busca Clientes', cdsCliente, FN_CLIENTES, DL_CLIENTES) then
//      cdsOrcamCODCLIENTE.AsInteger := cdsClienteCODCLIENTE.AsInteger;
//  end;
end;

procedure TfrmOrcamentos.dbProdutoClickButton(Sender: TObject);
begin
//  if cdsOrcam.State in dsEditModes then
//  begin
//    if TfrmModeloConsulta.Execute('Produto', cdsProdutos, FN_PRODUTOS, DL_PRODUTOS) then
//    begin
//      if cdsProdutos.Locate('IDPRODUTO', cdsProdutosIDPRODUTO.AsInteger, []) then
//      begin
//        if not Configuracao.EstoqueOrc then
//        begin
//          cdsProdutos.Open;
//          if (cdsProdutosESTOQUE.AsFloat > cdsProdutosESTOQUEMINIMO.AsFloat) then
//            InsereProduto
//          else
//          begin
//            MsgErro('Produto com estoque m�nimo, n�o � poss�vel inseri-lo.');
//            Abort;
//          end;
//        end
//        else
//          InsereProduto;
//      end;
//    end;
//  end;
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

//      if MsgSN('Inserir novo produto?') then
//        dbProduto.OnClickButton(Sender);

    end
    else
    begin
      MsgAviso('Selecione um Produto, para depois inser�-lo.');
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
var x: Integer;
begin
  for x := 0 to ComponentCount - 1 do
  begin
    if Components[x] is TCustomSQLDataSet then
    begin
      if (not Assigned(TCustomSQLDataSet(Components[x]).SQLConnection)) then
        TCustomSQLDataSet(Components[x]).SQLConnection := GetConnection;
    end;
  end;

  ClientHeight := 570;
  ClientWidth  := 785;
  CentralizaForm(Self);
  AjustaStatusBar;
end;

procedure TfrmOrcamentos.cdsOrcamCODCLIENTEValidate(Sender: TField);
var
  NomeCliente: string;
begin
  inherited;
  NomeCliente := GetFieldByID(GetConnection, 'CLIENTES', 'NOME', 'CODCLIENTE',
    Sender.AsInteger);
  if NomeCliente <> '' then
    cdsOrcamNOMECLIENTE.AsString := NomeCliente;
end;

procedure TfrmOrcamentos.cdsDetOrcamCODPRODUTOValidate(Sender: TField);
var
  NomeProd: string;
begin
  inherited;
  NomeProd := GetFieldByID(GetConnection, 'PRODUTOS', 'DESCRICAO', 'IDPRODUTO',
    Sender.AsInteger);
  if NomeProd <> '' then
    cdsDetOrcamNOMEPRODUTO.AsString := NomeProd;
end;

procedure TfrmOrcamentos.cdsOrcamAfterInsert(DataSet: TDataSet);
begin
  //Incrementa('ORCAMENTO', cdsOrcamCODIGO, GetConnection);
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

procedure TfrmOrcamentos.cdsDetOrcamBeforeDelete(DataSet: TDataSet);
begin
  if (cdsOrcam.State in dsEditModes) then
  begin
    cdsOrcamTOTAL.AsFloat := (cdsOrcamTOTAL.AsFloat - cdsDetOrcamTOTAL.AsFloat);
    cdsOrcamITENS.AsFloat := (cdsOrcamITENS.AsFloat - 1);
  end;
end;

procedure TfrmOrcamentos.cdsDetOrcamBeforePost(DataSet: TDataSet);
begin
  if (cdsOrcam.State in dsEditModes) then
   begin
     cdsOrcamTOTAL.AsFloat := (cdsOrcamTOTAL.AsFloat + cdsDetOrcamTOTAL.AsFloat);
     cdsOrcamITENS.AsFloat := (cdsOrcamITENS.AsFloat + 1);
   end;
end;

procedure TfrmOrcamentos.FormKeyPress(Sender: TObject; var Key: Char);
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
      //PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
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

procedure TfrmOrcamentos.Oramentoembobina1Click(Sender: TObject);
begin
  frmRelatorioBobinaOrcam := TfrmRelatorioBobinaOrcam.Create(Self);
  frmRelatorioBobinaOrcam.IdOrcamento := cdsOrcamCODIGO.AsInteger;
  frmRelatorioBobinaOrcam.Caption := 'Or�amento em bobina';
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

  if cdsOrcamCONCLUIDO.AsString = 'N' then
  begin
    MsgAviso('Or�amento n�o conclu�do.');
    Exit;
  end;

  if MsgSN('Reabrir este or�amento?') then
  begin
    cdsOrcam.Edit;
    cdsOrcamCONCLUIDO.AsString := 'N';
    cdsOrcam.ApplyUpdates(0);
    MsgAviso('Or�amento reaberto com sucesso!');
  end;
end;

procedure TfrmOrcamentos.dbeIdVendedorClickButton(Sender: TObject);
begin
//  if ModoInsertEdit(cdsOrcam) then
//    if TfrmModeloConsulta.Execute('Vendedor', cdsVendedor, FN_VENDEDOR, DL_VENDEDOR) then
//      cdsOrcamIDVENDEDOR.AsInteger := cdsVendedorIDVENDEDOR.AsInteger;
end;

procedure TfrmOrcamentos.cdsOrcamIDVENDEDORValidate(Sender: TField);
var
  NomeVend: string;
begin
  inherited;
  NomeVend := GetFieldByID(GetConnection, 'VENDEDOR', 'VENDEDOR', 'IDVENDEDOR',
    Sender.AsInteger);
  if NomeVend <> '' then
    cdsOrcamVENDEDOR.AsString := NomeVend;
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

