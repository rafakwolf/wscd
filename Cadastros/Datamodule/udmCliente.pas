unit udmCliente;

interface

uses
  System.SysUtils, System.Classes, udmGeralBase, Data.FMTBcd, Datasnap.Provider,
  Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.Win.TConnect;

type
  TdmCliente = class(TdmGeralBase)
    sqldPadrao: TSQLDataSet;
    sqldPadraoCODCLIENTE: TIntegerField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoNOME: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoCEP: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoFAX: TStringField;
    sqldPadraoCODCIDADE: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoUF: TStringField;
    sqldPadraoTEMPO_MORADIA: TStringField;
    sqldPadraoEND_ANTERIOR: TStringField;
    sqldPadraoE_MAIL: TStringField;
    sqldPadraoTRABALHO: TStringField;
    sqldPadraoCARGO: TStringField;
    sqldPadraoDATA_INICIO: TDateField;
    sqldPadraoSALARIO: TFMTBCDField;
    sqldPadraoESTADO_CIVIL: TStringField;
    sqldPadraoCONJUGUE: TStringField;
    sqldPadraoLOCAL_TRAB: TStringField;
    sqldPadraoDATA_NASC: TDateField;
    sqldPadraoPAI: TStringField;
    sqldPadraoMAE: TStringField;
    sqldPadraoCPF_CNPJ: TStringField;
    sqldPadraoRG_IE: TStringField;
    sqldPadraoREFER_PES: TStringField;
    sqldPadraoREFER_COM: TStringField;
    sqldPadraoFONE_COM: TStringField;
    sqldPadraoCADASTRO: TDateField;
    sqldPadraoOBS: TMemoField;
    sqldPadraoNATURALIDADE: TStringField;
    sqldPadraoLIMITE: TFMTBCDField;
    sqldPadraoFOTO: TBlobField;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    cdsPadraoCODCLIENTE: TIntegerField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoNOME: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoCODCIDADE: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoUF: TStringField;
    cdsPadraoTEMPO_MORADIA: TStringField;
    cdsPadraoEND_ANTERIOR: TStringField;
    cdsPadraoE_MAIL: TStringField;
    cdsPadraoDATA_INICIO: TDateField;
    cdsPadraoTRABALHO: TStringField;
    cdsPadraoCARGO: TStringField;
    cdsPadraoSALARIO: TFMTBCDField;
    cdsPadraoESTADO_CIVIL: TStringField;
    cdsPadraoCONJUGUE: TStringField;
    cdsPadraoLOCAL_TRAB: TStringField;
    cdsPadraoDATA_NASC: TDateField;
    cdsPadraoPAI: TStringField;
    cdsPadraoCADASTRO: TDateField;
    cdsPadraoMAE: TStringField;
    cdsPadraoCPF_CNPJ: TStringField;
    cdsPadraoRG_IE: TStringField;
    cdsPadraoREFER_PES: TStringField;
    cdsPadraoREFER_COM: TStringField;
    cdsPadraoFONE_COM: TStringField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoNATURALIDADE: TStringField;
    cdsPadraoFAX: TStringField;
    cdsPadraoLIMITE: TFMTBCDField;
    cdsPadraoFOTO: TBlobField;
    procedure dspPadraoAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
  private
  public
    function IsClienteRepetido(cpf_cnpj, rg_ie: string): boolean;
    function GetUltimaCompraCliente(idCliente: Integer): string;

    procedure Cadastrar(Tipo, Nome, Cpf: string);
  end;

var
  dmCliente: TdmCliente;

implementation

uses unDmPrincipal, uDatabaseutils;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

procedure TdmCliente.Cadastrar(Tipo, Nome, Cpf: string);
begin
   //TODO: implementar
end;

procedure TdmCliente.dspPadraoAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;
  DeltaDS.FieldByName('CODCLIENTE').NewValue :=
    SelectSingleField('SELECT NEXT VALUE FOR GENIDCLIENTES FROM RDB$DATABASE',
     GetConnection);
end;

function TdmCliente.GetUltimaCompraCliente(idCliente: Integer): string;
begin
  with TSQLDataSet.Create(nil) do
    try
      SQLConnection := sqldPadrao.SQLConnection;
      CommandText := 'select DATA, TOTAL from VENDA ' + 'where CODCLIENTE = ' +
        QuotedStr(IntToStr(idCliente));
      Open;
      if not IsEmpty then
        Result := 'Data: ' + FormatDateTime('dd/mm/yyyy',
          FieldByName('DATA').AsDateTime) + ' - ' + 'Total: ' +
          FormatFloat('#,##0.00', FieldByName('TOTAL').AsFloat)
      else
        Result := 'Não existem compras deste cliente.';
    finally
      Free;
    end;
end;

function TdmCliente.IsClienteRepetido(cpf_cnpj, rg_ie: string): boolean;
begin
  inherited;
  with TSQLDataSet.Create(nil) do
    try
      SQLConnection := GetConnection;
      CommandText := 'select count(1) from CLIENTES where CPF_CNPJ = ' +
        QuotedStr(cpf_cnpj) + ' or RG_IE = ' + QuotedStr(rg_ie);
      Open;
      Result := Fields[0].AsInteger > 0;
    finally
      Free;
    end;
end;

end.
