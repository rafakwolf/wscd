unit unPrevRelCaixa;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, RLReport, DB, memds, 
  SqlDb, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevRelCaixa = class(TfrmModeloRelatorio)
    rbColunas: TRLBand;
    lbData: TRLLabel;
    lbDescricao: TRLLabel;
    lbDocumento: TRLLabel;
    lbTipo: TRLLabel;
    lbValor: TRLLabel;
    rbDetalhe: TRLBand;
    dbData: TRLDBText;
    dbDescricao: TRLDBText;
    dbDocumento: TRLDBText;
    dbTipo: TRLDBText;
    dbValor: TRLDBText;
    rbSumario: TRLBand;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoTOTAL: TFMTBCDField;
    sqldPadraoDATA: TDateField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoTIPO: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoTOTAL: TFMTBCDField;
    cdsPadraoDATA: TDateField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoTIPO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    rllbTotalC: TRLLabel;
    rllbTotalD: TRLLabel;
    rlbSaldo: TRLLabel;
    procedure dbTipoBeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
    TituloRel, Tipo: String;
  end;

var
  frmPrevRelCaixa: TfrmPrevRelCaixa;
  cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevRelCaixa.dbTipoBeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  inherited;
  if Text = 'C' then
    Text := 'Entrada'
  else
    Text := 'Sa�da';  
end;

procedure TfrmPrevRelCaixa.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := Trim(TituloRel);
  rllbTotalC.Caption := 'Entradas: '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'VALOR', 'TIPO', 'C'));
  rllbTotalD.Caption := 'Sa�das: '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'VALOR', 'TIPO', 'D'));

  rllbTotalD.Visible := True;
  rllbTotalC.Visible := True;

  rlbSaldo.Caption := 'Saldo: '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'VALOR', 'TIPO', 'C')-
    Totaliza(cdsPadrao, 'VALOR', 'TIPO', 'D'));
end;

procedure TfrmPrevRelCaixa.rbDetalheBeforePrint(Sender: TObject;
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
