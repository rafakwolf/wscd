unit unPrevVendas;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevVendas = class(TfrmModeloRelatorio)
    rlgGrupo: TRLGroup;
    rlbTitulo: TRLBand;
    lbCodigo: TRLLabel;
    lbCliente: TRLLabel;
    rldbCodigo: TRLDBText;
    rldbNome: TRLDBText;
    rlsbDetalhes: TRLSubDetail;
    rlbColunasDetalhe: TRLBand;
    lbCodVenda: TRLLabel;
    lbDataVenda: TRLLabel;
    lbTotal: TRLLabel;
    lbDesconto: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbCodVenda: TRLDBText;
    rldbdataVenda: TRLDBText;
    rldbTotal: TRLDBText;
    rldbDesconto: TRLDBText;
    rlbRodape: TRLBand;
    rlblTotalVenda: TRLLabel;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoCLIENTE: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoOBS: TStringField;
    sqldPadraoTOTALDESCTO: TFMTBCDField;
    sqldPadraoTOTAL: TFMTBCDField;
    sqldPadraoCONCLUIDA: TStringField;
    sqldPadraoBAIXADO: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoCLIENTE: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoOBS: TStringField;
    cdsPadraoTOTALDESCTO: TFMTBCDField;
    cdsPadraoTOTAL: TFMTBCDField;
    cdsPadraoCONCLUIDA: TStringField;
    cdsPadraoBAIXADO: TStringField;
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevVendas: TfrmPrevVendas;
  Cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevVendas.rlbDetalheBeforePrint(Sender: TObject;
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

procedure TfrmPrevVendas.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  rlblTotalVenda.Caption := 'Total: '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'TOTAL', '', ''));
end;

end.
