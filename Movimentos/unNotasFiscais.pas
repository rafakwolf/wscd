unit unNotasFiscais;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   Buttons, DB, StdCtrls, DBCtrls,  Grids, DBGrids,
  SqlDb, Menus, ComCtrls, memds,  LCLType, ConstPadrao,
  FMTBcd, uDatabaseutils;

type
  TfrmNotasFiscais = class(TForm)
    dsDetNFiscais: TDataSource;
    dsNotasFiscais: TDataSource;
    sqldSelecao: TSQLQuery;
    dspSelecao: TComponent;
    cdsSelecao: TMemDataSet;
    dsSelecao: TDataSource;
    sqldProduto: TSQLQuery;
    dspProdutos: TComponent;
    cdsProdutos: TMemDataSet;
    sqlNFiscais: TSQLQuery;
    sqlDetNFiscais: TSQLQuery;
    dsLigaNF: TDataSource;
    dtNFiscais: TComponent;
    cdsNFiscais: TMemDataSet;
    cdsDetNFiscais: TMemDataSet;
    cdsNFiscaisNUMERO: TIntegerField;
    cdsNFiscaisCODFORNECEDOR: TIntegerField;
    cdsNFiscaisFORNECEDOR: TStringField;
    cdsNFiscaisDATANOTA: TDateField;
    cdsNFiscaisDATAENTRADA: TDateField;
    cdsNFiscaisOPERACAO: TStringField;
    cdsNFiscaisOBS: TMemoField;
    cdsNFiscaisBAIXADO: TStringField;
    cdsNFiscaisCONCLUIDA: TStringField;
    cdsNFiscaissqlDetNFiscais: TDataset;
    cdsDetNFiscaisNUMERO: TIntegerField;
    cdsDetNFiscaisPRODUTO: TIntegerField;
    cdsDetNFiscaisNOMEPRODUTO: TStringField;
    cdsDetNFiscaisALIQUOTA: TIntegerField;
    cdsDetNFiscaisNOMEALIQUOTA: TStringField;
    sqldSelecaoIDPRODUTO: TIntegerField;
    sqldSelecaoPRODUTO: TStringField;
    sqldSelecaoIDTRIBUTACAO: TIntegerField;
    sqldSelecaoTRIBUTACAO: TStringField;
    sqldSelecaoQTDE: TFloatField;
    sqldSelecaoTOTAL: TFloatField;
    sqldSelecaoCUSTO: TFloatField;
    sqldSelecaoLUCRO: TFloatField;
    sqldSelecaoVENDA: TFloatField;
    sqldSelecaoIPI: TFloatField;
    sqldSelecaoDESCTO: TFloatField;
    cdsSelecaoIDPRODUTO: TIntegerField;
    cdsSelecaoPRODUTO: TStringField;
    cdsSelecaoIDTRIBUTACAO: TIntegerField;
    cdsSelecaoTRIBUTACAO: TStringField;
    cdsSelecaoQTDE: TFloatField;
    cdsSelecaoTOTAL: TFloatField;
    cdsSelecaoCUSTO: TFloatField;
    cdsSelecaoLUCRO: TFloatField;
    cdsSelecaoVENDA: TFloatField;
    cdsSelecaoIPI: TFloatField;
    cdsSelecaoDESCTO: TFloatField;
    cdsNFiscaisCFOP: TStringField;
    sqldPagto: TSQLQuery;
    sqlNFiscaisNUMERO: TIntegerField;
    sqlNFiscaisCODFORNECEDOR: TIntegerField;
    sqlNFiscaisFORNECEDOR: TStringField;
    sqlNFiscaisDATANOTA: TDateField;
    sqlNFiscaisDATAENTRADA: TDateField;
    sqlNFiscaisCFOP: TStringField;
    sqlNFiscaisOPERACAO: TStringField;
    sqlNFiscaisDESCONTO: TFMTBCDField;
    sqlNFiscaisICMS: TFMTBCDField;
    sqlNFiscaisIPI: TFMTBCDField;
    sqlNFiscaisFRETE: TFMTBCDField;
    sqlNFiscaisDESPESAS: TFMTBCDField;
    sqlNFiscaisTOTALPRODUTO: TFMTBCDField;
    sqlNFiscaisTOTAL: TFMTBCDField;
    sqlNFiscaisOBS: TMemoField;
    sqlNFiscaisBAIXADO: TStringField;
    sqlNFiscaisCONCLUIDA: TStringField;
    sqlDetNFiscaisNUMERO: TIntegerField;
    sqlDetNFiscaisPRODUTO: TIntegerField;
    sqlDetNFiscaisNOMEPRODUTO: TStringField;
    sqlDetNFiscaisALIQUOTA: TIntegerField;
    sqlDetNFiscaisNOMEALIQUOTA: TStringField;
    sqlDetNFiscaisQTDE: TIntegerField;
    sqlDetNFiscaisTOTAL: TFMTBCDField;
    sqlDetNFiscaisCUSTO: TFMTBCDField;
    sqlDetNFiscaisLUCRO: TIntegerField;
    sqlDetNFiscaisVENDA: TFMTBCDField;
    sqlDetNFiscaisIPI: TFMTBCDField;
    sqlDetNFiscaisDESCONTO: TFMTBCDField;
    cdsNFiscaisDESCONTO: TFMTBCDField;
    cdsNFiscaisICMS: TFMTBCDField;
    cdsNFiscaisIPI: TFMTBCDField;
    cdsNFiscaisFRETE: TFMTBCDField;
    cdsNFiscaisDESPESAS: TFMTBCDField;
    cdsNFiscaisTOTALPRODUTO: TFMTBCDField;
    cdsNFiscaisTOTAL: TFMTBCDField;
    cdsDetNFiscaisQTDE: TIntegerField;
    cdsDetNFiscaisTOTAL: TFMTBCDField;
    cdsDetNFiscaisCUSTO: TFMTBCDField;
    cdsDetNFiscaisLUCRO: TIntegerField;
    cdsDetNFiscaisVENDA: TFMTBCDField;
    cdsDetNFiscaisIPI: TFMTBCDField;
    cdsDetNFiscaisDESCONTO: TFMTBCDField;
    sqldProdutoIDPRODUTO: TIntegerField;
    sqldProdutoCODBARRA: TStringField;
    sqldProdutoCODFORNECEDOR: TIntegerField;
    sqldProdutoDESCRICAO: TStringField;
    sqldProdutoIDALIQUOTA: TIntegerField;
    sqldProdutoCUSTO: TFMTBCDField;
    sqldProdutoLUCRO: TFMTBCDField;
    sqldProdutoVENDA: TFMTBCDField;
    sqldProdutoPRECO_PROMOCAO: TFMTBCDField;
    sqldProdutoESTOQUE: TIntegerField;
    sqldProdutoESTOQUEMINIMO: TIntegerField;
    sqldProdutoALTERADO: TIntegerField;
    sqldProdutoQTDERECEBIDA: TIntegerField;
    sqldProdutoDATARECEBIDA: TDateField;
    sqldProdutoABREVIACAO: TStringField;
    sqldProdutoPROMOCAO: TStringField;
    cdsProdutosIDPRODUTO: TIntegerField;
    cdsProdutosCODBARRA: TStringField;
    cdsProdutosCODFORNECEDOR: TIntegerField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosIDALIQUOTA: TIntegerField;
    cdsProdutosCUSTO: TFMTBCDField;
    cdsProdutosLUCRO: TFMTBCDField;
    cdsProdutosVENDA: TFMTBCDField;
    cdsProdutosPRECO_PROMOCAO: TFMTBCDField;
    cdsProdutosESTOQUE: TIntegerField;
    cdsProdutosESTOQUEMINIMO: TIntegerField;
    cdsProdutosALTERADO: TIntegerField;
    cdsProdutosQTDERECEBIDA: TIntegerField;
    cdsProdutosDATARECEBIDA: TDateField;
    cdsProdutosABREVIACAO: TStringField;
    cdsProdutosPROMOCAO: TStringField;
    sqldBaixa: TSQLQuery;
    sqldEstorna: TSQLQuery;
    mnNotasFiscais: TMainMenu;
    miRegistros: TMenuItem;
    miPrimeiro: TMenuItem;
    miAnterior: TMenuItem;
    miProximo: TMenuItem;
    miUltimo: TMenuItem;
    N1: TMenuItem;
    miNovo: TMenuItem;
    miExcluir: TMenuItem;
    miAlterar: TMenuItem;
    N2: TMenuItem;
    miSalvar: TMenuItem;
    miCancelar: TMenuItem;
    N3: TMenuItem;
    miFechar: TMenuItem;
    miFerramentas: TMenuItem;
    miLocalizar: TMenuItem;
    miOutrosFiltros: TMenuItem;
    miFiltroData: TMenuItem;
    miFiltrarForn: TMenuItem;
    N6: TMenuItem;
    miCompraNaoConc: TMenuItem;
    miMostrarTodos: TMenuItem;
    N5: TMenuItem;
    miContar: TMenuItem;
    N9: TMenuItem;
    miCadastraForn: TMenuItem;
    miCadastrarCFOP: TMenuItem;
    miCadastrodeproduto: TMenuItem;
    miOpcoes: TMenuItem;
    miConcluir: TMenuItem;
    miEstornar: TMenuItem;
    N8: TMenuItem;
    miPagamentoCompra: TMenuItem;
    miRelatorios: TMenuItem;
    miCompraAtual: TMenuItem;
    N7: TMenuItem;
    miRelDatas: TMenuItem;
    miRelForn: TMenuItem;
    N4: TMenuItem;
    miListaFaturamForn: TMenuItem;
    miListaFaturaCorrente: TMenuItem;
    stbCompra: TStatusBar;
    PanelTotais: TPanel;
    pnlBotoes: TPanel;
    btnFechar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnProximo: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    LabelNumero: TLabel;
    lbBaixado: TLabel;
    lbObs: TLabel;
    LabelFrete: TLabel;
    LabelIcms: TLabel;
    LabelIpi: TLabel;
    LabelDesp: TLabel;
    LabelTotDesc: TLabel;
    LabelTotParc: TLabel;
    LabelTotTotal: TLabel;
    btnInserir: TBitBtn;
    dbeNumero: TDBEdit;
    dbFornecedor: TDBEdit;
    dbEstornada: TDBEdit;
    dbCodFornecedor: TDBEdit;
    dbProduto: TDBEdit;
    dbTributacao: TDBEdit;
    dbQtde: TDBEdit;
    dbTotal: TDBEdit;
    dbCusto: TDBEdit;
    dbLucro: TDBEdit;
    dbVenda: TDBEdit;
    dbIPI: TDBEdit;
    dbDescto: TDBEdit;
    dbdDataNota: TDBEdit;
    dbdDataEntrada: TDBEdit;
    dbeCfop: TDBEdit;
    dbeOperacao: TDBEdit;
    edtFrete: TDBEdit;
    edtIcms: TDBEdit;
    edtIPITotal: TDBEdit;
    edtDespesas: TDBEdit;
    edtTotalDesconto: TDBEdit;
    edtTotalParcial: TDBEdit;
    edtTotalTotal: TDBEdit;
    dbmmObservacao: TDBMemo;
    Grade: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure miConcluirClick(Sender: TObject);
    procedure miMostrarTodosClick(Sender: TObject);
    procedure miFiltroDataClick(Sender: TObject);
    procedure miEstornarClick(Sender: TObject);
    procedure miRelDatasClick(Sender: TObject);
    procedure miRelFornClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miCompraNaoConcClick(Sender: TObject);
    procedure dbCodFornecedorClickButton(Sender: TObject);
    procedure dbProdutoClickButton(Sender: TObject);
    procedure dbTotalExit(Sender: TObject);
    procedure dbLucroExit(Sender: TObject);
    procedure dbVendaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miCompraAtualClick(Sender: TObject);
    procedure miListaFaturamFornClick(Sender: TObject);
    procedure dbeCfopClickButton(Sender: TObject);
    procedure cdsNFiscaisCFOPValidate(Sender: TField);
    procedure cdsNFiscaisCODFORNECEDORValidate(Sender: TField);
    procedure cdsDetNFiscaisPRODUTOValidate(Sender: TField);
    procedure cdsDetNFiscaisALIQUOTAValidate(Sender: TField);
    procedure dsNotasFiscaisStateChange(Sender: TObject);
    procedure cdsDetNFiscaisBeforeDelete(DataSet: TDataSet);
    procedure cdsDetNFiscaisBeforePost(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure miPagamentoCompraClick(Sender: TObject);
    procedure miListaFaturaCorrenteClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cdsNFiscaisNUMEROChange(Sender: TField);
    procedure miCadastraFornClick(Sender: TObject);
    procedure miCadastrarCFOPClick(Sender: TObject);
    procedure miCadastrodeprodutoClick(Sender: TObject);
  private
    SQLPadrao: string;
    function Duplicidade: Boolean;
    function CamposNulos: Boolean;
    function ValoresProduto: Boolean;
    procedure LimpaEdits;
    procedure AtualizaProdutos;
    procedure PagarCompra;
    procedure Estornar;
    procedure AjustaStatusBar;
  protected
    procedure CompraNaoConc(var msg: TMessage); message WM_COMPRA_NAO_CONC;
    procedure CompraConcluida(var Msg: TMessage); message WM_COMPRA_CONCLUIDA;
  public
    CodigoCompra: Integer;
  end;

var
  frmNotasFiscais: TfrmNotasFiscais;

implementation

uses  Funcoes, unModeloConsulta, VarGlobal, unPrevCompras,
     uConfiguraRelatorio,  unPagamentoCheque,
     unParcelaCompra, unPagamentoCompra, unPrevListaFaturamento,
     Math;

{$R *.dfm}

procedure TfrmNotasFiscais.AtualizaProdutos;
begin
  if cdsNFiscaisBAIXADO.AsString = 'N' then
  begin
    sqldBaixa.Close;
    sqldBaixa.Params.ParamByName('CODIGO').AsInteger := cdsNFiscaisNUMERO.AsInteger;
    sqldBaixa.ExecSQL;
  end;
end;

procedure TfrmNotasFiscais.Estornar;
begin
  if cdsNFiscaisCONCLUIDA.AsString = 'S' then
  begin
    sqldEstorna.Close;
    sqldEstorna.Params.ParamByName('CODIGO').AsInteger := cdsNFiscaisNUMERO.AsInteger;
    sqldEstorna.ExecSQL;
    //PostMessage(Handle, WM_COMPRA_CONCLUIDA, 0, 0);
    MsgAviso('Compra estornada!');
  end;
end;

function TfrmNotasFiscais.CamposNulos: Boolean;
begin
 // Result := (ValidaFieldsVazios([cdsNFiscaisNUMERO, cdsNFiscaisCODFORNECEDOR,
 //   cdsNFiscaisDATANOTA, cdsNFiscaisDATAENTRADA, cdsNFiscaisOPERACAO],
 //   ['N�mero', 'Fornecedor', 'Data da nota', 'Data de chegada', 'Opera��o CFOP']) <> '');
end;

function TfrmNotasFiscais.Duplicidade: Boolean;
begin
  Result := False;
  if (not cdsNFiscaisNUMERO.IsNull) and (Trim(dbeNumero.Text) <> '') then
  begin
    if cdsNFiscais.State in [dsInsert] then
    begin
      with TSQLQuery.Create(nil) do
      try
        SQLConnection := GetConnection;
        SQL.Clear; SQL.Text :='select NUMERO from NOTAS_FISCAIS '+
          'where NUMERO = ' + QuotedStr(Trim(dbeNumero.Text));
        Open;
        Result := (not IsEmpty);
      finally
        Free;
      end;
    end;
    if Result then
    begin
      MsgCuidado('J� existe uma nota com este n�mero.');
      SetFocusIfCan(dbeNumero);
      Exit;
    end;
  end;
end;

procedure TfrmNotasFiscais.LimpaEdits;
begin
  cdsSelecao.Close;
  cdsSelecao.Open;
end;

procedure TfrmNotasFiscais.FormShow(Sender: TObject);
begin
  try

    cdsProdutos.Open;
    cdsNFiscais.Open;
    SQLPadrao := sqlNFiscais.SQL.Text;
    if Configuracao.CompraConcluida then
    begin
      with TSQLQuery.Create(nil) do
      try
        SQLConnection := GetConnection;
        SQL.Clear; SQL.Text :='select count(1) as CONT from NOTAS_FISCAIS '+
          'where concluida = ' + QuotedStr('N');
        Open;
        if (FieldByName('CONT').AsInteger > 0) then
        begin

          if MsgSN('Existe(m) ' + IntToStr(FieldByName('CONT').AsInteger)+
            ' compra(s) n�o conclu�da(s). ' +
            'Por favor verifique, pois �stas podem causar ' +
            'inconsist�ncias no banco de dados e no controle do estoque.'+#13#10+
            'Deseja exibir somente as n�o concluidas agora?') then
            miCompraNaoConc.Click;
        end;
      finally
        Free;
      end;
    end;
  finally

  end;
end;

procedure TfrmNotasFiscais.btnExcluirClick(Sender: TObject);
begin
  if cdsNFiscais.IsEmpty then Exit;
  if MsgSN('Deseja realmente excluir �sta compra?') then
  begin
    // deleta itens da nota
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := GetConnection;
      SQL.Clear; SQL.Text :='delete from ITEMNOTAFISCAL where NUMERO = :PNUMERO';
      Params.ParamByName('PNUMERO').AsInteger := cdsNFiscaisNUMERO.AsInteger;
      ExecSQL;
    finally
      Free;
    end;
    // deleta cabe�alho da nota
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := GetConnection;
      SQL.Clear; SQL.Text :='delete from NOTAS_FISCAIS where NUMERO = :PNUMERO';
      Params.ParamByName('PNUMERO').AsInteger := cdsNFiscaisNUMERO.AsInteger;
      ExecSQL;
    finally
      Free;
    end;
    cdsNFiscais.Close;
    cdsNFiscais.Open;
  end;
end;

procedure TfrmNotasFiscais.btnSalvarClick(Sender: TObject);
begin
  if (not Duplicidade) and (not CamposNulos) then
  begin
   // Salvar(cdsNFiscais);
    //cdsNFiscais.ApplyUpdates(0);
    miConcluir.Click;
  end;
end;

procedure TfrmNotasFiscais.btnCancelarClick(Sender: TObject);
begin
  //cdsNFiscais.CancelUpdates;
  LimpaEdits;
end;

procedure TfrmNotasFiscais.btnNovoClick(Sender: TObject);
begin
  SetFocusIfCan(dbeNumero);
  LimpaEdits;
  cdsNFiscais.Append;
  cdsNFiscaisBAIXADO.AsString := 'N';
  cdsNFiscaisCONCLUIDA.AsString := 'N';
  cdsNFiscaisDESCONTO.AsFloat := 0;
  cdsNFiscaisICMS.AsFloat := 0;
  cdsNFiscaisIPI.AsFloat := 0;
  cdsNFiscaisFRETE.AsFloat := 0;
  cdsNFiscaisDESPESAS.AsFloat := 0;
  cdsNFiscaisTOTALPRODUTO.AsFloat := 0;
  cdsNFiscaisTOTAL.AsFloat := 0;
  cdsNFiscaisDATAENTRADA.AsDateTime := Date;
end;

procedure TfrmNotasFiscais.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNotasFiscais.btnInserirClick(Sender: TObject);
begin
  //if SQLFind('NOTAS_FISCAIS', 'NUMERO', dbeNumero.Text, sqlNFiscais.SQLConnection) then
  //begin
  //  MsgCuidado('J� existe uma nota com este n�mero.');
  //  SetFocusIfCan(dbeNumero);
  //  Exit;
  //end;

  if ValoresProduto then
  begin
    cdsDetNFiscais.Append;
    cdsDetNFiscaisPRODUTO.AsInteger  := cdsSelecaoIDPRODUTO.AsInteger;
    cdsDetNFiscaisALIQUOTA.AsInteger := cdsSelecaoIDTRIBUTACAO.AsInteger;
    cdsDetNFiscaisQTDE.AsFloat       := cdsSelecaoQTDE.AsFloat;
    cdsDetNFiscaisTotal.AsFloat      := cdsSelecaoTOTAL.AsFloat;
    cdsDetNFiscaisCUSTO.AsFloat      := cdsSelecaoCUSTO.AsFloat;
    cdsDetNFiscaisVENDA.AsFloat      := cdsSelecaoVENDA.AsFloat;
    cdsDetNFiscaisLUCRO.AsFloat      := cdsSelecaoLUCRO.AsFloat;
    cdsDetNFiscaisIPI.AsFloat        := cdsSelecaoIPI.AsFloat;
    cdsDetNFiscaisDESCONTO.AsFloat   := cdsSelecaoDESCTO.AsFloat;
    cdsDetNFiscais.Post;

    LimpaEdits;
    SetFocusIfCan(dbProduto);

//    if MsgSN('Inserir novo �tem?') then
//      dbProduto.OnClickButton(Sender);
  end;
end;

procedure TfrmNotasFiscais.btnPrimeiroClick(Sender: TObject);
begin
  //Primeiro(cdsNFiscais);
  cdsNFiscais.First;
end;

procedure TfrmNotasFiscais.btnUltimoClick(Sender: TObject);
begin
//  Ultimo(cdsNFiscais);
cdsNFiscais.Last;
end;

procedure TfrmNotasFiscais.btnAnteriorClick(Sender: TObject);
begin
//  Anterior(cdsNFiscais);
cdsNFiscais.Prior;
end;

procedure TfrmNotasFiscais.btnProximoClick(Sender: TObject);
begin
//  Proximo(cdsNFiscais);
cdsNFiscais.Next;
end;


procedure TfrmNotasFiscais.GradeDblClick(Sender: TObject);
begin
  if MsgSN('Deseja realmente excluir (' + cdsDetNFiscaisNOMEPRODUTO.AsString + ')'+
    ' da listagem de produtos?') then
    cdsDetNFiscais.Delete;
end;

procedure TfrmNotasFiscais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsProdutos.Close;
  cdsSelecao.Close;
  Action := caFree;
end;

procedure TfrmNotasFiscais.btnEditarClick(Sender: TObject);
begin
  if cdsNFiscaisCONCLUIDA.AsString = 'S' then
  begin
    if not Configuracao.EditarCompra then
      MsgAviso('Compra conclu�da e sem permiss�o para editar.')
    else
      cdsNFiscais.Edit;
  end
  else
    cdsNFiscais.Edit;
end;

procedure TfrmNotasFiscais.btnConsultarClick(Sender: TObject);
var
  Numero: String;
begin
  Numero := '0';
  if InputQuery('Localizar por n�mero', 'N�mero da compra:', Numero) and (Numero <> '0') then
  begin
    //cdsNFiscais.IndexFieldNames := 'NUMERO';
    if not cdsNFiscais.Locate('NUMERO', Numero, []) then
      MsgAviso(Numero + ' n�o encontrado');
  end;
end;

procedure TfrmNotasFiscais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 52,'');
end;

