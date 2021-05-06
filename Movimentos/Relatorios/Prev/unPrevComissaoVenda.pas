unit unPrevComissaoVenda;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, RLParser, FMTBcd;

type
  TfrmPrevComissaoVenda = class(TfrmModeloRelatorio)
    rlbCabecalhoColuna: TRLBand;
    rlblVendedor: TRLLabel;
    rlblPeriodo: TRLLabel;
    rlblDataVendedor: TRLLabel;
    rlblDataPeriodo: TRLLabel;
    rlbDetalhe: TRLBand;
    rlbSumario: TRLBand;
    rlbColuna: TRLBand;
    rlblProduto: TRLLabel;
    rlblQtde: TRLLabel;
    rlblTotal: TRLLabel;
    rlblComissao: TRLLabel;
    rldbtProduto: TRLDBText;
    rldbtQtde: TRLDBText;
    rldbtTotal: TRLDBText;
    rldbtComissao: TRLDBText;
    sqldPadraoCODPRODUTO: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODPRODUTO: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    rlblTotalFinal: TRLLabel;
    sqldPadraoQTD: TIntegerField;
    sqldPadraoTOTAL: TFMTBCDField;
    sqldPadraoCOMISSAO: TFMTBCDField;
    cdsPadraoQTD: TIntegerField;
    cdsPadraoTOTAL: TFMTBCDField;
    cdsPadraoCOMISSAO: TFMTBCDField;
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevComissaoVenda: TfrmPrevComissaoVenda;
  Cor: Boolean = False;

implementation

uses VarGlobal;

{$R *.dfm}

procedure TfrmPrevComissaoVenda.rlbDetalheBeforePrint(Sender: TObject;
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

procedure TfrmPrevComissaoVenda.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  rlblTotalFinal.Caption :=
    'Total da venda: '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'TOTAL', '', ''))+'   '+
    'Total comissões: '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'COMISSAO', '', ''));
end;

end.
