unit unPrevNotaVendaMatric;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, DB, SqlExpr, PLSQLDataSet, FMTBcd, VDODmPrinter,
  VDOBasePrinter;

type
  TfrmPrevNotaVendaMatric = class(TfrmSimplePadrao)
    sqldCabecalho: TPLSQLDataSet;
    sqldCabecalhoCODIGO: TIntegerField;
    sqldCabecalhoCAMPO: TStringField;
    sqldCabecalhoLAYOUT: TStringField;
    sqldCabecalhoREFERENCIA: TStringField;
    sqldCabecalhoTIPO: TStringField;
    sqldCabecalhoLINHA: TIntegerField;
    sqldCabecalhoCOLUNA: TIntegerField;
    sqldCabecalhoIMPRIMIR: TStringField;
    sqldCabItens: TPLSQLDataSet;
    sqldCabItensCODIGO: TIntegerField;
    sqldCabItensCAMPO: TStringField;
    sqldCabItensLAYOUT: TStringField;
    sqldCabItensREFERENCIA: TStringField;
    sqldCabItensTIPO: TStringField;
    sqldCabItensLINHA: TIntegerField;
    sqldCabItensCOLUNA: TIntegerField;
    sqldCabItensIMPRIMIR: TStringField;
    sqldRodape: TPLSQLDataSet;
    sqldRodapeCODIGO: TIntegerField;
    sqldRodapeCAMPO: TStringField;
    sqldRodapeLAYOUT: TStringField;
    sqldRodapeREFERENCIA: TStringField;
    sqldRodapeTIPO: TStringField;
    sqldRodapeLINHA: TIntegerField;
    sqldRodapeCOLUNA: TIntegerField;
    sqldRodapeIMPRIMIR: TStringField;
    sqldVenda: TPLSQLDataSet;
    sqldItemVenda: TPLSQLDataSet;
    sqldDataItens: TPLSQLDataSet;
    sqldDataItensCODIGO: TIntegerField;
    sqldDataItensCAMPO: TStringField;
    sqldDataItensLAYOUT: TStringField;
    sqldDataItensREFERENCIA: TStringField;
    sqldDataItensTIPO: TStringField;
    sqldDataItensLINHA: TIntegerField;
    sqldDataItensCOLUNA: TIntegerField;
    sqldDataItensIMPRIMIR: TStringField;
    sqldVendaCODIGO: TIntegerField;
    sqldVendaDATA: TDateField;
    sqldVendaCODVENDEDOR: TIntegerField;
    sqldVendaVENDEDOR: TStringField;
    sqldVendaCODCLIENTE: TIntegerField;
    sqldVendaCLIENTE: TStringField;
    sqldVendaCPF_CNPJ: TStringField;
    sqldVendaCEPCLIENTE: TStringField;
    sqldVendaCIDADECLIENTE: TStringField;
    sqldVendaFONECLIENTE: TStringField;
    sqldVendaENDERECOCLIENTE: TStringField;
    sqldVendaTOTALDESCTO: TFMTBCDField;
    sqldVendaTOTAL: TFMTBCDField;
    sqldItemVendaCODVENDA: TIntegerField;
    sqldItemVendaCODPRODUTO: TIntegerField;
    sqldItemVendaPRODUTO: TStringField;
    sqldItemVendaQTDE: TIntegerField;
    sqldItemVendaDESCTO: TFMTBCDField;
    sqldItemVendaPRECO: TFMTBCDField;
    sqldItemVendaTOTAL: TFMTBCDField;
    VDODmPrinter: TVDODmPrinter;
  private
    FIdVenda: Integer;
    procedure SetIdVenda(const Value: Integer);

    procedure Cabecalho(var pComp: TVDODmPrinter; var pLinhaAtual: Integer);
    procedure Rodape(var pComp: TVDODmPrinter; var pLinhaAtual: Integer);
  public
    property IdVenda: Integer read FIdVenda write SetIdVenda;

    procedure ImprimirVDO;
    procedure Escreve(Linha, Coluna: Integer; var LinhaAtual: Integer;
      Texto: string; var pVDODmPrinter: TVDODmPrinter);
  end;

var
  frmPrevNotaVendaMatric: TfrmPrevNotaVendaMatric;

implementation

uses Funcoes, unAguarde;

{$R *.dfm}

procedure TfrmPrevNotaVendaMatric.Cabecalho(var pComp: TVDODmPrinter; var pLinhaAtual: Integer);

  function Ajusta(const s: String; Index, Count: Integer): string;
  begin
    Result := NormalizeStr(copy(s, Index, Count));
  end;

begin
  sqldCabecalho.Open;

  if pLinhaAtual <> sqldCabecalhoLINHA.AsInteger then
    pLinhaAtual := sqldCabecalhoLINHA.AsInteger;

  sqldCabecalho.First;
  while not sqldCabecalho.Eof do
  begin
    if sqldCabecalhoTIPO.AsString = 'T' then
      Escreve(sqldCabecalhoLINHA.AsInteger, sqldCabecalhoCOLUNA.AsInteger, pLinhaAtual,
        Ajusta(sqldCabecalhoLAYOUT.AsString, 1, (80 - sqldCabecalhoCOLUNA.AsInteger)),
        pComp)
    else
      Escreve(sqldCabecalhoLINHA.AsInteger, sqldCabecalhoCOLUNA.AsInteger, pLinhaAtual,
        Ajusta(sqldVenda.FieldByName(sqldCabecalhoREFERENCIA.AsString).AsString, 1,
        (80 - sqldCabecalhoCOLUNA.AsInteger)), pComp);

    sqldCabecalho.Next;
  end;
  sqldCabecalho.Close;
