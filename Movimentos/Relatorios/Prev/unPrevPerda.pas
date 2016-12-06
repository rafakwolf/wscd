unit unPrevPerda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, DBClient, Provider, SqlExpr,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevPerda = class(TfrmModeloRelatorio)
    rlbndTituloColuna: TRLBand;
    rlbProduto: TRLLabel;
    rlbQtde: TRLLabel;
    rlbPreco: TRLLabel;
    rlbData: TRLLabel;
    rlbMotivo: TRLLabel;
    rlbndDetalheColuna: TRLBand;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoCODPRODUTO: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoMOTIVO: TStringField;
    sqldPadraoOBS: TMemoField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoCODPRODUTO: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoMOTIVO: TStringField;
    cdsPadraoOBS: TMemoField;
    rldbtProduto: TRLDBText;
    rldbtQtde: TRLDBText;
    rldbtPreco: TRLDBText;
    rldbtData: TRLDBText;
    rldbtMotivo: TRLDBText;
    rlbndSumario: TRLBand;
    sqldPadraoQTDE: TIntegerField;
    sqldPadraoPRECO: TFMTBCDField;
    cdsPadraoQTDE: TIntegerField;
    cdsPadraoPRECO: TFMTBCDField;
    rllbTotal: TRLLabel;
    procedure cdsPadraoMOTIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure rlbndDetalheColunaBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevPerda: TfrmPrevPerda;
  cor: Boolean = False;

implementation

{$R *.dfm}

procedure TfrmPrevPerda.cdsPadraoMOTIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsString = 'D' then
    Text := 'Danificado'
  else
  if Sender.AsString = 'V' then
    Text := 'Vencido'
  else
  if Sender.AsString = 'F' then
    Text := 'Furto'
  else
  if Sender.AsString = 'P' then
    Text := 'Perda de peso'
  else
    Text := 'Outro';        
end;

procedure TfrmPrevPerda.rlbndDetalheColunaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if Configuracao.RelZebrado then
  begin
    if Cor then
    begin
      Cor := False;
      rlbndDetalheColuna.Color := $00F0F0F0;
    end
    else
    begin
      Cor := True;
      rlbndDetalheColuna.Color := clWhite;
    end;
  end;  
end;

procedure TfrmPrevPerda.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  rllbTotal.Caption := 'Total perdido: '+FormatFloat('#,##0.00', Totaliza(cdsPadrao, 'PRECO', '', ''));
end;

end.
