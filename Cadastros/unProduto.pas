unit unProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, ConstPadrao,
   Mask, DBCtrls,  FMTBcd, System.Actions;

type
  TfrmProduto = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldUnidade: TSQLDataSet;
    dspUnidade: TDataSetProvider;
    cdsUnidade: TClientDataSet;
    sqldGrupo: TSQLDataSet;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    sqldAliquota: TSQLDataSet;
    dspAliquota: TDataSetProvider;
    cdsAliquota: TClientDataSet;
    sqldForn: TSQLDataSet;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    cdsUnidadeCODUNIDADE: TIntegerField;
    cdsUnidadeDESCRICAO: TStringField;
    cdsGrupoCODGRUPO: TIntegerField;
    cdsGrupoDESCRICAO: TStringField;
    cdsAliquotaCODALIQUOTA: TIntegerField;
    cdsAliquotaDESCRICAO: TStringField;
    cdsFornCODFORNECEDOR: TIntegerField;
    cdsFornFANTAZIA: TStringField;
    cdsFornCNPJ: TStringField;
    cdsFornTELEFONE: TStringField;
    dbeCodigoInterno: TDBEdit;
    dbeCodigoBarra: TDBEdit;
    dbeNomeProduto: TDBEdit;
    dbePeso: TDBEdit;
    dbdValidade: TDBEdit;
    dbePrecoPromocao: TDBEdit;
    dbePrecoCusto: TDBEdit;
    dbeLucro: TDBEdit;
    dbePrecoVenda: TDBEdit;
    dbeEstoque: TDBEdit;
    dbeEstoqueMinimo: TDBEdit;
    dbeTributacao: TDBEdit;
    dbeValorEstoque: TDBEdit;
    dbeQtdeRecebida: TDBEdit;
    dbeFornecedor: TDBEdit;
    dbeGrupo: TDBEdit;
    dbeUnidade: TDBEdit;
    cdsPadraoIDPRODUTO: TIntegerField;
    cdsPadraoCODBARRA: TStringField;
    cdsPadraoREFERENCIA: TStringField;
    cdsPadraoCODFORNECEDOR: TIntegerField;
    cdsPadraoFORNECEDOR: TStringField;
    cdsPadraoCODGRUPO: TIntegerField;
    cdsPadraoGRUPO: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoABREVIACAO: TStringField;
    cdsPadraoDATAVALIDADE: TDateField;
    cdsPadraoCODUNIDADE: TIntegerField;
    cdsPadraoUNIDADE: TStringField;
    cdsPadraoIDALIQUOTA: TIntegerField;
    cdsPadraoALIQUOTA: TStringField;
    cdsPadraoNOVO: TIntegerField;
    cdsPadraoALTERADO: TIntegerField;
    cdsPadraoDATARECEBIDA: TDateField;
    cdsPadraoEXCLUIR: TStringField;
    actEstoqueMinimo: TAction;
    sqldPadraoIDPRODUTO: TIntegerField;
    sqldPadraoCODBARRA: TStringField;
    sqldPadraoREFERENCIA: TStringField;
    sqldPadraoCODFORNECEDOR: TIntegerField;
    sqldPadraoFORNECEDOR: TStringField;
    sqldPadraoCODGRUPO: TIntegerField;
    sqldPadraoGRUPO: TStringField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoABREVIACAO: TStringField;
    sqldPadraoDATAVALIDADE: TDateField;
    sqldPadraoCODUNIDADE: TIntegerField;
    sqldPadraoUNIDADE: TStringField;
    sqldPadraoPESO: TFMTBCDField;
    sqldPadraoCUSTO: TFMTBCDField;
    sqldPadraoLUCRO: TFMTBCDField;
    sqldPadraoVENDA: TFMTBCDField;
    sqldPadraoESTOQUE: TIntegerField;
    sqldPadraoESTOQUEMINIMO: TIntegerField;
    sqldPadraoIDALIQUOTA: TIntegerField;
    sqldPadraoALIQUOTA: TStringField;
    sqldPadraoNOVO: TIntegerField;
    sqldPadraoALTERADO: TIntegerField;
    sqldPadraoDATARECEBIDA: TDateField;
    sqldPadraoEXCLUIR: TStringField;
    cdsPadraoPESO: TFMTBCDField;
    cdsPadraoCUSTO: TFMTBCDField;
    cdsPadraoLUCRO: TFMTBCDField;
    cdsPadraoVENDA: TFMTBCDField;
    cdsPadraoESTOQUE: TIntegerField;
    cdsPadraoESTOQUEMINIMO: TIntegerField;
    sqldPadraoQTDERECEBIDA: TIntegerField;
    cdsPadraoQTDERECEBIDA: TIntegerField;
    sqldPadraoPRECO_PROMOCAO: TFMTBCDField;
    sqldPadraoPROMOCAO: TStringField;
    cdsPadraoPRECO_PROMOCAO: TFMTBCDField;
    cdsPadraoPROMOCAO: TStringField;
    dbckbPromocao: TDBCheckBox;
    bvlLinha1: TBevel;
    bvlLinha2: TBevel;
    dbeReferencia: TDBEdit;
    bvlLinha3: TBevel;
    dbeDataReceb: TDBEdit;
    sqldPadraoOBS: TMemoField;
    cdsPadraoOBS: TMemoField;
    btnObs: TBitBtn;
    imgCodbarras: TImage;
    pnlCodBarra: TPanel;
    dbtxtCodBarra: TDBText;
    sqldPadraoVALOR_ESTOQUE: TSingleField;
    cdsPadraoVALOR_ESTOQUE: TSingleField;
    procedure dbeUnidadeClickButton(Sender: TObject);
    procedure dbeFornecedorClickButton(Sender: TObject);
    procedure dbeGrupoClickButton(Sender: TObject);
    procedure dbeTributacaoClickButton(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure dbeEstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure dbeEstoqueMinimoKeyPress(Sender: TObject; var Key: Char);
    procedure dbePrecoCustoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeLucroKeyPress(Sender: TObject; var Key: Char);
    procedure dbePrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure dbePrecoPromocaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbePesoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeLucroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure miRelPorGrupoClick(Sender: TObject);
    procedure miRelValidadeClick(Sender: TObject);
    procedure miComEstoqueMinimoClick(Sender: TObject);
    procedure miNovosAlteradosClick(Sender: TObject);
    procedure miEtiquetaProdutoClick(Sender: TObject);
    procedure cdsPadraoAfterCancel(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
    procedure dbePrecoVendaExit(Sender: TObject);
    procedure cdsPadraoAfterEdit(DataSet: TDataSet);
    procedure dbeNomeProdutoChange(Sender: TObject);
    procedure cdsPadraoCODFORNECEDORValidate(Sender: TField);
    procedure cdsPadraoCODGRUPOValidate(Sender: TField);
    procedure cdsPadraoCODUNIDADEValidate(Sender: TField);
    procedure cdsPadraoIDALIQUOTAValidate(Sender: TField);
    procedure actEstoqueMinimoExecute(Sender: TObject);
    procedure dbeNomeProdutoClickButton(Sender: TObject);
    procedure dbeCodigoBarraKeyPress(Sender: TObject; var Key: Char);
    procedure cdsPadraoCODBARRASetText(Sender: TField; const Text: String);
    procedure miAjustaCodBarraClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure btnObsClick(Sender: TObject);
    procedure miRelVencidosClick(Sender: TObject);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
    procedure dspPadraoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: WideString);
  private
    procedure LiberaEstoque(Senha: string);
  public
    procedure AntesSalvar; override;
  end;

var
  frmProduto: TfrmProduto;

implementation

uses unModeloConsulta, Funcoes, VarGlobal, unEtiquetaProduto,
      unRelatorioListaPrecos, Extensos, uConfiguraRelatorio,
     unPrevProdutosVencimento, unAguarde, System.Math, uDatabaseutils;

{$R *.dfm}

procedure TfrmProduto.dbeUnidadeClickButton(Sender: TObject);
begin
  inherited;
//  if cdsPadrao.State in [dsInsert, dsEdit] then
//    if TfrmModeloConsulta.Execute('Unidades', cdsUnidade, FN_UNIDADES, DL_UNIDADES) then
//    begin
//      cdsPadraoCODUNIDADE.AsInteger := cdsUnidadeCODUNIDADE.AsInteger;
//    end;
end;

procedure TfrmProduto.dbeFornecedorClickButton(Sender: TObject);
begin
  inherited;
//  if cdsPadrao.State in [dsInsert, dsEdit] then
//    if TfrmModeloConsulta.Execute('Fornecedor', cdsForn, FN_FORN, DL_FORN) then
//    begin
//      cdsPadraoCODFORNECEDOR.AsInteger := cdsFornCODFORNECEDOR.AsInteger;
//    end;
end;

procedure TfrmProduto.dbeGrupoClickButton(Sender: TObject);
begin
  inherited;
//  if cdsPadrao.State in [dsInsert, dsEdit] then
//    if TfrmModeloConsulta.Execute('Grupo', cdsGrupo, FN_GRUPOS, DL_GRUPOS) then
//    begin
//      cdsPadraoCODGRUPO.AsInteger := cdsGrupoCODGRUPO.AsInteger;
//    end;
end;

procedure TfrmProduto.dbeTributacaoClickButton(Sender: TObject);
begin
  inherited;
//  if cdsPadrao.State in [dsInsert, dsEdit] then
//    if TfrmModeloConsulta.Execute('Tributação', cdsAliquota, FN_ALIQUOTAS, DL_ALIQUOTAS) then
//    begin
//      cdsPadraoIDALIQUOTA.AsInteger := cdsAliquotaCODALIQUOTA.AsInteger;
//    end;
end;

procedure TfrmProduto.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('PRODUTOS', cdsPadraoIDPRODUTO, GetConnection);
  cdsPadraoNOVO.AsInteger          := 1;
  cdsPadraoALTERADO.AsInteger      := 0;
  cdsPadraoEXCLUIR.AsString        := 'N';
  cdsPadraoPROMOCAO.AsString       := 'N';
  cdsPadraoESTOQUE.AsFloat         := 0;
  cdsPadraoQTDERECEBIDA.AsFloat    := 0;
  cdsPadraoPESO.AsFloat            := 1;
  cdsPadraoDATARECEBIDA.AsDateTime := Date;
  cdsPadraoESTOQUEMINIMO.AsFloat   := Configuracao.EstoquePadrao;
  cdsPadraoPRECO_PROMOCAO.AsFloat  := Configuracao.DescontoPadrao;
  cdsPadraoIDALIQUOTA.AsInteger    := Configuracao.AliquotaPadrao;
end;

procedure TfrmProduto.dbeEstoqueKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmProduto.dbeEstoqueMinimoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmProduto.dbePrecoCustoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmProduto.dbeLucroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmProduto.dbePrecoVendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmProduto.dbePrecoPromocaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmProduto.dbePesoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //ControlarTeclas(Key);
end;

procedure TfrmProduto.dbeLucroExit(Sender: TObject);
begin
  inherited;
  if ModoInsertEdit(cdsPadrao) then
    cdsPadraoVENDA.AsFloat :=
      (cdsPadraoLUCRO.AsFloat * cdsPadraoCUSTO.AsFloat) / 100 + cdsPadraoCUSTO.AsFloat;
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

procedure TfrmProduto.LiberaEstoque(Senha: string);
var
  SenhaDigitada: string;
begin
  SenhaDigitada := EmptyStr;
//  if PassWord(SenhaDigitada, '*') then
//  begin
//    if (Decript(Senha) = SenhaDigitada) then
//    begin
//      actEdit.Execute;
//      dbeEstoqueMinimo.ReadOnly := False;
//      dbeEstoque.ReadOnly := False;
//    end
//    else
//      MsgErro('Senha Incorreta.');
//  end;
end;

procedure TfrmProduto.dbeEstoqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not Configuracao.EstoqueSenha then Exit;
  if Key = VK_F10 then
    LiberaEstoque(Configuracao.SenhaEstoque);
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
  ChamaForm('TfrmRelatorioProdutoEstMinForn', 'Produtos com estoque mínimo', Self);
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

procedure TfrmProduto.cdsPadraoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  if Configuracao.EstoqueSenha then
  begin
    dbeEstoqueMinimo.ReadOnly := True;
    dbeEstoque.ReadOnly := True;
  end;
end;

procedure TfrmProduto.actPrintExecute(Sender: TObject);
var
  Order: Integer;
  SQLOrder: string;
begin
  inherited;
  Order := FormRadioButtons('Descrição do produto, Preço de venda', 'Ordenar por');
  if Order = 0 then
    SQLOrder := ' order by DESCRICAO'
  else if Order = 1 then
    SQLOrder := ' order by VENDA'
  else
    Exit;
  with TfrmRelatorioListaPrecos.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.CommandText := '';
    cdsPadrao.CommandText := sqldPadrao.CommandText + SQLOrder;
    cdsPadrao.Open;
    Titulo := 'Lista de preços';
    PrintIfNotEmptyRL(rpLista);
  finally
    Free;
  end;
end;

procedure TfrmProduto.dbePrecoVendaExit(Sender: TObject);
begin
  inherited;
 // dbeLucro.Text :=
  //  FloatToStr(RoundTo(StrToFloatDef(CalcMargem(dbePrecoVenda.Text, dbePrecoCusto.Text), 0), 2));
end;

procedure TfrmProduto.cdsPadraoAfterEdit(DataSet: TDataSet);
begin
  inherited;
  cdsPadraoNOVO.AsInteger := 0;
  cdsPadraoALTERADO.AsInteger := 1;
end;

procedure TfrmProduto.dbeNomeProdutoChange(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsInsert, dsEdit] then
    cdsPadraoABREVIACAO.AsString := Trim(AnsiUpperCase(dbeNomeProduto.Text));
end;

procedure TfrmProduto.cdsPadraoCODFORNECEDORValidate(Sender: TField);
var
  NomeForn: string;
begin
  inherited;
  NomeForn := GetFieldByID(GetConnection, 'FORNECEDORES', 'FANTAZIA', 'CODFORNECEDOR',
    Sender.AsInteger);
  if NomeForn <> '' then
    cdsPadraoFORNECEDOR.AsString := NomeForn;
end;

procedure TfrmProduto.cdsPadraoCODGRUPOValidate(Sender: TField);
var
  NomeGrupo: string;
begin
  inherited;
  NomeGrupo := GetFieldByID(GetConnection, 'GRUPOS', 'DESCRICAO', 'CODGRUPO',
    Sender.AsInteger);
  if NomeGrupo <> '' then
    cdsPadraoGRUPO.AsString := NomeGrupo;
end;

procedure TfrmProduto.cdsPadraoCODUNIDADEValidate(Sender: TField);
var
  NomeUn: string;
begin
  inherited;
  NomeUn := GetFieldByID(GetConnection, 'UNIDADES', 'DESCRICAO', 'CODUNIDADE',
    Sender.AsInteger);
  if NomeUn <> '' then
    cdsPadraoUNIDADE.AsString := NomeUn;
end;

procedure TfrmProduto.cdsPadraoIDALIQUOTAValidate(Sender: TField);
var
  NomeAliq: string;
begin
  inherited;
  NomeAliq := GetFieldByID(GetConnection, 'ALIQUOTAS', 'DESCRICAO', 'CODALIQUOTA',
    Sender.AsInteger);
  if NomeAliq <> '' then
    cdsPadraoALIQUOTA.AsString := NomeAliq;
end;

procedure TfrmProduto.actEstoqueMinimoExecute(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmProEstoqueMinimo', 'Estoque mínimo', Self);
end;

procedure TfrmProduto.dbeNomeProdutoClickButton(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmListagemProdutos', 'Listagem de produtos', Self);
end;

procedure TfrmProduto.dbeCodigoBarraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if not Configuracao.LetraNumCodBarra then
    //ControlarTeclas(Key);
end;

procedure TfrmProduto.AntesSalvar;
var
  Repetido: Boolean;
begin
  inherited;
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText := 'select count(1) from PRODUTOS where CODBARRA = '+QuotedStr(dbeCodigoBarra.Text);
    Open;
    Repetido := Fields[0].AsInteger > 0;
  finally
    Free;
  end;

  if (ModoInsert(cdsPadrao) and Repetido) then
  begin
    MsgAviso('Produto com este código de barras já está cadastrado.');
    Abort;
  end;
end;

procedure TfrmProduto.cdsPadraoCODBARRASetText(Sender: TField;
  const Text: String);
var
  codigo: string;
begin
  inherited;
  if Length(Text) <> 13 then
  begin
    if MsgSN('Deseja gerar cóigo de barras automáticamente?') then
      codigo := GeraCodigoEAN13(Text);
  end;

  if VerificaEAN13(codigo) then
    Sender.AsString := codigo
  else
    MsgCuidado('Este código de barras parece estar incorreto, verifique.');
  Sender.AsString := codigo;
end;

procedure TfrmProduto.miAjustaCodBarraClick(Sender: TObject);

  procedure AjustaRequires(b: Boolean);
  begin
    cdsPadraoCODBARRA.Required      := b;
    cdsPadraoCODFORNECEDOR.Required := b;
    cdsPadraoCODGRUPO.Required      := b;
    cdsPadraoDESCRICAO.Required     := b;
    cdsPadraoCODUNIDADE.Required    := b;
    cdsPadraoCUSTO.Required         := b;
  end;

var
  Erro: Boolean;
begin
  inherited;
  Erro := False;
  try
    try
      TfrmAguarde.Execute('Ajustando, aguarde...');
      AjustaRequires(False); // dexa todos os fields como não requeridos para evitar erros...
      cdsPadrao.First;
      cdsPadrao.DisableControls;
      while not cdsPadrao.Eof do
      begin
        if Length(Trim(cdsPadraoCODBARRA.AsString)) < 13 then
        begin
          cdsPadrao.Edit;
          cdsPadraoCODBARRA.AsString := GeraCodigoEAN13(Trim(cdsPadraoCODBARRA.AsString));
          cdsPadrao.Post;
        end;
        cdsPadrao.Next;
      end;
      cdsPadrao.ApplyUpdates(0);
    except
      Erro := True;
      raise Exception.Create('Erro ao ajustar códigos de barras.');
    end;
  finally
    BringWindowToTop(Handle);
    FreeAndNil(frmAguarde);
    if not Erro then
      MsgAviso('Ajuste de códigos de barras concluído!');
    AjustaRequires(True); // volta os campos requeridos...
    cdsPadrao.EnableControls;
  end;
end;

procedure TfrmProduto.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  //miAjustaCodBarra.Enabled := not EditModes;
end;

procedure TfrmProduto.dspPadraoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: WideString);
begin
  inherited;
  TableName := 'PRODUTOS';
end;

procedure TfrmProduto.btnObsClick(Sender: TObject);
begin
  inherited;
  FormMemo(dsPadrao, 'OBS');
end;

procedure TfrmProduto.miRelVencidosClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevProdutosVencimento.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.CommandText := 'SELECT'+
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
    cdsPadrao.Open;
    //lbTitulo.Caption := 'Produtos vencidos';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmProduto.cdsPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  //CriaCodigo(cdsPadraoCODBARRA.AsString, imgCodbarras.Canvas);
  imgCodbarras.Repaint;
end;

initialization
  RegisterClass(TfrmProduto);
finalization
  UnRegisterClass(TfrmProduto);
end.