end;

procedure TfrmPrevNotaVendaMatric.Escreve(Linha, Coluna: Integer;
  var LinhaAtual: Integer; Texto: string;
  var pVDODmPrinter: TVDODmPrinter);
var
  x: Integer;
begin
  with pVDODmPrinter do
  begin
    if (Linha <> LinhaAtual) then
    begin
      for x := LinhaAtual to (Linha-1) do
      begin
        Print(0, '', True);
        Inc(LinhaAtual);
      end;
    end;
    Print(Coluna, Texto);
  end;
end;

procedure TfrmPrevNotaVendaMatric.ImprimirVDO;

  function Ajusta(const s: String; Index, Count: Integer): string;
  begin
    Result := NormalizeStr(copy(s, Index, Count));
  end;

var
  i: Integer;
  LinhaAtual: Integer;
begin
  TfrmAguarde.Execute('Preparando relatório, aguarde...');

  with VDODmPrinter do
  begin
    BeginDoc;

    Font.Size := fsCondensed;
    Font.Pitch := fp10cpp;
    LineSpacing := lsCustom;
    LineSpacingCustomValue := 18;

    // cabeçalho
    Cabecalho(VDODmPrinter, LinhaAtual);

    // Cabeçalho dos itens
    sqldCabItens.Open;
    sqldCabItens.First;


    while not sqldCabItens.Eof do
    begin
      if sqldCabItensTIPO.AsString = 'T' then
        Escreve(sqldCabItensLINHA.AsInteger, sqldCabItensCOLUNA.AsInteger,
          LinhaAtual, Ajusta(sqldCabItensLAYOUT.AsString, 1, 80), VDODmPrinter);
      sqldCabItens.Next;
    end;
    sqldCabItens.Close;

    // Dados dos itens

    sqldDataItens.Open;
    i := sqldDataItensLINHA.AsInteger;


    sqldItemVenda.First;
    while not sqldItemVenda.Eof do
    begin

      sqldDataItens.First;
      while not sqldDataItens.Eof do
      begin
        if sqldItemVenda.FieldByName(sqldDataItensREFERENCIA.AsString).DataType
          in [ftFloat, ftCurrency] then
          Escreve(i, sqldDataItensCOLUNA.AsInteger, LinhaAtual,
            FormatFloat('#,##0.00', sqldItemVenda.FieldByName(sqldDataItensREFERENCIA.AsString).AsFloat),
            VDODmPrinter)
        else
          Escreve(i, sqldDataItensCOLUNA.AsInteger, LinhaAtual,
            Ajusta(sqldItemVenda.FieldByName(sqldDataItensREFERENCIA.AsString).AsString, 1,
            29), VDODmPrinter);

        sqldDataItens.Next;
      end;
      Inc(i);
      sqldItemVenda.Next;
    end;

    // Rodapé
    Rodape(VDODmPrinter, LinhaAtual);

    FreeAndNil(frmAguarde);

    EndDoc;
  end;
end;

procedure TfrmPrevNotaVendaMatric.Rodape(var pcomp: TVDODmPrinter; var pLinhaAtual: Integer);

  function Ajusta(const s: String; Index, Count: Integer): string;
  begin
    Result := NormalizeStr(copy(s, Index, Count));
  end;

begin
  sqldRodape.Open;
  sqldRodape.First;
  while not sqldRodape.Eof do
  begin
    if sqldRodapeTIPO.AsString = 'T' then
      Escreve(sqldRodapeLINHA.AsInteger, sqldRodapeCOLUNA.AsInteger, pLinhaAtual,
      Ajusta(sqldRodapeLAYOUT.AsString, 1, (80 - sqldRodapeCOLUNA.AsInteger)), pComp)
    else
    begin
      if sqldVenda.FieldByName(sqldRodapeREFERENCIA.AsString).DataType in [ftFloat, ftCurrency] then
        Escreve(sqldRodapeLINHA.AsInteger, sqldRodapeCOLUNA.AsInteger, pLinhaAtual,
        FormatFloat('#,##0.00', sqldVenda.FieldByName(sqldRodapeREFERENCIA.AsString).AsFloat),
        pComp)
      else
        Escreve(sqldRodapeLINHA.AsInteger, sqldRodapeCOLUNA.AsInteger, pLinhaAtual,
          Ajusta(sqldVenda.FieldByName(sqldRodapeREFERENCIA.AsString).AsString, 1,
          (80 - sqldRodapeCOLUNA.AsInteger)), pComp);
    end;
    sqldRodape.Next;
  end;
end;

procedure TfrmPrevNotaVendaMatric.SetIdVenda(const Value: Integer);
begin
  FIdVenda := Value;
  { cabeçalho }
  sqldVenda.Close;
  sqldVenda.Params.ParamByName('IDVENDA').AsInteger := FIdVenda;
  sqldVenda.Open;
  { itens }
  sqldItemVenda.Close;
  sqldItemVenda.Params.ParamByName('IDVENDA').AsInteger := FIdVenda;
  sqldItemVenda.Open;
end;

end.