procedure TfrmNotasFiscais.miConcluirClick(Sender: TObject);
begin
  AtualizaProdutos;
  PagarCompra;
end;

procedure TfrmNotasFiscais.miMostrarTodosClick(Sender: TObject);
begin
  try
    cdsNFiscais.DisableControls;
    cdsNFiscais.Close;
    // cdsNFiscais.SQL.Clear; SQL.Text :=SQLPadrao;

    if cdsNFiscais.Filtered then
      cdsNFiscais.Filtered := False;
    cdsNFiscais.Filter := '';

    cdsNFiscais.Open;
  finally
    cdsNFiscais.EnableControls;
  end;
end;

procedure TfrmNotasFiscais.miFiltroDataClick(Sender: TObject);
var
  dtI, dtF: String;
begin
  if (ObterDatas(dtI, dtF)) then
  begin
    if (ClearMask(dtI) <> '') and (ClearMask(dtF) <> '') then
    begin
      cdsNFiscais.Close;
      //cdsNFiscais.SQL.Clear; SQL.Text :='select * from notas_fiscais ' + #13 +
      //  'where datae between :dataI and :dataF';
      //cdsNFiscais.Params.ParamByName('DATAI').AsDate := StrToDate(dtI);
      //cdsNFiscais.Params.ParamByName('DATAF').AsDate := StrToDate(dtF);
      cdsNFiscais.Open;

      if cdsNFiscais.IsEmpty then
        MsgCuidado(UM_PESQUISAVAZIO);

    end
    else
      MsgErro(UM_DATAINVALIDA);
  end;
