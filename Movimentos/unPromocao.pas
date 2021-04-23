unit unPromocao;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, Buttons, ExtCtrls, ComCtrls,
  Grids, DBGrids, memds, Sqldb, ConstPadrao, DateUtils, FMTBcd, lcltype;

type
  TfrmPromocao = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoPRODUTO: TIntegerField;
    sqldPadraoABREVIACAO: TStringField;
    sqldPadraoVENDA: TFMTBCDField;
    sqldPadraoPRECO: TFMTBCDField;
    sqldPadraoINICIO: TDateField;
    sqldPadraoFIM: TDateField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoPRODUTO: TIntegerField;
    cdsPadraoABREVIACAO: TStringField;
    cdsPadraoVENDA: TFMTBCDField;
    cdsPadraoPRECO: TFMTBCDField;
    cdsPadraoINICIO: TDateField;
    cdsPadraoFIM: TDateField;
    sqldProduto: TSQLQuery;
    dspProduto: TComponent;
    cdsProduto: TMemDataSet;
    sqldProdutoCODBARRA: TStringField;
    sqldProdutoABREVIACAO: TStringField;
    sqldProdutoVENDA: TFMTBCDField;
    cdsProdutoCODBARRA: TStringField;
    cdsProdutoABREVIACAO: TStringField;
    cdsProdutoVENDA: TFMTBCDField;
    sqldProdutoIDPRODUTO: TIntegerField;
    cdsProdutoIDPRODUTO: TIntegerField;
    sqldPadraoDESCONTO: TFMTBCDField;
    cdsPadraoDESCONTO: TFMTBCDField;
    sqldSpDesmarcaPromocao: TSQLQuery;
    sqldGrupo: TSQLQuery;
    dspGrupo: TComponent;
    cdsGrupo: TMemDataSet;
    cdsGrupoCODGRUPO: TIntegerField;
    cdsGrupoDESCRICAO: TStringField;
    sqldGrupoCODGRUPO: TIntegerField;
    sqldGrupoDESCRICAO: TStringField;
    sqldProdutoCODGRUPO: TIntegerField;
    cdsProdutoCODGRUPO: TIntegerField;
    sqldForn: TSQLQuery;
    dspForn: TComponent;
    cdsForn: TMemDataSet;
    sqldProdutoCODFORNECEDOR: TIntegerField;
    cdsProdutoCODFORNECEDOR: TIntegerField;
    sqldFornCODFORNECEDOR: TIntegerField;
    sqldFornFANTAZIA: TStringField;
    sqldFornCNPJ: TStringField;
    sqldFornTELEFONE: TStringField;
    cdsFornCODFORNECEDOR: TIntegerField;
    cdsFornFANTAZIA: TStringField;
    cdsFornCNPJ: TStringField;
    cdsFornTELEFONE: TStringField;
    dbgrdPromocao: TDBGrid;
    procedure dbgrdPromocaoEditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure cdsPadraoPRODUTOValidate(Sender: TField);
    procedure cdsPadraoDESCONTOChange(Sender: TField);
    procedure actPrintExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miProdutosGrupoClick(Sender: TObject);
    procedure miExcluirtodasClick(Sender: TObject);
    procedure miProdutosFornecedorClick(Sender: TObject);
  private
    SQLProduto, SQLGrupo, SQLForn: string;
  protected
    procedure AfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
  public
    procedure AntesSalvar; override;
  end;

var
  frmPromocao: TfrmPromocao;

implementation

uses Funcoes, unModeloConsulta, unPrevPromocao, uConfiguraRelatorio, udatabaseutils;

{$R *.dfm}

procedure TfrmPromocao.dbgrdPromocaoEditButtonClick(Sender: TObject);
begin
  inherited;
  cdsProduto.Close;
  sqldProduto.SQL.Clear; sqldProduto.SQL.Text :=SQLProduto;
  cdsProduto.Open;

