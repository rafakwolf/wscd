unit unPrevContasClientes;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, SqlDb,
  RLReport, RLParser, ZAbstractRODataset, FMTBcd;

type

  { TfrmPrevContasClientes }

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
    sqldPadraoCAPITAL: TZBCDField;
    sqldPadraoCLIENTE: TZRawStringField;
    sqldPadraoCODCLIENTE: TZIntegerField;
    sqldPadraoCODIGO: TZIntegerField;
    sqldPadraoDATA: TZDateField;
    sqldPadraoTOTAL: TZBCDField;
    sqldPadraoVENCIMENTO: TZDateField;
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

uses VarGlobal, Funcoes, uDatabaseUtils;

{$R *.dfm}

procedure TfrmPrevContasClientes.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption :=
    'Contas do cliente: '+IntToStr(sqldPadraoCODCLIENTE.AsInteger)+' - '+
    sqldPadraoCLIENTE.AsString;
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
      rlbColunas.Color := clCream;
    end
    else
    begin
      Cor := True;
      rlbColunas.Color := clWhite;
    end;
  end;

  if sqldPadraoVENCIMENTO.AsDateTime < Date then
  begin
    rldbData.Font.Color := clRed;
    rldbvenc.Font.Color := clRed;
    rldbCapital.Font.Color := clRed;
    rldbTotal.Font.Color := clRed;
  end
  else if sqldPadraoVENCIMENTO.AsDateTime > Date then
  begin
    rldbData.Font.Color := clBlack;
    rldbvenc.Font.Color := clBlack;
    rldbCapital.Font.Color := clBlack;
    rldbTotal.Font.Color := clBlack;
  end
  else if sqldPadraoVENCIMENTO.AsDateTime = Date then
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
  AVencer := VarToStrDef(SelecSingleField('select sum(TOTAL) from VIEWRELNPCR where VENCIMENTO > '+
    FormatDateFirebird(Date)+' and CODCLIENTE = '+QuotedStr(IntToStr(sqldPadraoCODCLIENTE.AsInteger)), GetZConnection), '0');

  Vencidas := VarToStrDef(SelecSingleField('select sum(TOTAL) from VIEWRELNPCR where VENCIMENTO < '+
    FormatDateFirebird(Date)+' and CODCLIENTE = '+QuotedStr(IntToStr(sqldPadraoCODCLIENTE.AsInteger)), GetZConnection), '0');

  VencHoje := VarToStrDef(SelecSingleField('select sum(TOTAL) from VIEWRELNPCR where VENCIMENTO = '+
    FormatDateFirebird(Date)+' and CODCLIENTE = '+QuotedStr(IntToStr(sqldPadraoCODCLIENTE.AsInteger)), GetZConnection), '0');


  rllbVencer.Caption := 'A vencer: '+ AVencer;
  rllbVenvidas.Caption := 'Vencidas: '+Vencidas;
  rllbVencendoHoje.Caption := 'Vencendo hoje: '+VencHoje;
end;

end.