end;

procedure TfrmNotasFiscais.miEstornarClick(Sender: TObject);
begin
  if cdsNFiscais.IsEmpty then
    Exit;

  if cdsNFiscaisCONCLUIDA.AsString = 'N' then
  begin
    MsgAviso('Compra n�o conclu�da.');
    Exit;
  end;

  if MsgSN('Deseja realmente estornar �sta compra?'+#13#10+
    '�sta a��o ir� voltar apenas altera��es da quantidade de estoque e transa��es financeiras,'+#13#10+
    'o restante dos dados dos produtos n�o ser�o estornados. Continua?') then
    Estornar;
end;

procedure TfrmNotasFiscais.miRelDatasClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioCompraData', 'Relat�rio de Compras por Data', Self);
end;

procedure TfrmNotasFiscais.miRelFornClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioCompraFornecedor', 'Relatorio de Compras', Self);
end;

procedure TfrmNotasFiscais.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //UpdatesPending(cdsNFiscais, Self);
end;

procedure TfrmNotasFiscais.miCompraNaoConcClick(Sender: TObject);
begin
  ChamaForm('TfrmCompNaoConc', 'Compras nao concluidas', Self);
end;

function TfrmNotasFiscais.ValoresProduto: Boolean;
begin
  Result := True;
  if (cdsSelecaoPRODUTO.IsNull) or
     (cdsSelecaoQTDE.IsNull) or
     (cdsSelecaoCUSTO.IsNull) or
     (cdsSelecaoLUCRO.IsNull) or
     (cdsSelecaoVENDA.IsNull) then
  begin
    Result := False;
    MsgErro('Informe todos os dados do produto.');
    SetFocusIfCan(dbProduto);
    Abort;
  end;
