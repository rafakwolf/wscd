unit unPrevContasPagar;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, RLParser, FMTBcd;

type
  TfrmPrevContasPagar = class(TfrmModeloRelatorio)
    rlbTitulo: TRLBand;
    lbData: TRLLabel;
    lbvenc: TRLLabel;
    lbFornecedor: TRLLabel;
    lbDocumento: TRLLabel;
    lbvalor: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbData: TRLDBText;
    rldbvenc: TRLDBText;
    rldbForn: TRLDBText;
    rldbDoc: TRLDBText;
    rldbValor: TRLDBText;
    rlbSumario: TRLBand;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoCODFORN: TIntegerField;
    sqldPadraoFORNECEDOR: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoCODFORN: TIntegerField;
    cdsPadraoFORNECEDOR: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    rllbTotal: TRLLabel;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
    Titulo: String;
  end;

var
  frmPrevContasPagar: TfrmPrevContasPagar;
  Cor: Boolean = True;

implementation

uses VarGlobal;

{$R *.dfm}

procedure TfrmPrevContasPagar.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := Trim(Titulo);
  rllbTotal.Caption := 'Total: '+FormatFloat('#,##0.00', Totaliza(sqldPadrao, 'VALOR', '', ''));
end;

procedure TfrmPrevContasPagar.rlbDetalheBeforePrint(Sender: TObject;
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
