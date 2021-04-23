unit unPrevContasReceber;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb, RLReport,
  RLParser, FMTBcd;

type
  TfrmPrevContasReceber = class(TfrmModeloRelatorio)
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoCLIENTE: TStringField;
    sqldPadraoCAPITAL: TFMTBCDField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoCLIENTE: TStringField;
    cdsPadraoCAPITAL: TFMTBCDField;
    rbDetalhe: TRLBand;
    rbColunas: TRLBand;
    rldbtdata: TRLDBText;
    rldbtVenc: TRLDBText;
    rldbtClient: TRLDBText;
    rldbtValorCapital: TRLDBText;
    rldbtTotal: TRLDBText;
    rlbData: TRLLabel;
    rlbVenc: TRLLabel;
    rlbCliente: TRLLabel;
    rlbValorCap: TRLLabel;
    rlbTotal: TRLLabel;
    sqldPadraoTOTAL: TFMTBCDField;
    cdsPadraoTOTAL: TFMTBCDField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
    Titulo: String;
  end;

var
  frmPrevContasReceber: TfrmPrevContasReceber;
  Cor: Boolean = True;

implementation

uses VarGlobal, unDmPrincipal;

{$R *.dfm}

procedure TfrmPrevContasReceber.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := Trim(Titulo);
  rldbtTotal.Caption := 'Total: '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'TOTAl', '', ''));
end;

procedure TfrmPrevContasReceber.rbDetalheBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if Configuracao.RelZebrado then
  begin
    if Cor then
    begin
      Cor := False;
      rbDetalhe.Color := $00F0F0F0;
    end
    else
    begin
      Cor := True;
      rbDetalhe.Color := clWhite;
    end;
  end;
end;

end.
