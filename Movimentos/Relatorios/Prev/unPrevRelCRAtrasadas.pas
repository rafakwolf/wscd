unit unPrevRelCRAtrasadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, DBClient, Provider, SqlExpr,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevRelCRAtrasadas = class(TfrmModeloRelatorio)
    rbColunas: TRLBand;
    lbVencimento: TRLLabel;
    lbCliente: TRLLabel;
    lbCapital: TRLLabel;
    lbAtraso: TRLLabel;
    lbTotal: TRLLabel;
    rbDetalhe: TRLBand;
    dbVencimento: TRLDBText;
    dbCliente: TRLDBText;
    dbCapital: TRLDBText;
    dbAtraso: TRLDBText;
    dbTotal: TRLDBText;
    rbSumario: TRLBand;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoCLIENTE: TStringField;
    sqldPadraoCAPITAL: TFMTBCDField;
    sqldPadraoDIASATRASO: TIntegerField;
    sqldPadraoTOTAL: TFloatField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoCLIENTE: TStringField;
    cdsPadraoCAPITAL: TFMTBCDField;
    cdsPadraoDIASATRASO: TIntegerField;
    cdsPadraoTOTAL: TFloatField;
    rllbTotal: TRLLabel;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
    Titulo: String;
  end;

var
  frmPrevRelCRAtrasadas: TfrmPrevRelCRAtrasadas;
  cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevRelCRAtrasadas.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := Trim(Titulo);
  rllbTotal.Caption := 'Total: '+ FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'TOTAL', '', ''));
end;

procedure TfrmPrevRelCRAtrasadas.rbDetalheBeforePrint(Sender: TObject;
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
