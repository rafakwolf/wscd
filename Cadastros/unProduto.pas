unit unProduto;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb, ConstPadrao,
    DBCtrls,  FMTBcd, lcltype, ZDataset, ZSqlUpdate;

type

  { TfrmProduto }

  TfrmProduto = class(TfrmPadrao)
    actEstoqueMinimo: TAction;
    dbeQtdeRecebida: TDBEdit;
    dbeEstoqueMinimo: TDBEdit;
    dbeEstoque: TDBEdit;
    dbePrecoVenda: TDBEdit;
    dbeLucro: TDBEdit;
    dbePrecoCusto: TDBEdit;
    dbePrecoPromocao: TDBEdit;
    dbdValidade: TDBEdit;
    dbePeso: TDBEdit;
    dbeNomeProduto: TDBEdit;
    dbeCodigoBarra: TDBEdit;
    dbeCodigoInterno: TDBEdit;
    dbeReferencia: TDBEdit;
    dbeDataReceb: TDBEdit;
    dbckbPromocao: TDBCheckBox;
    dbeObs: TDBEdit;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure dbeLucroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miRelPorGrupoClick(Sender: TObject);
    procedure miRelValidadeClick(Sender: TObject);
    procedure miComEstoqueMinimoClick(Sender: TObject);
    procedure miNovosAlteradosClick(Sender: TObject);
    procedure miEtiquetaProdutoClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actEstoqueMinimoExecute(Sender: TObject);
    procedure dbeNomeProdutoClickButton(Sender: TObject);
    procedure miRelVencidosClick(Sender: TObject);
  private
  public
    procedure AntesSalvar; override;
  end;

var
  frmProduto: TfrmProduto;

implementation

uses unModeloConsulta, Funcoes, VarGlobal, unEtiquetaProduto,
      unRelatorioListaPrecos, Extensos, uConfiguraRelatorio,
     unPrevProdutosVencimento, Math, uDatabaseutils;

{$R *.dfm}

procedure TfrmProduto.dbeLucroExit(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(zquery1) then
    zquery1.fieldbyname('VENDA').AsFloat :=
      (zquery1.fieldbyname('LUCRO').AsFloat *
       zquery1.fieldbyname('CUSTO').AsFloat) / 100 + zquery1.fieldbyname('CUSTO').AsFloat;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  inherited;
  if Configuracao.EstoqueSenha then
  begin
    dbeEstoqueMinimo.ReadOnly := True;
    dbeEstoque.ReadOnly := True;
  end;

  FieldNames := FN_PRODUTOS;
  DisplayLabels := DL_PRODUTOS;
  aCaption := 'Produtos';
end;

procedure TfrmProduto.miRelPorGrupoClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioProdutoGrupo', 'Produtos por grupo', Self);
end;

procedure TfrmProduto.miRelValidadeClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioProdutoVencimento', 'Produtos vencidos', Self);
end;

procedure TfrmProduto.miComEstoqueMinimoClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioProdutoEstMinForn', 'Produtos com estoque m�nimo', Self);
end;

procedure TfrmProduto.miNovosAlteradosClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioNovoAlterado', 'Produtos novos e alterados', Self);
end;

procedure TfrmProduto.miEtiquetaProdutoClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmEtiquetaProduto', 'Etiquetas de produtos', Self);
end;

procedure TfrmProduto.actPrintExecute(Sender: TObject);
var
  Order: Integer;
  SQLOrder: string;
begin
  inherited;
  Order := FormRadioButtons('Descricao do produto, Preco de venda', 'Ordenar por');
  if Order = 0 then
    SQLOrder := ' order by DESCRICAO'
  else if Order = 1 then
    SQLOrder := ' order by VENDA'
  else
    Exit;
  with TfrmRelatorioListaPrecos.Create(Self) do
  try
    sqldPadrao.Close;
    sqldPadrao.SQL.Clear;
    sqldPadrao.SQL.Text := sqldPadrao.sql.text + SQLOrder;
    sqldPadrao.Open;
    Titulo := 'Lista de precos';
    PrintIfNotEmptyRL(rpLista);
  finally
    Free;
  end;
end;


procedure TfrmProduto.actEstoqueMinimoExecute(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmProEstoqueMinimo', 'Estoque minimo', Self);
end;

procedure TfrmProduto.dbeNomeProdutoClickButton(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmListagemProdutos', 'Listagem de produtos', Self);
end;

procedure TfrmProduto.AntesSalvar;
var
  Repetido: Boolean;
begin
  inherited;
  with TZQuery.Create(nil) do
  try
    Connection := getzconnection;
    SQL.Clear;
    SQL.Text :='select count(1) from PRODUTOS where CODBARRA = '+QuotedStr(dbeCodigoBarra.Text);
    Open;
    Repetido := Fields[0].AsInteger > 0;
  finally
    Free;
  end;

  if (ModoInsert(zquery1) and Repetido) then
  begin
    MsgAviso('Produto com este codigo de barras ja esta cadastrado.');
    Abort;
  end;
end;

procedure TfrmProduto.miRelVencidosClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevProdutosVencimento.Create(Self) do
  try
    sqldPadrao.Close;
    sqldPadrao.SQL.Clear;
    sqldPadrao.SQL.Text :='SELECT'+
                             ' P.CODBARRA,'+
                             ' P.ABREVIACAO AS PRODUTO,'+
                             ' P.DATAVALIDADE AS DATAVENCIMENTO,'+
                             ' U.DESCRICAO AS UNIDADE,'+
                             ' G.DESCRICAO AS GRUPO,'+
                             ' F.RAZAOSOCIAL AS FORNECEDOR,'+
                             ' P.CUSTO AS PRECOCUSTO '+
                             'FROM PRODUTOS P '+
                             'LEFT JOIN UNIDADES U ON (U.CODUNIDADE = P.CODUNIDADE) '+
                             'LEFT JOIN GRUPOS G ON (G.CODGRUPO = P.CODGRUPO) '+
                             'LEFT JOIN FORNECEDORES F ON (F.CODFORNECEDOR = P.CODFORNECEDOR) '+
                             'WHERE (P.DATAVALIDADE < CURRENT_DATE) '+
                             'ORDER BY P.DATAVALIDADE';
    sqldPadrao.Open;
    lbTitulo.Caption := 'Produtos vencidos';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    zquery1.Close;
    Free;
  end;
end;

initialization
  RegisterClass(TfrmProduto);
finalization
  UnRegisterClass(TfrmProduto);
end.

