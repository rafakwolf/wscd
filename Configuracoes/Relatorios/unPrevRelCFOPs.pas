unit unPrevRelCFOPs;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb, RLReport,
  RLParser, FMTBcd;

type
  TfrmPrevRelCFOPs = class(TfrmModeloRelatorio)
    sqldPadraoNUMERO: TStringField;
    sqldPadraoOPERACAO: TStringField;
    cdsPadraoNUMERO: TStringField;
    cdsPadraoOPERACAO: TStringField;
    rlbndCabecColunas: TRLBand;
    rlbndColunaDados: TRLBand;
    rllbNumero: TRLLabel;
    rllbOperacao: TRLLabel;
    rllbDescricao: TRLLabel;
    rlbdtNumero: TRLDBText;
    rldbmOperacao: TRLDBMemo;
    rldbmDescricao: TRLDBMemo;
    sqldPadraoCFNOTA: TStringField;
    cdsPadraoCFNOTA: TStringField;
    procedure rlbndColunaDadosBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
  public
  end;

var
  frmPrevRelCFOPs: TfrmPrevRelCFOPs;
  Cor: Boolean = False;

implementation

uses VarGlobal;

{$R *.dfm}

procedure TfrmPrevRelCFOPs.rlbndColunaDadosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if Configuracao.RelZebrado then
  begin
    if Cor then
    begin
      Cor := False;
      rlbndColunaDados.Color := $00F0F0F0;
    end
    else
    begin
      Cor := True;
      rlbndColunaDados.Color := clWhite;
    end;
  end;
end;

end.