//  if ModoInsertEdit(cdsPadrao) then
//    if TfrmModeloConsulta.Execute('Produto', cdsProduto, FN_PRODUTOS, DL_PRODUTOS) then
//    begin
//      if not SQLFind('PROMOCAO', 'PRODUTO', IntToStr(cdsProdutoIDPRODUTO.AsInteger), sqldPadrao.SQLConnection) then
//      begin
//        cdsPadraoPRODUTO.AsInteger := cdsProdutoIDPRODUTO.AsInteger;
//        cdsPadraoVENDA.AsFloat     := cdsProdutoVENDA.AsFloat;
//        cdsPadraoINICIO.AsDateTime := Date;
//        cdsPadraoFIM.AsDateTime    := Date;
//      end
//      else
//        MsgCuidado('Este produto j� est� em promo��o.');
//    end;
end;

procedure TfrmPromocao.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames    := FN_PROMOCAO;
  DisplayLabels := DL_PROMOCAO;
  aCaption      := 'Promo��o';

  SQLProduto    := sqldProduto.sql.text;
  SQLGrupo      := sqldGrupo.sql.text;
  SQLForn       := sqldForn.sql.text;
end;

procedure TfrmPromocao.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('PROMOCAO', cdsPadraoCODIGO, sqldPadrao.SQLConnection);
  cdsPadraoPRODUTO.FocusControl;
end;

procedure TfrmPromocao.cdsPadraoPRODUTOValidate(Sender: TField);
var
  NomePro: string;
begin
  inherited;
  NomePro := GetFieldByID(sqldPadrao.SQLConnection, 'PRODUTOS', 'ABREVIACAO', 'IDPRODUTO',
    Sender.AsInteger);
  if NomePro <> '' then
    cdsPadraoABREVIACAO.AsString := NomePro;
end;

procedure TfrmPromocao.cdsPadraoDESCONTOChange(Sender: TField);
var
  Desconto: Extended;
begin
  inherited;
  Desconto := (cdsPadraoDESCONTO.AsFloat * cdsPadraoVENDA.AsFloat) / 100;
  cdsPadraoPRECO.AsFloat := (cdsPadraoVENDA.AsFloat - Desconto);
end;

procedure TfrmPromocao.actPrintExecute(Sender: TObject);
begin
  with TfrmPrevPromocao.Create(nil) do
  try
    cdsPadrao.Close;
    cdsPadrao.Open;
    //lbTitulo.Caption := 'Listagem de promo�oes';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmPromocao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cdsProduto.Active then
    cdsProduto.Close;
  inherited;
end;

procedure TfrmPromocao.AntesSalvar;
begin
  inherited;
  if cdsPadraoDESCONTO.IsNull then
  begin
    MsgCuidado('O Desconto do produto para promo��o deve ser informado.');
    cdsPadraoDESCONTO.FocusControl;
    Abort;
  end;
end;

procedure TfrmPromocao.AfterShow(var Msg: TMessage);

  function PromocoesVencidas: Boolean;
  begin
    Result :=
      SelecTFMTBCDField('select count(1) from PROMOCAO where FIM < CURRENT_DATE',
      sqldPadrao.SQLConnection) > 0;
  end;

begin
  if (not cdsPadrao.IsEmpty) and PromocoesVencidas then
    if MsgSN('Deseja eliminar autom�ticamente os produtos que ultrapassaram a data final da promo��o?') then
    begin
      sqldSpDesmarcaPromocao.ExecSQL;
      //actLimparFiltro.Execute;
    end;
  inherited;
end;

procedure TfrmPromocao.miProdutosGrupoClick(Sender: TObject);
var
  Desconto, DiasPromocao: Real;
begin
  inherited;
  cdsGrupo.Close;
  sqldGrupo.SQL.Clear; sqldGrupo.SQL.Text :=SQLGrupo;
  cdsGrupo.Open;

