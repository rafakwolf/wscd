unit unPrevProdutoGrupo;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevProdutoGrupo = class(TfrmModeloRelatorio)
    rlbColunas: TRLBand;
    lbCodBarra: TRLLabel;
    lbProduto: TRLLabel;
    lbFornecedor: TRLLabel;
    lbCusto: TRLLabel;
    lbLucro: TRLLabel;
    lbPreco: TRLLabel;
    lbEstoque: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbCodbarra: TRLDBText;
    rldbProduto: TRLDBText;
    rldbForn: TRLDBText;
    rldbCusto: TRLDBText;
    rldbLucro: TRLDBText;
    rldbPreco: TRLDBText;
    rldbEstoque: TRLDBText;
    sqldPadraoCODBARRA: TStringField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoFORNECEDOR: TStringField;
    sqldPadraoCODGRUPO: TIntegerField;
    sqldPadraoGRUPO: TStringField;
    sqldPadraoCUSTO: TFMTBCDField;
    sqldPadraoLUCRO: TFMTBCDField;
    sqldPadraoPRECO: TFMTBCDField;
    sqldPadraoESTOQUE: TIntegerField;
    sqldPadraoVALORESTOQUE: TFloatField;
    cdsPadraoCODBARRA: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoFORNECEDOR: TStringField;
    cdsPadraoCODGRUPO: TIntegerField;
    cdsPadraoGRUPO: TStringField;
    cdsPadraoCUSTO: TFMTBCDField;
    cdsPadraoLUCRO: TFMTBCDField;
    cdsPadraoPRECO: TFMTBCDField;
    cdsPadraoESTOQUE: TIntegerField;
    cdsPadraoVALORESTOQUE: TFloatField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FTipoRelatorio: Integer;
    procedure SetTipoRelatorio(const Value: Integer);
  public
    Grupo, NovosORAlterados: String; 
    property TipoRelatorio: Integer read FTipoRelatorio write SetTipoRelatorio;
  end;

var
  frmPrevProdutoGrupo: TfrmPrevProdutoGrupo;
  cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevProdutoGrupo.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if TipoRelatorio = 0 then
    lbTitulo.Caption := 'Produtos do grupo: ' + Grupo;
  if TipoRelatorio = 1 then
    lbTitulo.Caption := 'Produtos ' + NovosORAlterados;
end;

procedure TfrmPrevProdutoGrupo.SetTipoRelatorio(const Value: Integer);
begin
  FTipoRelatorio := Value;
end;

procedure TfrmPrevProdutoGrupo.rlbDetalheBeforePrint(Sender: TObject;
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
