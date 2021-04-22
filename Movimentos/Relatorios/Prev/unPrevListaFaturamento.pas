unit unPrevListaFaturamento;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TDataSetField = TDataset;
  TfrmPrevListaFaturamento = class(TfrmModeloRelatorio)
    rlbColunas: TRLBand;
    dsDetalhe: TDataSource;
    cdsDetalhe: TMemDataSet;
    dsLink: TDataSource;
    sqldDetalhe: TSQLQuery;
    lbFornecedor: TRLLabel;
    rldbForn: TRLDBText;
    rlsbDetalhes: TRLSubDetail;
    rlbDetalhe: TRLBand;
    rldbCodBarra: TRLDBText;
    rldbProduto: TRLDBText;
    rldbPrecoCusto: TRLDBText;
    rldbLucro: TRLDBText;
    rldbPrecoVenda: TRLDBText;
    rlbColunaProduto: TRLBand;
    lbCodBarra: TRLLabel;
    lbProduto: TRLLabel;
    lbCusto: TRLLabel;
    lbLucro: TRLLabel;
    lbPrecoVenda: TRLLabel;
    rlblData: TRLLabel;
    rldbtDataNota: TRLDBText;
    rlblNroNota: TRLLabel;
    rldbtNroNota: TRLDBText;
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
    sqldPadraoBAIXADO: TStringField;
    sqldPadraoCONCLUIDA: TStringField;
    sqldDetalheNUMERO: TIntegerField;
    sqldDetalheCODBARRA: TStringField;
    sqldDetalhePRODUTO: TStringField;
    sqldDetalheALIQUOTA: TIntegerField;
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
    cdsPadraoBAIXADO: TStringField;
    cdsPadraoCONCLUIDA: TStringField;
    cdsPadraosqldDetalhe: TDataSetField;
    cdsDetalheNUMERO: TIntegerField;
    cdsDetalheCODBARRA: TStringField;
    cdsDetalhePRODUTO: TStringField;
    cdsDetalheALIQUOTA: TIntegerField;
    cdsDetalheQTDE: TIntegerField;
    cdsDetalheTOTAL: TFMTBCDField;
    cdsDetalheCUSTO: TFMTBCDField;
    cdsDetalheLUCRO: TIntegerField;
    cdsDetalheVENDA: TFMTBCDField;
    cdsDetalheIPI: TFMTBCDField;
    cdsDetalheDESCONTO: TFMTBCDField;
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevListaFaturamento: TfrmPrevListaFaturamento;
  Cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevListaFaturamento.rlbDetalheBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if Configuracao.RelZebrado then
  begin
    if Cor then
    begin
      Cor := False;
      rlbDetalhe.Color := $00F0F0F0;
    end
    else
    begin
      Cor := True;
      rlbDetalhe.Color := clWhite;
    end;
  end;  
end;

end.