end;

procedure TfrmNotasFiscais.dbCodFornecedorClickButton(Sender: TObject);
begin
//  if (cdsNFiscais.State in dsEditModes) then
//    if TfrmModeloConsulta.Execute('Fornecedor', GetDmPesquisar.cdsPesqForn, FN_FORN, DL_FORN) then
//    begin
//      cdsNFiscaisCODFORNECEDOR.AsInteger := GetDmPesquisar.cdsPesqForn.FieldByName('CODFORNECEDOR').AsInteger;
//    end;
end;

procedure TfrmNotasFiscais.dbProdutoClickButton(Sender: TObject);
begin

  if not cdsProdutos.Active then
    cdsProdutos.Open;

  if not cdsSelecao.Active then
    cdsSelecao.Open;

  if(cdsNFiscais.State in [dsInsert, dsEdit])then
  begin
//    if TfrmModeloConsulta.Execute('Busca produto', cdsProdutos, FN_PRODUTOS, DL_PRODUTOS) then
//    begin
//      cdsSelecao.Edit;
//      cdsSelecaoIDPRODUTO.AsInteger := cdsProdutosIDPRODUTO.AsInteger;
//      cdsSelecaoPRODUTO.AsString := cdsProdutosDESCRICAO.AsString;
//      cdsSelecaoIDTRIBUTACAO.AsInteger := cdsProdutosIDALIQUOTA.AsInteger;
//      cdsSelecaoTRIBUTACAO.AsString :=
//        SelecSingleField('select DESCRICAO from ALIQUOTAS where CODALIQUOTA =' +
//          QuotedStr(IntToStr(cdsProdutosIDALIQUOTA.AsInteger)), GetConnection);
//      cdsSelecaoQTDE.AsFloat := 1;
//      cdsSelecaoTOTAL.AsFloat := 0;
//      cdsSelecaoCUSTO.AsFloat := 0;
//      cdsSelecaoLUCRO.AsFloat := cdsProdutosLUCRO.AsFloat;
//      cdsSelecaoVENDA.AsFloat := StrToFloatDef(FormatFloat('#,##0.00', cdsProdutosVENDA.AsFloat), 0);
//      cdsSelecaoIPI.AsFloat := 0;
//      cdsSelecaoDESCTO.AsFloat := 0;
//      cdsSelecao.Post;
//    end;
  end;
