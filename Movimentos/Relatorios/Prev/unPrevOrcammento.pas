unit unPrevOrcammento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, DBClient, Provider, SqlExpr,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevOrcamento = class(TfrmModeloRelatorio)
    rlgCompras: TRLGroup;
    rlsbDetalhe: TRLSubDetail;
    rlbDetalheProdutos: TRLBand;
    rldbProduto: TRLDBText;
    rldbQtde: TRLDBText;
    rldbCusto: TRLDBText;
    rldbDesconto: TRLDBText;
    rlbColunaDetalhes: TRLBand;
    lbProduto: TRLLabel;
    lbQtde: TRLLabel;
    lbCusto: TRLLabel;
    lbDesconto: TRLLabel;
    rlbSumario: TRLBand;
    lbTotal: TRLLabel;
    rldbTotal: TRLDBText;
    rlbMestre: TRLBand;
    lbNumero: TRLLabel;
    rldbNumero: TRLDBText;
    lbCliente: TRLLabel;
    rldbCliente: TRLDBText;
    lbData: TRLLabel;
    rldbDATA: TRLDBText;
    dsLink: TDataSource;
    sqldDetOrcam: TSQLDataSet;
    cdsDetOrcam: TClientDataSet;
    dsDetOrcam: TDataSource;
    lbVenda: TRLLabel;
    rldbVenda: TRLDBText;
    lbValorDescto: TRLLabel;
    rldbValorDescto: TRLDBText;
    lbSubTotal: TRLLabel;
    rldbSubTotal: TRLDBText;
    lbItens: TRLLabel;
    rldbItens: TRLDBText;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoNOMECLIENTE: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoOBS: TStringField;
    sqldPadraoTOTAL: TFMTBCDField;
    sqldPadraoITENS: TIntegerField;
    sqldPadraoSTATUS: TStringField;
    sqldPadraoCONCLUIDO: TStringField;
    sqldDetOrcamCODIGO: TIntegerField;
    sqldDetOrcamCODPRODUTO: TIntegerField;
    sqldDetOrcamNOMEPRODUTO: TStringField;
    sqldDetOrcamQTDE: TIntegerField;
    sqldDetOrcamCUSTO: TFMTBCDField;
    sqldDetOrcamVENDA: TFMTBCDField;
    sqldDetOrcamDESCTO: TFMTBCDField;
    sqldDetOrcamVALORDESCTO: TFMTBCDField;
    sqldDetOrcamTOTAL: TFMTBCDField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoNOMECLIENTE: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoOBS: TStringField;
    cdsPadraoTOTAL: TFMTBCDField;
    cdsPadraoITENS: TIntegerField;
    cdsPadraoSTATUS: TStringField;
    cdsPadraoCONCLUIDO: TStringField;
    cdsPadraosqldDetOrcam: TDataSetField;
    cdsDetOrcamCODIGO: TIntegerField;
    cdsDetOrcamCODPRODUTO: TIntegerField;
    cdsDetOrcamNOMEPRODUTO: TStringField;
    cdsDetOrcamQTDE: TIntegerField;
    cdsDetOrcamCUSTO: TFMTBCDField;
    cdsDetOrcamVENDA: TFMTBCDField;
    cdsDetOrcamDESCTO: TFMTBCDField;
    cdsDetOrcamVALORDESCTO: TFMTBCDField;
    cdsDetOrcamTOTAL: TFMTBCDField;
    procedure rlbDetalheProdutosBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevOrcamento: TfrmPrevOrcamento;
  cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevOrcamento.rlbDetalheProdutosBeforePrint(Sender: TObject;
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

end.
