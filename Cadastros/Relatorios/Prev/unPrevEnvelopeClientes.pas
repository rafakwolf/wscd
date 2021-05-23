unit unPrevEnvelopeClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloEnvelope, DB, DBClient, Provider, SqlExpr,
  RLReport, FMTBcd;

type
  TfrmPrevEnvelopeCliente = class(TfrmModeloEnvelope)
    sqldPadraoDATA: TDateField;
    cdsPadraoDATA: TDateField;
  private
  public
  end;

var
  frmPrevEnvelopeCliente: TfrmPrevEnvelopeCliente;

implementation

{$R *.dfm}

end.
