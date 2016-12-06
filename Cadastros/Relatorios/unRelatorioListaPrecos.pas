unit unRelatorioListaPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, DBClient, Provider, SqlExpr, FMTBcd;

type
  TfrmRelatorioListaPrecos = class(TForm)
    rpLista: TRLReport;
    bandCabecalho: TRLBand;
    bandDetalhe: TRLDetailGrid;
    lbTitulo: TRLLabel;
    dbtDescricao: TRLDBText;
    dbtPreco: TRLDBText;
    bandRodape: TRLBand;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dsPadrao: TDataSource;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    dbData: TRLSystemInfo;
    dbpage: TRLSystemInfo;
    sqldPadraoVENDA: TFMTBCDField;
    cdsPadraoVENDA: TFMTBCDField;
    procedure bandDetalheBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rpListaBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
  public
    Titulo: string;
  end;

var
  frmRelatorioListaPrecos: TfrmRelatorioListaPrecos;
  Cor: Boolean = True;

implementation



{$R *.dfm}

procedure TfrmRelatorioListaPrecos.bandDetalheBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if Cor then
  begin
    Cor := False;
    bandDetalhe.Color := $00F0F0F0;
  end
  else
  begin
    Cor := True;
    bandDetalhe.Color := clWhite;
  end;
end;

procedure TfrmRelatorioListaPrecos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRelatorioListaPrecos.rpListaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lbTitulo.Caption := Titulo;
end;

end.
