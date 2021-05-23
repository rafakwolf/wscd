unit unPrevRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfrmPrevRecibo = class(TForm)
    rrRecibo: TRLReport;
    rbDetalhe: TRLBand;
    lbEmpresa: TRLLabel;
    lbCidadeEstado: TRLLabel;
    lbCNPJ_IE: TRLLabel;
    lbEnderecoFone: TRLLabel;
    lbRecebedor: TRLLabel;
    lbImportancia: TRLLabel;
    lbRefenrete: TRLLabel;
    lbCidade: TRLLabel;
    lbData: TRLLabel;
    lbAssinatura: TRLLabel;
    lbRecibo: TRLLabel;
    spLinhaAssinatura: TRLDraw;
    pnValor: TRLPanel;
    lbValor: TRLLabel;
    pnRecebedor: TRLPanel;
    pnImportancia: TRLPanel;
    pnReferente: TRLPanel;
    lbdRecebedor: TRLMemo;
    lbdImportancia: TRLMemo;
    lbdReferente: TRLMemo;
  private
  public
  end;

var
  frmPrevRecibo: TfrmPrevRecibo;

implementation

{$R *.dfm}

end.
