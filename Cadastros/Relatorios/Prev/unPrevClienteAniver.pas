unit unPrevClienteAniver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, DBClient, Provider, SqlExpr,
  RLReport, RLParser, FMTBcd;

type
  TfrmPrevClientesAniver = class(TfrmModeloRelatorio)
    rlbColunas: TRLBand;
    lbNome: TRLLabel;
    lbDataNasc: TRLLabel;
    lbEndereco: TRLLabel;
    lbCidade: TRLLabel;
    lbFone: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbNome: TRLDBText;
    rldbDataNasc: TRLDBText;
    rldbEndereco: TRLDBText;
    rldbCidade: TRLDBText;
    rldbFone: TRLDBText;
    cdsPadraoNOME: TStringField;
    cdsPadraoDATANASC: TDateField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoCIDADE: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoFONE: TStringField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevClientesAniver: TfrmPrevClientesAniver;
  Cor: Boolean = True;

implementation

uses VarGlobal;

{$R *.dfm}

procedure TfrmPrevClientesAniver.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := 'Clientes aniversariantes';
end;

procedure TfrmPrevClientesAniver.rlbDetalheBeforePrint(Sender: TObject;
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