end;

procedure TfrmNotasFiscais.dbTotalExit(Sender: TObject);
begin
  if cdsNFiscais.State in [dsEdit, dsInsert] then
    cdsSelecaoCUSTO.AsFloat := (cdsSelecaoTOTAL.AsFloat / cdsSelecaoQTDE.AsFloat);
end;

procedure TfrmNotasFiscais.dbLucroExit(Sender: TObject);
begin
  if cdsNFiscais.State in [dsEdit, dsInsert] then
  begin
    cdsSelecaoVENDA.AsFloat := ((cdsSelecaoCUSTO.AsFloat * cdsSelecaoLUCRO.AsFloat / 100) + cdsSelecaoCUSTO.AsFloat);

    if MsgSN('Pre�o de venda R$ ' + FormatFloat('#,##0.00', cdsSelecaoVENDA.AsFloat) + '. Confirma?') then
      SetFocusIfCan(dbVenda);
  end;
end;

procedure TfrmNotasFiscais.dbVendaExit(Sender: TObject);
begin
  if cdsNFiscais.State in [dsEdit, dsInsert] then
  begin
//    cdsSelecaoLUCRO.AsFloat :=
//      StrToFloat(CalcMargem(FloatToStr(cdsSelecaoVENDA.AsFloat),
//                            FloatToStr(cdsSelecaoCUSTO.AsFloat)));
  end;
