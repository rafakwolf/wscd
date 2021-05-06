unit unPrevRelAgenda;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, RLReport, DB, memds, 
  SqlDb, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevRelAgenda = class(TfrmModeloRelatorio)
    rbDetalhe: TRLBand;
    lbNome: TRLLabel;
    lbFone: TRLLabel;
    lbFax: TRLLabel;
    dbNome: TRLDBText;
    dbFone: TRLDBText;
    dbFax: TRLDBText;
    sqldPadraoNOME: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoFAX: TStringField;
    cdsPadraoNOME: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoFAX: TStringField;
    procedure rbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevRelAgenda: TfrmPrevRelAgenda;
  cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevRelAgenda.rbDetalheBeforePrint(Sender: TObject;
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
