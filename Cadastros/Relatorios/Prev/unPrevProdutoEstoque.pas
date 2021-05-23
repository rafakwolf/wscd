unit unPrevProdutoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, DBClient, Provider, SqlExpr,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevProdutoEstoque = class(TfrmModeloRelatorio)
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
    sqldPadraoCOD_BARRA: TStringField;
    sqldPadraoPRO_DESCRICAO: TStringField;
    sqldPadraoPRO_ESTOQUE: TIntegerField;
    sqldPadraoQTDE_MINIMA: TIntegerField;
    sqldPadraoCODFORNECEDOR: TIntegerField;
    sqldPadraoFORNECEDOR: TStringField;
    cdsPadraoCOD_BARRA: TStringField;
    cdsPadraoPRO_DESCRICAO: TStringField;
    cdsPadraoPRO_ESTOQUE: TIntegerField;
    cdsPadraoQTDE_MINIMA: TIntegerField;
    cdsPadraoCODFORNECEDOR: TIntegerField;
    cdsPadraoFORNECEDOR: TStringField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevProdutoEstoque: TfrmPrevProdutoEstoque;
  cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevProdutoEstoque.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := 'Produtos com Estoque Mínimo';
end;

procedure TfrmPrevProdutoEstoque.rlbDetalheBeforePrint(Sender: TObject;
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
