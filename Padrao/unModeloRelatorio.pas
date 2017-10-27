unit unModeloRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, DBClient, Provider, SqlExpr, RLParser, FMTBcd,
  RLConsts, UniGuiForm;

type
  TfrmModeloRelatorio = class(TUniForm)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dsPadrao: TDataSource;
    rlepCalculos: TRLExpressionParser;
    rbTitulo: TRLBand;
    lbTitulo: TRLLabel;
    rbRodape: TRLBand;
    sysData: TRLSystemInfo;
    sysPage: TRLSystemInfo;
    rlmCabecalho: TRLMemo;
    imgLogo: TRLImage;
    rrPadrao: TRLReport;
    procedure rrPadraoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
  public
    function Totaliza(pDataSet: TClientDataSet; pTotalField, pFieldTipo, pTipo: string): Extended;
  end;

var
  frmModeloRelatorio: TfrmModeloRelatorio;

implementation

uses VarGlobal;

{$R *.dfm}

procedure TfrmModeloRelatorio.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount-1 do
  begin
    if Components[i] is TCustomSQLDataSet then
      TCustomSQLDataSet(Components[i]).SQLConnection := getConnection;
  end;
end;

procedure TfrmModeloRelatorio.rrPadraoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  x: Integer;  
begin
  //ConfigRelatorioRL(rrPadrao, rlmCabecalho, imgLogo);

  imgLogo.Height := 75;
  imgLogo.Width  := 98;

  rlmCabecalho.Height := 75;

  lbTitulo.Height := 31;

  for x := 0 to ComponentCount - 1 do
  begin
    if Components[x] is TRLBand then
      if TRLBand(Components[x]).BandType = btColumnHeader then
      begin
        TRLBand(Components[x]).Color := clBtnFace;
        if TRLBand(Components[x]).Height < 20 then
          TRLBand(Components[x]).Height := 20;
      end;
  end;
  Update;
end;

function TfrmModeloRelatorio.Totaliza(pDataSet: TClientDataSet; pTotalField,
  pFieldTipo, pTipo: string): Extended;
var
  Total: Extended;
begin
  Total := 0;
  if not pDataSet.Active then
    pDataSet.Open;
  pDataSet.First;
  while not pDataSet.Eof do
  begin
    if (pTipo <> '') and (pFieldTipo <> '') then
    begin
      if pDataSet.FieldByName(pFieldTipo).AsString = pTipo then
        Total := Total + pDataSet.FieldByName(pTotalField).AsFloat;
    end
    else
      Total := Total + pDataSet.FieldByName(pTotalField).AsFloat;
    pDataSet.Next;
  end;
  Result := Total;
end;

end.
