unit unPrevContasClientes;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, RLParser, FMTBcd;

type
  TfrmPrevContasClientes = class(TfrmModeloRelatorio)
    rlbColunas: TRLBand;
    rlbDetalhe: TRLBand;
    lbDatalanc: TRLLabel;
    lbvenc: TRLLabel;
    lbCapital: TRLLabel;
    lbTotal: TRLLabel;
    rldbData: TRLDBText;
    rldbvenc: TRLDBText;
    rldbCapital: TRLDBText;
    rldbTotal: TRLDBText;
    rlbSumario: TRLBand;
    rllbVencer: TRLLabel;
    rllbVenvidas: TRLLabel;
    rllbVencendoHoje: TRLLabel;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoCLIENTE: TStringField;
    sqldPadraoCAPITAL: TFMTBCDField;
    sqldPadraoTOTAL: TFloatField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoCLIENTE: TStringField;
    cdsPadraoCAPITAL: TFMTBCDField;
    cdsPadraoTOTAL: TFloatField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbColunasBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure CalculaContas;
  public
  end;

var
  frmPrevContasClientes: TfrmPrevContasClientes;
  Cor: Boolean = False;

implementation

uses VarGlobal, Funcoes, udatabaseutils;

{$R *.dfm}

procedure TfrmPrevContasClientes.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption :=
    'Contas do cliente: '+IntToStr(cdsPadraoCODCLIENTE.AsInteger)+' - '+
    cdsPadraoCLIENTE.AsString;
  CalculaContas;  
end;

procedure TfrmPrevContasClientes.rlbColunasBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if Configuracao.RelZebrado then
  begin
    if Cor then
    begin
      Cor := False;
      rlbColunas.Color := $00F0F0F0;
    end
    else
    begin
      Cor := True;
      rlbColunas.Color := clWhite;
    end;
  end;

  if cdsPadraoVENCIMENTO.AsDateTime < Date then
  begin
    rldbData.Font.Color := clRed;
    rldbvenc.Font.Color := clRed;
    rldbCapital.Font.Color := clRed;
    rldbTotal.Font.Color := clRed;
  end
  else if cdsPadraoVENCIMENTO.AsDateTime > Date then
  begin
    rldbData.Font.Color := clBlack;
    rldbvenc.Font.Color := clBlack;
    rldbCapital.Font.Color := clBlack;
    rldbTotal.Font.Color := clBlack;
  end
  else if cdsPadraoVENCIMENTO.AsDateTime = Date then
  begin
    rldbData.Font.Color := clBlue;
    rldbvenc.Font.Color := clBlue;
    rldbCapital.Font.Color := clBlue;
    rldbTotal.Font.Color := clBlue;
  end;
end;

procedure TfrmPrevContasClientes.CalculaContas;
var
  AVencer, Vencidas, VencHoje: string;
begin
  AVencer := FormatFloat('#,##0.00', SelecSingleField('select sum(TOTAL) from VIEWRELNPCR where VENCIMENTO > '+
    FormatDateFirebird(Date)+' and CODCLIENTE = '+QuotedStr(IntToStr(cdsPadraoCODCLIENTE.AsInteger)), GetZConnection));
  Vencidas := FormatFloat('#,##0.00', SelecSingleField('select sum(TOTAL) from VIEWRELNPCR where VENCIMENTO < '+
    FormatDateFirebird(Date)+' and CODCLIENTE = '+QuotedStr(IntToStr(cdsPadraoCODCLIENTE.AsInteger)), GetZConnection));
  VencHoje := FormatFloat('#,##0.00', SelecSingleField('select sum(TOTAL) from VIEWRELNPCR where VENCIMENTO = '+
    FormatDateFirebird(Date)+' and CODCLIENTE = '+QuotedStr(IntToStr(cdsPadraoCODCLIENTE.AsInteger)), GetZConnection));

  rllbVencer.Caption := 'A vencer: '+AVencer;
  rllbVenvidas.Caption := 'Vencidas: '+Vencidas;
  rllbVencendoHoje.Caption := 'Vencendo hoje: '+VencHoje;
end;

end.
