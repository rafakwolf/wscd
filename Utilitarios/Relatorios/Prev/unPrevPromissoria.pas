unit unPrevPromissoria;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfrmPrevPromissoria = class(TForm)
    rptPromissoria: TRLReport;
    rlbndProm: TRLBand;
    albAvalista: TRLAngleLabel;
    albCPF_CNPJ_1: TRLAngleLabel;
    albCPF_CNPJ_2: TRLAngleLabel;
    rldwLinha_aval_1: TRLDraw;
    rldwLinha_aval_2: TRLDraw;
    rldwNro: TRLDraw;
    rldwEmissao: TRLDraw;
    rldwVenc: TRLDraw;
    rldwValor: TRLDraw;
    lbNro: TRLLabel;
    lbEmissao: TRLLabel;
    lbvenc: TRLLabel;
    lbValor: TRLLabel;
    lbDescricaoData: TRLLabel;
    lbCredor: TRLLabel;
    lbCPF_Credor: TRLLabel;
    rlmValorExt: TRLMemo;
    lbQuantiaDe: TRLLabel;
    lbMoedaPais: TRLLabel;
    lbPracaPag: TRLLabel;
    rldwLinha_pca_pag: TRLDraw;
    lbPcaPag: TRLLabel;
    lbEmitente: TRLLabel;
    rldwLinha_emit: TRLDraw;
    lbDescEmitente: TRLLabel;
    lbCPF_Emitente: TRLLabel;
    rldwLinha_cpf_emit: TRLDraw;
    lbDesc_cpf_emit: TRLLabel;
    lbEndereco_emit: TRLLabel;
    rldwLinha_endereco_emit: TRLDraw;
    lbDesc_endereco_emit: TRLLabel;
    lbNumero: TRLLabel;
    lbdataEmissao: TRLLabel;
    lbVencimento: TRLLabel;
    lbDescValor: TRLLabel;
    rldwAss_1: TRLDraw;
    rldwAss_2: TRLDraw;
    rldwCaixaLateral: TRLDraw;
  private
  public
  end;

var
  frmPrevPromissoria: TfrmPrevPromissoria;

implementation

{$R *.dfm}

end.
