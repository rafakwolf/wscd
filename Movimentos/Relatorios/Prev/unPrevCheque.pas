unit unPrevCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, DBClient, Provider, SqlExpr,
  RLReport, RLParser, FMTBcd;

type
  TfrmPrevCheque = class(TfrmModeloRelatorio)
    rlbColuna: TRLBand;
    rlblBanco: TRLLabel;
    rlblAgencia: TRLLabel;
    rlblConta: TRLLabel;
    rlblNumero: TRLLabel;
    rlblDatareceb: TRLLabel;
    rlblVencimento: TRLLabel;
    rlblCliente: TRLLabel;
    rlblValor: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbtBanco: TRLDBText;
    rldbtAgencia: TRLDBText;
    rldbtConta: TRLDBText;
    rldbtNumero: TRLDBText;
    rldbtDataReceb: TRLDBText;
    rldbtVenc: TRLDBText;
    rldbtCliente: TRLDBText;
    rldbtValor: TRLDBText;
    sqldPadraoIDCHEQUE: TIntegerField;
    sqldPadraoIDBANCO: TIntegerField;
    sqldPadraoBANCO: TStringField;
    sqldPadraoAGENCIA: TStringField;
    sqldPadraoCONTA: TStringField;
    sqldPadraoNUMERO: TStringField;
    sqldPadraoDATAEMISSAO: TDateField;
    sqldPadraoBOMPARA: TDateField;
    sqldPadraoIDCLIENTE: TIntegerField;
    sqldPadraoCLIENTE: TStringField;
    sqldPadraoIDFORN: TIntegerField;
    sqldPadraoFORN: TStringField;
    sqldPadraoVENDA: TIntegerField;
    sqldPadraoCOMPRA: TIntegerField;
    sqldPadraoREPASSADO: TStringField;
    sqldPadraoBANDAMAGNETICA: TStringField;
    sqldPadraoDATABAIXADO: TDateField;
    cdsPadraoIDCHEQUE: TIntegerField;
    cdsPadraoIDBANCO: TIntegerField;
    cdsPadraoBANCO: TStringField;
    cdsPadraoAGENCIA: TStringField;
    cdsPadraoCONTA: TStringField;
    cdsPadraoNUMERO: TStringField;
    cdsPadraoDATAEMISSAO: TDateField;
    cdsPadraoBOMPARA: TDateField;
    cdsPadraoIDCLIENTE: TIntegerField;
    cdsPadraoCLIENTE: TStringField;
    cdsPadraoIDFORN: TIntegerField;
    cdsPadraoFORN: TStringField;
    cdsPadraoVENDA: TIntegerField;
    cdsPadraoCOMPRA: TIntegerField;
    cdsPadraoREPASSADO: TStringField;
    cdsPadraoBANDAMAGNETICA: TStringField;
    cdsPadraoDATABAIXADO: TDateField;
    rlblBaixado: TRLLabel;
    rldbtBaixado: TRLDBText;
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    rlbndSumario: TRLBand;
    rllbTotalizacao: TRLLabel;
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
    procedure TextoSoma(Texto: string);
  end;

var
  frmPrevCheque: TfrmPrevCheque;
  Cor: Boolean = False;

implementation

uses VarGlobal;

{$R *.dfm}

procedure TfrmPrevCheque.rlbDetalheBeforePrint(Sender: TObject;
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
  
  if cdsPadraoIDCLIENTE.IsNull then
    rldbtCliente.DataField := 'FORN'
  else
    rldbtCliente.DataField := 'CLIENTE';
end;

procedure TfrmPrevCheque.TextoSoma(Texto: string);
begin
  rllbTotalizacao.Caption :=
    Texto+': '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'VALOR', '', ''));
end;

end.
