unit unPrevCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, DBClient, Provider, SqlExpr,
  RLReport, RLParser, FMTBcd;

type
  TfrmPrevCompras = class(TfrmModeloRelatorio)
    sqldDetalhe: TSQLDataSet;
    dsLink: TDataSource;
    cdsDetalhe: TClientDataSet;
    dsDetalhe: TDataSource;
    rlgCompras: TRLGroup;
    rlbMestre: TRLBand;
    rlsbDetalhe: TRLSubDetail;
    rlbDetalheProdutos: TRLBand;
    rldbProduto: TRLDBText;
    rlbColunaDetalhes: TRLBand;
    lbNumero: TRLLabel;
    rldbNumero: TRLDBText;
    lbFornecedor: TRLLabel;
    rldbFornecedor: TRLDBText;
    lbProduto: TRLLabel;
    rlbSumario: TRLBand;
    lbTotal: TRLLabel;
    lbOperacao: TRLLabel;
    rldbOperacao: TRLDBText;
    lbDataChegada: TRLLabel;
    lbSaida: TRLLabel;
    rlddDataSaida: TRLDBText;
    rldbEntrada: TRLDBText;
    lbAliquota: TRLLabel;
    rldbAliquota: TRLDBText;
    lbQtde: TRLLabel;
    rldbQtde: TRLDBText;
    lbCusto: TRLLabel;
    rldbCusto: TRLDBText;
    lbLucro: TRLLabel;
    rldbLucro: TRLDBText;
    lbVenda: TRLLabel;
    rldbVenda: TRLDBText;
    lbIPI: TRLLabel;
    rldbIPI: TRLDBText;
    lbDesconto: TRLLabel;
    rldbDesconto: TRLDBText;
    sqldPadraoNUMERO: TIntegerField;
    sqldPadraoCODFORNECEDOR: TIntegerField;
    sqldPadraoFORNECEDOR: TStringField;
    sqldPadraoDATANOTA: TDateField;
    sqldPadraoDATAENTRADA: TDateField;
    sqldPadraoOPERACAO: TStringField;
    sqldPadraoDESCONTO: TFMTBCDField;
    sqldPadraoICMS: TFMTBCDField;
    sqldPadraoIPI: TFMTBCDField;
    sqldPadraoFRETE: TFMTBCDField;
    sqldPadraoDESPESAS: TFMTBCDField;
    sqldPadraoTOTALPRODUTO: TFMTBCDField;
    sqldPadraoTOTAL: TFMTBCDField;
    sqldPadraoOBS: TMemoField;
    sqldPadraoCFOP: TStringField;
    sqldPadraoBAIXADO: TStringField;
    sqldPadraoCONCLUIDA: TStringField;
    sqldDetalheNUMERO: TIntegerField;
    sqldDetalheCODBARRA: TStringField;
    sqldDetalhePRODUTO: TStringField;
    sqldDetalheALIQUOTA: TStringField;
    sqldDetalheQTDE: TIntegerField;
    sqldDetalheTOTAL: TFMTBCDField;
    sqldDetalheCUSTO: TFMTBCDField;
    sqldDetalheLUCRO: TIntegerField;
    sqldDetalheVENDA: TFMTBCDField;
    sqldDetalheIPI: TFMTBCDField;
    sqldDetalheDESCONTO: TFMTBCDField;
    cdsPadraoNUMERO: TIntegerField;
    cdsPadraoCODFORNECEDOR: TIntegerField;
    cdsPadraoFORNECEDOR: TStringField;
    cdsPadraoDATANOTA: TDateField;
    cdsPadraoDATAENTRADA: TDateField;
    cdsPadraoOPERACAO: TStringField;
    cdsPadraoDESCONTO: TFMTBCDField;
    cdsPadraoICMS: TFMTBCDField;
    cdsPadraoIPI: TFMTBCDField;
    cdsPadraoFRETE: TFMTBCDField;
    cdsPadraoDESPESAS: TFMTBCDField;
    cdsPadraoTOTALPRODUTO: TFMTBCDField;
    cdsPadraoTOTAL: TFMTBCDField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoCFOP: TStringField;
    cdsPadraoBAIXADO: TStringField;
    cdsPadraoCONCLUIDA: TStringField;
    cdsPadraosqldDetalhe: TDataSetField;
    cdsDetalheNUMERO: TIntegerField;
    cdsDetalheCODBARRA: TStringField;
    cdsDetalhePRODUTO: TStringField;
    cdsDetalheALIQUOTA: TStringField;
    cdsDetalheQTDE: TIntegerField;
    cdsDetalheTOTAL: TFMTBCDField;
    cdsDetalheCUSTO: TFMTBCDField;
    cdsDetalheLUCRO: TIntegerField;
    cdsDetalheVENDA: TFMTBCDField;
    cdsDetalheIPI: TFMTBCDField;
    cdsDetalheDESCONTO: TFMTBCDField;
    procedure rlbDetalheProdutosBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

  public
    Titulo: String;

  end;

var
  frmPrevCompras: TfrmPrevCompras;
  Cor: Boolean = True;

implementation

uses VarGlobal;

{$R *.dfm}

procedure TfrmPrevCompras.rlbDetalheProdutosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if Configuracao.RelZebrado then
  begin
    if Cor then
    begin
      Cor := False;
      rlbDetalheProdutos.Color := $00F0F0F0;
    end
    else
    begin
      Cor := True;
      rlbDetalheProdutos.Color := clWhite;
    end;
  end;
end;

procedure TfrmPrevCompras.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := Trim(Titulo);
  lbTotal.Caption := 'Total da compra: '+FormatFloat('#,##0.00', cdsPadraoTOTALPRODUTO.AsFloat);
end;

end.