//  if TfrmModeloConsulta.Execute('Grupo', cdsGrupo, FN_GRUPOS, DL_GRUPOS) then
//  begin
//    if not cdsProduto.Active then
//      cdsProduto.Open;
//
//    cdsProduto.Filtered := False;
//    cdsProduto.Filter := 'CODGRUPO = '+QuotedStr(IntToStr(cdsGrupoCODGRUPO.AsInteger));
//    cdsProduto.Filtered := True;
//
//    if not cdsProduto.IsEmpty then
//    begin
//
//      if not ObterValor(Desconto, '0 %', 'Desconto') then
//      begin
//        MsgErro('O valor de desconto deve ser informado.');
//        Exit;
//      end;
//
//      if not ObterValor(DiasPromocao, '0 dias', 'Dias de promo��o') then
//      begin
//        MsgErro('Os dias de promo��o devem ser informados.');
//        Exit;
//      end;
//
//      cdsProduto.First;
//      while not cdsProduto.Eof do
//      begin
//        if not SQLFind('PROMOCAO', 'PRODUTO', IntToStr(cdsProdutoIDPRODUTO.AsInteger), sqldPadrao.SQLConnection) then
//        begin
//          cdsPadrao.Insert;
//          cdsPadraoPRODUTO.AsInteger := cdsProdutoIDPRODUTO.AsInteger;
//          cdsPadraoVENDA.AsFloat     := cdsProdutoVENDA.AsFloat;
//          cdsPadraoDESCONTO.AsFloat  := Desconto;
//          cdsPadraoINICIO.AsDateTime := Date;
//          cdsPadraoFIM.AsDateTime    := IncDay(Date, Trunc(DiasPromocao));
//          //cdsPadrao.ApplyUpdates(0);
//        end;
//        cdsProduto.Next;
//      end;
//      MsgAviso('Inser��o efetuda com sucesso!');
//    end
//    else
//      MsgErro(UM_PESQUISAVAZIO);
//
//    cdsProduto.Close;
//  end;
end;

procedure TfrmPromocao.miExcluirtodasClick(Sender: TObject);
begin
  inherited;
  if not MsgSN('Deseja realmente excluir todas as promo��es?') then
    Exit;
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    SQL.Clear; SQL.Text :='delete from PROMOCAO';
    ExecSQL;
  finally
    Free;
    cdsPadrao.Close;
    cdsPadrao.Open;
  end;
end;

procedure TfrmPromocao.miProdutosFornecedorClick(Sender: TObject);
var
  Desconto, DiasPromocao: Real;
begin
  inherited;
  cdsForn.Close;
  sqldForn.SQL.Clear; sqldForn.SQL.Text :=SQLForn;
  cdsForn.Open;

//  if TfrmModeloConsulta.Execute('Fornecedor', cdsForn, FN_FORN, DL_FORN) then
//  begin
//    if not cdsProduto.Active then
//      cdsProduto.Open;
//
//    cdsProduto.Filtered := False;
//    cdsProduto.Filter := 'CODFORNECEDOR = '+QuotedStr(IntToStr(cdsFornCODFORNECEDOR.AsInteger));
//    cdsProduto.Filtered := True;
//
//    if not cdsProduto.IsEmpty then
//    begin
//
//      if not ObterValor(Desconto, '0 %', 'Desconto') then
//      begin
//        MsgErro('O valor de desconto deve ser informado.');
//        Exit;
//      end;
//
//      if not ObterValor(DiasPromocao, '0 dias', 'Dias de promo��o') then
//      begin
//        MsgErro('Os dias de promo��o devem ser informados.');
//        Exit;
//      end;
//
//      cdsProduto.First;
//      while not cdsProduto.Eof do
//      begin
//        if not SQLFind('PROMOCAO', 'PRODUTO', IntToStr(cdsProdutoIDPRODUTO.AsInteger), sqldPadrao.SQLConnection) then
//        begin
//          cdsPadrao.Insert;
//          cdsPadraoPRODUTO.AsInteger := cdsProdutoIDPRODUTO.AsInteger;
//          cdsPadraoVENDA.AsFloat     := cdsProdutoVENDA.AsFloat;
//          cdsPadraoDESCONTO.AsFloat  := Desconto;
//          cdsPadraoINICIO.AsDateTime := Date;
//          cdsPadraoFIM.AsDateTime    := IncDay(Date, Trunc(DiasPromocao));
//          //cdsPadrao.ApplyUpdates(0);
//        end;
//        cdsProduto.Next;
//      end;
//      MsgAviso('Inser��o efetuda com sucesso!');
//    end
//    else
//      MsgErro(UM_PESQUISAVAZIO);
//
//    cdsProduto.Close;
//  end;
end;

initialization
  RegisterClass(TfrmPromocao);
finalization
  UnRegisterClass(TfrmPromocao);
end.