end;

procedure TfrmNotasFiscais.FormCreate(Sender: TObject);
var x: Integer;
begin
  for x := 0 to ComponentCount - 1 do
  begin
    if Components[x] is TSqlquery then
    begin
      if (not Assigned(TSqlquery(Components[x]).SQLConnection)) then
        TSqlquery(Components[x]).SQLConnection := GetConnection;
    end;
  end;

  ClientHeight := 560;
  ClientWidth  := 810;
  CentralizaForm(Self);
  AjustaStatusBar;
end;

procedure TfrmNotasFiscais.miCompraAtualClick(Sender: TObject);
const
  CS_NF_ATUAL = 'select '+
                ' nf.NUMERO, '+
                ' nf.CODFORNECEDOR, '+
                '  f.FANTAZIA FORNECEDOR, '+
                ' nf.DATANOTA, '+
                ' nf.DATAENTRADA, '+
                ' nf.CFOP, '+
                '  c.OPERACAO, '+
                ' nf.DESCONTO, '+
                ' nf.ICMS, '+
                ' nf.IPI, '+
                ' nf.FRETE, '+
                ' nf.DESPESAS, '+
                ' nf.TOTALPRODUTO, '+
                ' nf.TOTAL, '+
                ' nf.OBS, '+
                ' nf.BAIXADO, '+
                ' nf.CONCLUIDA '+
                'from NOTAS_FISCAIS nf '+
                'left join FORNECEDORES f on(nf.CODFORNECEDOR = f.CODFORNECEDOR) '+
                'left join CFOP c on(c.NUMERO = nf.CFOP) '+
                'where nf.NUMERO = :NUM '+
                'order by nf.NUMERO';
begin
  if not cdsNFiscais.IsEmpty then
  begin
    with TfrmPrevCompras.Create(Self) do
    try
      with cdsPadrao do
      begin
        Close;
        //SQL.Clear; SQL.Text :=CS_NF_ATUAL;
        //Params.ParamByName('NUM').AsInteger := cdsNFiscaisNUMERO.AsInteger;
        Open;
      end;
      Titulo := 'Relat�rio de Compras';
      PrintIfNotEmptyRL(rrPadrao);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmNotasFiscais.miListaFaturamFornClick(Sender: TObject);
begin
  ChamaForm('TfrmRelatorioFaturamento', 'Faturamento por fornecedor', Self);
end;

procedure TfrmNotasFiscais.dbeCfopClickButton(Sender: TObject);
begin
//  if (cdsNFiscais.State in dsEditModes) then
//    if TfrmModeloConsulta.Execute('Cfop', GetDmPesquisar.cdsPesqCfop, FN_CFOP, DL_CFOP) then
//    begin
//      cdsNFiscaisCFOP.AsInteger := StrToInt(GetDmPesquisar.cdsPesqCfop.FieldByName('NUMERO').AsString);
//    end;
end;

procedure TfrmNotasFiscais.cdsNFiscaisCFOPValidate(Sender: TField);
var
  Operacao: string;
begin
  //Operacao := GetFieldByID(GetZConnection, 'CFOP', 'OPERACAO', 'NUMERO',
  //  StrToInt(Sender.AsString));
  //if Operacao <> '' then
  //  cdsNFiscaisOPERACAO.AsString := Operacao;
end;

procedure TfrmNotasFiscais.cdsNFiscaisCODFORNECEDORValidate(
  Sender: TField);
var
  NomeForn: string;
begin
  //NomeForn := GetFieldByID(GetZConnection, 'FORNECEDORES', 'FANTAZIA', 'CODFORNECEDOR',
  //  Sender.AsInteger);
  //if NomeForn <> '' then
  //  cdsNFiscaisFORNECEDOR.AsString := NomeForn;
end;

procedure TfrmNotasFiscais.cdsDetNFiscaisPRODUTOValidate(Sender: TField);
var
  NomeProduto: string;
begin
  NomeProduto := GetFieldByID(GetZConnection, 'PRODUTOS', 'DESCRICAO', 'IDPRODUTO',
    Sender.AsInteger);
  if NomeProduto <> '' then
    cdsDetNFiscaisNOMEPRODUTO.AsString := NomeProduto;
end;

procedure TfrmNotasFiscais.cdsDetNFiscaisALIQUOTAValidate(Sender: TField);
var
  Aliquota: string;
begin
  Aliquota := GetFieldByID(GetZConnection, 'ALIQUOTAS', 'DESCRICAO', 'CODALIQUOTA',
    Sender.AsInteger);
  if Aliquota <> '' then
    cdsDetNFiscaisNOMEALIQUOTA.AsString := Aliquota;
end;

procedure TfrmNotasFiscais.dsNotasFiscaisStateChange(Sender: TObject);
var
  DadosPendentes: Boolean;
