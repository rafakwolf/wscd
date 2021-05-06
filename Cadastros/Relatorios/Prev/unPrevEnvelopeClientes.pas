unit unPrevEnvelopeClientes;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unModeloEnvelope, DB, memds,  SqlDb,
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
