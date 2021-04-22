unit unPrevProdutosVencimento;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevProdutosVencimento = class(TfrmModeloRelatorio)
    rlbColunas: TRLBand;
    lbCodigo: TRLLabel;
    lbProduto: TRLLabel;
    lbDataVenc: TRLLabel;
    lbForn: TRLLabel;
    lbCusto: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbCodbarra: TRLDBText;
    rldbProduto: TRLDBText;
    rldbForn: TRLDBText;
    rldbDataVenc: TRLDBText;
    rldbCusto: TRLDBText;
    cdsPadraoCODBARRA: TStringField;
    cdsPadraoPRODUTO: TStringField;
    cdsPadraoDATAVENCIMENTO: TDateField;
    cdsPadraoUNIDADE: TStringField;
    cdsPadraoGRUPO: TStringField;
    cdsPadraoFORNECEDOR: TStringField;
    cdsPadraoPRECOCUSTO: TFMTBCDField;
    rlbndSomatorio: TRLBand;
    rllbSomaCusto: TRLLabel;
    sqldPadraoCODBARRA: TStringField;
    sqldPadraoPRODUTO: TStringField;
    sqldPadraoDATAVENCIMENTO: TDateField;
    sqldPadraoUNIDADE: TStringField;
    sqldPadraoGRUPO: TStringField;
    sqldPadraoFORNECEDOR: TStringField;
    sqldPadraoPRECOCUSTO: TFMTBCDField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    function SomaCusto: string;
  public
    Data: String;
  end;

var
  frmPrevProdutosVencimento: TfrmPrevProdutosVencimento;
  cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevProdutosVencimento.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := 'Produtos vencidos at�: ' + Data;
  rllbSomaCusto.Caption := 'Custo: '+SomaCusto;
end;

procedure TfrmPrevProdutosVencimento.rlbDetalheBeforePrint(Sender: TObject;
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

function TfrmPrevProdutosVencimento.SomaCusto: string;
var
  Soma: Real;
begin
  Soma := 0;
  if not cdsPadrao.Active then
    cdsPadrao.Open;
  cdsPadrao.First;
  while not cdsPadrao.Eof do
  begin
    Soma := Soma + cdsPadraoPRECOCUSTO.AsFloat;
    cdsPadrao.Next;
  end;
  Result := FormatFloat('#,##0.00', Soma);
end;

end.