begin

  DadosPendentes := (dsNotasFiscais.DataSet.State in [dsInsert, dsEdit]);

  if (dsNotasFiscais.DataSet <> nil) and (dsNotasFiscais.State <> dsInactive) then
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
    btnExcluir.Enabled := (not DadosPendentes) and (not dsNotasFiscais.DataSet.IsEmpty);
    miExcluir.Enabled := btnExcluir.Enabled;
    btnConsultar.Enabled := (not DadosPendentes);
    btnSalvar.Enabled := DadosPendentes;
    miSalvar.Enabled := btnSalvar.Enabled;
    btnCancelar.Enabled := DadosPendentes;
    miCancelar.Enabled := btnCancelar.Enabled;
  end;

  if (dsNotasFiscais.DataSet.State in [dsInsert]) then
    stbCompra.Panels[0].Text := ' Inserindo registro...'
  else if (dsNotasFiscais.DataSet.State in [dsEdit]) then
    stbCompra.Panels[0].Text := ' Alterando registro...'
  else if (dsNotasFiscais.DataSet.State in [dsBrowse]) then
    stbCompra.Panels[0].Text := ' Visualizando registro...'
  else if (dsNotasFiscais.DataSet.IsEmpty) then
    stbCompra.Panels[0].Text := ' Nenhum registro...';

end;

procedure TfrmNotasFiscais.cdsDetNFiscaisBeforeDelete(DataSet: TDataSet);
begin
  if cdsNFiscais.State in [dsEdit, dsInsert] then
  begin
    cdsNFiscaisIPI.AsFloat := (cdsNFiscaisIPI.AsFloat - cdsDetNFiscaisIPI.AsFloat);
    cdsNFiscaisDESCONTO.AsFloat :=
      (cdsNFiscaisDESCONTO.AsFloat - cdsDetNFiscaisDESCONTO.AsFloat);
    cdsNFiscaisTOTALPRODUTO.AsFloat :=
      (cdsNFiscaisTOTALPRODUTO.AsFloat - cdsDetNFiscaisTOTAL.AsFloat);
    cdsNFiscaisTOTAL.AsFloat := (cdsNFiscaisTOTAL.AsFloat - cdsDetNFiscaisTOTAL.AsFloat);
  end;
end;

procedure TfrmNotasFiscais.cdsDetNFiscaisBeforePost(DataSet: TDataSet);
begin
  if cdsNFiscais.State in [dsEdit, dsInsert] then
  begin
    cdsNFiscaisIPI.AsFloat :=
      cdsNFiscaisIPI.AsFloat +
      cdsDetNFiscaisIPI.AsFloat;

    cdsNFiscaisDESCONTO.AsFloat :=
      cdsNFiscaisDESCONTO.AsFloat +
      cdsDetNFiscaisDESCONTO.AsFloat;

    cdsNFiscaisTOTALPRODUTO.AsFloat :=
      cdsNFiscaisTOTALPRODUTO.AsFloat +
      cdsDetNFiscaisTOTAL.AsFloat;

    cdsNFiscaisTOTAL.AsFloat :=
      cdsNFiscaisTOTAL.AsFloat +
      cdsDetNFiscaisTOTAL.AsFloat -
      cdsNFiscaisIPI.AsFloat -
      cdsNFiscaisDESCONTO.AsFloat;
  end;
end;

procedure TfrmNotasFiscais.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl is TCustomMemo) or
            ((ActiveControl is TCustomCombobox) and
             (TCustomCombobox(ActiveControl).DroppedDown)) then
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
      //with TDBGrid(ActiveControl) do
      //  if SelectedIndex < (FieldCount-1) then
      //    SelectedIndex := SelectedIndex+1
      //  else
      //    SelectedIndex := 0;
    end;
  end;
end;

procedure TfrmNotasFiscais.CompraNaoConc(var msg: TMessage);
begin
  cdsNFiscais.Filtered := False;
  cdsNFiscais.Filter := 'CONCLUIDA = '+QuotedStr('N');
  cdsNFiscais.Filtered := True;
end;

procedure TfrmNotasFiscais.miPagamentoCompraClick(Sender: TObject);
begin
  frmPagamentoCompra := TfrmPagamentoCompra.Create(Self);
  frmPagamentoCompra.IdCompra := cdsNFiscaisNUMERO.AsInteger;
  frmPagamentoCompra.ShowModal;
end;

procedure TfrmNotasFiscais.CompraConcluida(var Msg: TMessage);
begin
  ReabreDataSet(cdsNFiscais);
end;

procedure TfrmNotasFiscais.miListaFaturaCorrenteClick(Sender: TObject);
const
  SQL: string = 'select '+
                'nf.NUMERO, '+
                'nf.CODFORNECEDOR, '+
                'fn.FANTAZIA FORNECEDOR, '+
                'nf.DATANOTA, '+
                'nf.DATAENTRADA, '+
                ' c.OPERACAO, '+
                'nf.DESCONTO, '+
                'nf.ICMS, '+
                'nf.IPI, '+
                'nf.FRETE, '+
                'nf.DESPESAS, '+
                'nf.TOTALPRODUTO, '+
                'nf.TOTAL, '+
                'nf.OBS, '+
                'nf.BAIXADO, '+
                'nf.CONCLUIDA '+
                'from NOTAS_FISCAIS nf '+
                'left join FORNECEDORES fn on(nf.CODFORNECEDOR = fn.CODFORNECEDOR) '+
                'left join CFOP c on (c.NUMERO = nf.CFOP) '+
                'where nf.NUMERO = :PNUMERO '+
                'order by nf.DATANOTA';
var
  x: Integer;
