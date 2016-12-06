unit unPrevRelFornData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, DBClient, Provider, SqlExpr,
  RLReport, VarGlobal, RLParser, FMTBcd;

type
  TfrmPrevRelFornData = class(TfrmModeloRelatorio)
    rbColunas: TRLBand;
    lbCodigo: TRLLabel;
    lbFantazia: TRLLabel;
    lbEndereco: TRLLabel;
    lbCNPJ: TRLLabel;
    lbFone: TRLLabel;
    rbDetalhe: TRLBand;
    dbCodigo: TRLDBText;
    dbFantazia: TRLDBText;
    dbCNPJ: TRLDBText;
    dbFone: TRLDBText;
    dbEndereco: TRLDBText;
    lbCidade: TRLLabel;
    rldbCidade: TRLDBText;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoFANTAZIA: TStringField;
    sqldPadraoCNPJ: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoTELEFONE: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoFANTAZIA: TStringField;
    cdsPadraoCNPJ: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoTELEFONE: TStringField;
    sqldPadraoCIDADE: TStringField;
    cdsPadraoCIDADE: TStringField;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FTipoRelatorio: Integer;
    procedure SetTipoRelatorio(const Value: Integer);
  public
    property TipoRelatorio: Integer read FTipoRelatorio write SetTipoRelatorio;
  end;

var
  frmPrevRelFornData: TfrmPrevRelFornData;
  cor: Boolean = True;

implementation

{$R *.dfm}

procedure TfrmPrevRelFornData.SetTipoRelatorio(const Value: Integer);
begin
  FTipoRelatorio := Value;
end;

procedure TfrmPrevRelFornData.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if TipoRelatorio = 0 then
    lbTitulo.Caption := 'Listagem de fornecedores';
  if TipoRelatorio = 1 then
    lbTitulo.Caption := 'Fornecedores por cidade';
  if TipoRelatorio = 2 then
    lbTitulo.Caption := 'Fornecedores entre data de cadastro';
end;

procedure TfrmPrevRelFornData.rbDetalheBeforePrint(Sender: TObject;
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
