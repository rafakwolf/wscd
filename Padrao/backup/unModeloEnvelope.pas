unit unModeloEnvelope;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, memds,  DB, SqlDb, FMTBcd;

type
  TfrmModeloEnvelope = class(TForm)
    rrEnvelope: TRLReport;
    rbFundo: TRLBand;
    lbEmpresa: TRLLabel;
    lbEndereco: TRLLabel;
    lbTelefone: TRLLabel;
    lbCNPJ_IE: TRLLabel;
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    dsPadrao: TDataSource;
    sqldPadraoNOME: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoCIDADE: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoCEP: TStringField;
    cdsPadraoNOME: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoCIDADE: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCEP: TStringField;
    dbNome: TRLDBText;
    dbEndereco: TRLDBText;
    dbCidade: TRLDBText;
    dbBairro: TRLDBText;
    dbCep: TRLDBText;
    lbPara: TRLLabel;
    procedure rrEnvelopeBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmModeloEnvelope: TfrmModeloEnvelope;

implementation

uses VarGlobal, unDmPrincipal;

{$R *.dfm}

procedure TfrmModeloEnvelope.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount-1 do
  begin
    if Components[i] is TCustomSQLDataSet then
      TCustomSQLDataSet( Components[i] ).SQLConnection := GetConnection;
  end;
end;

procedure TfrmModeloEnvelope.rrEnvelopeBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lbEmpresa.Caption := Empresa.Nome;
  lbEndereco.Caption := Empresa.Cidade +' - '+ Empresa.Estado;
  lbTelefone.Caption := Empresa.Telefone;
  lbCNPJ_IE.Caption := Empresa.Telefone +' - '+ Empresa.InscEstadual;
end;

end.
