unit unPrevCaixaTodos;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloRelatorio, DB, memds,  SqlDb,
  RLReport, RLParser, FMTBcd;

type
  TfrmPrevCaixaTodos = class(TfrmModeloRelatorio)
    rlbColunas: TRLBand;
    lbLanc: TRLLabel;
    lbDescricao: TRLLabel;
    lbDoc: TRLLabel;
    lbTipoConta: TRLLabel;
    lbValor: TRLLabel;
    rlbDetalhe: TRLBand;
    rldbLanc: TRLDBText;
    rldbDescricao: TRLDBText;
    rldbDoc: TRLDBText;
    rldbConta: TRLDBText;
    rldbValor: TRLDBText;
    rlbSumario: TRLBand;
    lbDebitos: TRLLabel;
    lbCreditos: TRLLabel;
    lbSaldo: TRLLabel;
    rlgrpCaixa: TRLGroup;
    RLLabel1: TRLLabel;
    rldbCaixa: TRLDBText;
    rlbndSomaPorCaixa: TRLBand;
    sqldPadraoCAIXA: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoCAIXA: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    rllbSomaC: TRLLabel;
    rllbSomaD: TRLLabel;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rldbContaBeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure rldbCaixaBeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure rlgrpCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbDetalheBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    PrintFirst: Boolean;
  public
    Titulo, DataIni, DataFim: string;
  end;

var
  frmPrevCaixaTodos: TfrmPrevCaixaTodos;
  cor: Boolean = True;

implementation

uses VarGlobal, Funcoes, udatabaseutils;

{$R *.dfm}

procedure TfrmPrevCaixaTodos.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  lbTitulo.Caption := Trim(Titulo);
end;

procedure TfrmPrevCaixaTodos.rldbContaBeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  inherited;
  if AnsiUpperCase(Text) = 'C' then
    Text := 'Entrada'
  else
    Text := 'Sa�da';
end;

procedure TfrmPrevCaixaTodos.rldbCaixaBeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  inherited;
  if PrintFirst then
  begin
    PrintIt := True;
    PrintFirst := False;
  end
  else
    PrintIt := False;
end;

procedure TfrmPrevCaixaTodos.rlgrpCaixaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  TotalC, TotalD: Extended;  
begin
  inherited;
  PrintFirst := True;

  if (DataIni = '') and (DataFim = '') then
  begin
    TotalC := SelectSingleField('select sum(VALOR) from VIEWRELCAIXATODOS '+
      'where (CAIXA = '+QuotedStr(cdsPadraoCAIXA.AsString)+') and (TIPO = '+QuotedStr('C')+')',
      sqldPadrao.SQLConnection);

    TotalD := SelectSingleField('select sum(VALOR) from VIEWRELCAIXATODOS '+
      'where (CAIXA = '+QuotedStr(cdsPadraoCAIXA.AsString)+') and (TIPO = '+QuotedStr('D')+')',
      sqldPadrao.SQLConnection);
  end
  else
  begin
    TotalC := SelectSingleField('select sum(VALOR) from VIEWRELCAIXATODOS '+
      'where (CAIXA = '+QuotedStr(cdsPadraoCAIXA.AsString)+') and (TIPO = '+QuotedStr('C')+') '+
      'and (DATA >= '+FormatDateFirebird(StrToDate(DataIni))+') '+
      'and (DATA <= '+FormatDateFirebird(StrToDate(DataFim))+')', sqldPadrao.SQLConnection);

    TotalD := SelectSingleField('select sum(VALOR) from VIEWRELCAIXATODOS '+
      'where (CAIXA = '+QuotedStr(cdsPadraoCAIXA.AsString)+') and (TIPO = '+QuotedStr('D')+') '+
      'and (DATA >= '+FormatDateFirebird(StrToDate(DataIni))+') '+
      'and (DATA <= '+FormatDateFirebird(StrToDate(DataFim))+')', sqldPadrao.SQLConnection);
  end;

  rllbSomaC.Caption := 'Entradas: '+FormatFloat('#,##0.00', TotalC);
  rllbSomaD.Caption := 'Sa�das: '+FormatFloat('#,##0.00', TotalD);
end;

procedure TfrmPrevCaixaTodos.rlbDetalheBeforePrint(Sender: TObject;
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
