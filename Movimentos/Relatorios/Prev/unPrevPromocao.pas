unit unPrevPromocao;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, RLParser, DB, memds, 
  SqlDb, RLReport, FMTBcd;

type
  TfrmPrevPromocao = class(TfrmModeloRelatorio)
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoPRODUTO: TIntegerField;
    sqldPadraoABREVIACAO: TStringField;
    sqldPadraoVENDA: TFMTBCDField;
    sqldPadraoDESCONTO: TFMTBCDField;
    sqldPadraoPRECO: TFMTBCDField;
    sqldPadraoINICIO: TDateField;
    sqldPadraoFIM: TDateField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoPRODUTO: TIntegerField;
    cdsPadraoABREVIACAO: TStringField;
    cdsPadraoVENDA: TFMTBCDField;
    cdsPadraoDESCONTO: TFMTBCDField;
    cdsPadraoPRECO: TFMTBCDField;
    cdsPadraoINICIO: TDateField;
    cdsPadraoFIM: TDateField;
    rlbndCabecalho: TRLBand;
    rllbProduto: TRLLabel;
    rllbPrecoNormal: TRLLabel;
    rllbDesconto: TRLLabel;
    rllbprecoPromocao: TRLLabel;
    rllbInicio: TRLLabel;
    rllbFim: TRLLabel;
    rlbndDetalhes: TRLBand;
    rldbtProduto: TRLDBText;
    rldbtPrecoNorm: TRLDBText;
    rldbtDescto: TRLDBText;
    rldbtPrecoProm: TRLDBText;
    rldbtInicio: TRLDBText;
    rldbtFim: TRLDBText;
    rlbndSumario: TRLBand;
    rllbSoma: TRLLabel;
    procedure rlbndDetalhesBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevPromocao: TfrmPrevPromocao;
  Cor: Boolean = False;

implementation

uses VarGlobal;

{$R *.dfm}

procedure TfrmPrevPromocao.rlbndDetalhesBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if Configuracao.RelZebrado then
  begin
    if Cor then
    begin
      Cor := False;
      rlbndDetalhes.Color := $00F0F0F0;
    end
    else
    begin
      Cor := True;
      rlbndDetalhes.Color := clWhite;
    end;
  end;
end;

procedure TfrmPrevPromocao.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  rllbSoma.Caption := 'Total: '+ FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'PRECO', '', ''));
end;

end.