begin
   with TfrmPrevListaFaturamento.Create(Self) do
   try
     cdsPadrao.Close;
     sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :=SQL;
     sqldPadrao.Params.ParamByName('PNUMERO').AsInteger := cdsNFiscaisNUMERO.AsInteger;
     cdsPadrao.Open;
     //lbTitulo.Caption := 'Produtos da Nota: '+IntToStr(cdsNFiscaisNUMERO.AsInteger);

     x := FormRadioButtons('Mostrar lucro e pre�o de custo, Ocultar lucro e pre�o de custo', 'Listagem de produtos');
     //lbCusto.Visible        := (x = 0);
     //rldbPrecoCusto.Visible := (x = 0);
     //lbLucro.Visible        := (x = 0);
     //rldbLucro.Visible      := (x = 0);

     PrintIfNotEmptyRL(rrPadrao);
   finally
     Free;
   end;
end;

procedure TfrmNotasFiscais.AjustaStatusBar;
var
  Size: Integer;
begin
  Size := (ClientWidth div 2);
  stbCompra.Panels[0].Width := Size;
  stbCompra.Panels[1].Width := Size;
  stbCompra.Update;
end;

procedure TfrmNotasFiscais.FormResize(Sender: TObject);
begin
  AjustaStatusBar;
end;

procedure TfrmNotasFiscais.cdsNFiscaisNUMEROChange(Sender: TField);
begin
  if SQLFind('NOTAS_FISCAIS', 'NUMERO', dbeNumero.Text, GetZConnection) then
    MsgCuidado('J� existe uma nota com este n�mero.');
end;

procedure TfrmNotasFiscais.PagarCompra;

  procedure ConcluirCompra(FormaPagto: string; ValorPago: Currency);
  begin
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := GetConnection;
      //CommandType := ctStoredProc;
      SQL.Clear; SQL.Text :='STPPAGTOCOMPRA';
      Params.ParamByName('IDCOMPRA').AsInteger  := cdsNFiscaisNUMERO.AsInteger;
      Params.ParamByName('DATAPAGTO').AsDate    := Date;
      Params.ParamByName('FORMAPAGTO').AsString := Trim(FormaPagto);
      Params.ParamByName('VALORPAGO').AsFMTBCD  := DoubleToBcd(ValorPago);
      ExecSQL;
    finally
      ReabreDataSet(cdsNFiscais);
      Free;
    end;
  end;

  function Restante: Real;
  begin
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := GetConnection;
      SQL.Clear; SQL.Text :='select RESTO from STPRESTOCOMPRA(:COMPRA)';
      Params.ParamByName('COMPRA').AsInteger := cdsNFiscaisNUMERO.AsInteger;
      Open;
      Result := RoundTo(FieldByName('RESTO').AsFloat, 2);
    finally
      Free;
    end;
  end;

var
  FormaPagamento: Integer;
  ValorDinheiro: Real;
begin
  if (cdsNFiscaisCONCLUIDA.AsString = 'N') then
  begin

    FormaPagamento :=
      FormRadioButtons('&1 - Dinheiro, &2 - Cheque a Vista, &3 - Cheque Pr�-datado, &4 - Credi�rio', 'Forma de pagamento');

    case FormaPagamento of
      0: {dinheiro}
      begin
        if ObterValor(ValorDinheiro, '0', 'Total/Resto') then
        begin

          if RoundTo(ValorDinheiro, 2) > RoundTo(Restante, 2) then
          begin
            MsgErro('Valor digitado � maior que o resto a pagar, tente novamente.');
            Exit;
          end;

          if ValorDinheiro = 0 then
          begin
            MsgErro('Valor digitado � inv�lido, tente novamente.');
            Exit;
          end;

          if GetDataModule.EnviaCaixa(Date, 'Compra Nro: '+IntToStr(cdsNFiscaisNUMERO.AsInteger),
            'C'+IntToStr(cdsNFiscaisNUMERO.AsInteger), 'D', ValorDinheiro) then
            ConcluirCompra('Dinheiro', ValorDinheiro)
          else
            MsgAviso('Compra n�o foi conclu�da.');

        end;
      end;
      1: {cheque a vista}
      begin
        frmPagamentoCheque := TfrmPagamentoCheque.Create(Self);
        frmPagamentoCheque.TipoCheque := tcAVista;
        frmPagamentoCheque.IdCompra := cdsNFiscaisNUMERO.AsInteger;
        frmPagamentoCheque.TipoChamada := tcmCompra;
        if frmPagamentoCheque.ShowModal <> mrOk then
          MsgAviso('Compra n�o foi conclu�da.');
      end;
      2: {cheque pre-datado}
      begin
        frmPagamentoCheque := TfrmPagamentoCheque.Create(Self);
        frmPagamentoCheque.TipoCheque := tcPreDatado;
        frmPagamentoCheque.IdCompra := cdsNFiscaisNUMERO.AsInteger;
        frmPagamentoCheque.TipoChamada := tcmCompra;
        if frmPagamentoCheque.ShowModal <> mrOk then
          MsgAviso('Compra n�o foi conclu�da.');
      end;
      3: {parcelamento}
      begin
        frmParcelaCompra := TfrmParcelaCompra.Create(Self);
        frmParcelaCompra.IdCompra := cdsNFiscaisNUMERO.AsInteger;
        if frmParcelaCompra.ShowModal <> mrOk then
          MsgAviso('Compra n�o foi conclu�da.');
      end;
    end;
  end
  else
    MsgAviso('Compra j� foi conclu�da.');
end;

procedure TfrmNotasFiscais.miCadastraFornClick(Sender: TObject);
begin
  ChamaForm('TfrmFornecedor', 'Cadastro de fornecedores', Self);
end;

procedure TfrmNotasFiscais.miCadastrarCFOPClick(Sender: TObject);
begin
  ChamaForm('TfrmCadastroCFOP', 'CFOP', Self);
end;

procedure TfrmNotasFiscais.miCadastrodeprodutoClick(Sender: TObject);
begin
  ChamaForm('TfrmProduto', 'Cadastro de produtos', Self);
end;

initialization
  RegisterClass(TfrmNotasFiscais);
finalization
  UnRegisterClass(TfrmNotasFiscais);
end.


