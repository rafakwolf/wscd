unit unModeloEnvelope;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, ZDataset, memds,  DB, SqlDb, FMTBcd;

type

  { TfrmModeloEnvelope }

  TfrmModeloEnvelope = class(TForm)
    rrEnvelope: TRLReport;
    rbFundo: TRLBand;
    lbEmpresa: TRLLabel;
    lbEndereco: TRLLabel;
    lbTelefone: TRLLabel;
    lbCNPJ_IE: TRLLabel;
    dsPadrao: TDataSource;
    dbNome: TRLDBText;
    dbEndereco: TRLDBText;
    dbCidade: TRLDBText;
    dbBairro: TRLDBText;
    dbCep: TRLDBText;
    lbPara: TRLLabel;
    sqldPadrao: TZQuery;
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
    if Components[i] is TSQLQuery then
      TZQuery( Components[i] ).Connection := GetZConnection;
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
