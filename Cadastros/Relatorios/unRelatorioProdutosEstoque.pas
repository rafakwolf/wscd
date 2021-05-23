unit unRelatorioProdutosEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, FMTBcd, DB, DBClient, Provider, SqlExpr,
  RLReport, RLParser;

type
  TfrmRelatorioProdutosEstoque = class(TfrmModeloRelatorio)
    rlbColunas: TRLBand;
    lbCodBarra: TRLLabel;
    lbProdutoNome: TRLLabel;
    lbFornecedor: TRLLabel;
    lbEstoque: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbCodbarras: TRLDBText;
    rldbProdutoNome: TRLDBText;
    rldbFornecedor: TRLDBText;
    rldbEstoque: TRLDBText;
    cdsPadraoCOD_BARRA: TStringField;
    cdsPadraoPRO_DESCRICAO: TStringField;
    cdsPadraoPRO_ESTOQUE: TFloatField;
    cdsPadraoQTDE_MINIMA: TFloatField;
    cdsPadraoCODFORNECEDOR: TIntegerField;
    cdsPadraoFORNECEDOR: TStringField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    
  public
    
  end;

var
  frmRelatorioProdutosEstoque: TfrmRelatorioProdutosEstoque;

implementation

{$R *.dfm}

procedure TfrmRelatorioProdutosEstoque.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := 'Produtos com Estoque Mínimo';
end;

end.
