unit unPrevDuplicataSemForm;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Funcoes, RLReport, memds,  DB, SqlDb, FMTBcd;

type
  TfrmPrevDuplicataSemForm = class(TForm)
    rrDuplicata: TRLReport;
    rbDetalhe: TRLBand;
    lbSacado: TRLLabel;
    lbEndereco: TRLLabel;
    lbMunicipio: TRLLabel;
    lbData_Emissao: TRLLabel;
    lbNumero_Fatura: TRLLabel;
    lbValor: TRLLabel;
    lbNumero_Duplicata: TRLLabel;
    lbVencimento: TRLLabel;
    lbTelefone_Fax: TRLLabel;
    lbDesconto: TRLLabel;
    lbPagar_Ate: TRLLabel;
    lbValor_Extenso: TRLLabel;
    lbPraca_Pagamento: TRLLabel;
    lbCnpjCpf: TRLLabel;
    lbCep: TRLLabel;
    lbBairro: TRLLabel;
    lbInscricao_Estadual: TRLLabel;
    lbEstado: TRLLabel;
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    sqldPadraoCAMPO: TStringField;
    sqldPadraoNOMECAMPO: TStringField;
    sqldPadraoVERTICAL: TIntegerField;
    sqldPadraoHORIZONTAL: TIntegerField;
    sqldPadraoFONTE: TIntegerField;
    cdsPadraoCAMPO: TStringField;
    cdsPadraoNOMECAMPO: TStringField;
    cdsPadraoVERTICAL: TIntegerField;
    cdsPadraoHORIZONTAL: TIntegerField;
    cdsPadraoFONTE: TIntegerField;
    sqldPadraoTIPOFONTE: TStringField;
    sqldPadraoESTILOFONTE: TStringField;
    cdsPadraoTIPOFONTE: TStringField;
    cdsPadraoESTILOFONTE: TStringField;
    procedure rrDuplicataBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure rrDuplicataAfterPrint(Sender: TObject);
  private
    procedure PosicionaLabels;
    procedure GravaPosicoes;
  public
    Config: Boolean;
    procedure LimpaTabelaConfig;
  end;

var
  frmPrevDuplicataSemForm: TfrmPrevDuplicataSemForm;

implementation



{$R *.dfm}

procedure TfrmPrevDuplicataSemForm.rrDuplicataBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  cdsPadrao.Open;
  PosicionaLabels;
end;

procedure TfrmPrevDuplicataSemForm.PosicionaLabels;
var
  I: Integer;
  NomeCampo: String;
begin
  for I := 0 to Self.ComponentCount - 1 do
    if Self.Components[I] is TRLLabel then
    begin
      NomeCampo := TRLLabel(Self.Components[I]).Name;
      cdsPadrao.Open;
        if cdsPadrao.Locate('NOMECAMPO', NomeCampo, [])then
        begin

          TRLLabel(Components[I]).Top := cdsPadraoVERTICAL.AsInteger;
          TRLLabel(Components[I]).Left := cdsPadraoHORIZONTAL.AsInteger;
          TRLLabel(Components[I]).Font.Size := cdsPadraoFONTE.AsInteger;
          TRLLabel(Components[I]).Font.Name := cdsPadraoTIPOFONTE.AsString;
          
          if Config then
            TRLLabel(Components[i]).Caption := cdsPadraoCAMPO.AsString;

          if cdsPadraoESTILOFONTE.AsString = 'Normal' then
            TRLLabel(Components[I]).Font.Style := [];
          if cdsPadraoESTILOFONTE.AsString = 'Negrito' then
            TRLLabel(Components[I]).Font.Style := [fsBold];
          if cdsPadraoESTILOFONTE.AsString = 'It�lico' then
            TRLLabel(Components[I]).Font.Style := [fsItalic];
          if cdsPadraoESTILOFONTE.AsString = 'Sublinhado' then
            TRLLabel(Components[I]).Font.Style := [fsUnderline];
          if cdsPadraoESTILOFONTE.AsString = 'Negrito It�lico' then
            TRLLabel(Components[I]).Font.Style := [fsBold, fsItalic];
          if cdsPadraoESTILOFONTE.AsString = 'Negrito Sublinhado' then
            TRLLabel(Components[I]).Font.Style := [fsBold, fsUnderline];
          if cdsPadraoESTILOFONTE.AsString = 'It�lico Sublinhado' then
            TRLLabel(Components[I]).Font.Style := [fsItalic, fsUnderline];
          if cdsPadraoESTILOFONTE.AsString = 'Negrito It�lico Sublinhado' then
            TRLLabel(Components[I]).Font.Style := [fsBold, fsItalic, fsUnderline];
        end;
    end;
end;

procedure TfrmPrevDuplicataSemForm.GravaPosicoes;
var
  I: Byte;
  EstiloFonte: String;
begin
  cdsPadrao.Close;
  LimpaTabelaConfig;
  cdsPadrao.Open;

  for I := 0 to Self.ComponentCount - 1 do
    if Self.Components[I] is TRLLabel then
    begin
      cdsPadrao.Insert;
      cdsPadraoNOMECAMPO.AsString := TRLLabel(Self.Components[I]).Name;
      cdsPadraoCAMPO.AsString := TiraUnderline(Copy(TRLLabel(Self.Components[I]).Name, 3,
        Length(TRLLabel(Self.Components[I]).Name)));
      cdsPadraoVERTICAL.AsInteger := TRLLabel(Self.Components[I]).Top;
      cdsPadraoHORIZONTAL.AsInteger := TRLLabel(Self.Components[I]).Left;
      cdsPadraoFONTE.AsInteger := TRLLabel(Self.Components[I]).Font.Size;
      cdsPadraoTIPOFONTE.AsString := TRLLabel(Self.Components[I]).Font.Name;
      if TRLLabel(Self.Components[I]).Font.Style = [] then
        EstiloFonte := 'Normal';
      if TRLLabel(Self.Components[I]).Font.Style = [fsBold] then
        EstiloFonte := 'Negrito';
      if TRLLabel(Self.Components[I]).Font.Style = [fsItalic] then
        EstiloFonte := 'It�lico';
      if TRLLabel(Self.Components[I]).Font.Style = [fsUnderline] then
        EstiloFonte := 'Sublinhado';
      if TRLLabel(Self.Components[I]).Font.Style = [fsBold, fsItalic] then
        EstiloFonte := 'Negrito It�lico';
      if TRLLabel(Self.Components[I]).Font.Style = [fsBold, fsUnderline] then
        EstiloFonte := 'Negrito Sublinhado';
      if TRLLabel(Self.Components[I]).Font.Style = [fsItalic, fsUnderline] then
        EstiloFonte := 'It�lico Sublinhado';
      if TRLLabel(Self.Components[I]).Font.Style = [fsBold, fsItalic, fsUnderline] then
        EstiloFonte := 'Negrito It�lico Sublinhado';
      cdsPadraoESTILOFONTE.AsString :=  EstiloFonte;
    end;
  cdsPadrao.ApplyUpdates(0);
end;

procedure TfrmPrevDuplicataSemForm.rrDuplicataAfterPrint(Sender: TObject);
begin
  GravaPosicoes;
  cdsPadrao.Close;
end;

procedure TfrmPrevDuplicataSemForm.LimpaTabelaConfig;
begin
  with TSQLQuery.Create(Self) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    SQL.Clear; SQL.Text :='delete from CONFIGDUPLICATA';
    ExecSQL;
  finally
    Free;
  end;
end;

end.
