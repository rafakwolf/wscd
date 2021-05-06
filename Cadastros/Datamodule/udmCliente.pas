unit udmCliente;

interface

uses
  SysUtils, Classes, udmGeralBase, FMTBcd, 
  DB, Sqldb, memds, ExtCtrls, ZDataset;

type

  { TdmCliente }

  TdmCliente = class(TdmGeralBase)
    ZQuery1: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
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

{$R *.dfm}

procedure TdmCliente.Cadastrar(Tipo, Nome, Cpf: string);
begin
   Zquery1.close;
   zquery1.sql.Clear;
   zquery1.sql.add('INSERT INTO wscd.CLIENTES '+
     '(TIPO, NOME, ENDERECO, CEP, BAIRRO, TELEFONE, '+
     'FAX, CODCIDADE, UF, TEMPO_MORADIA, END_ANTERIOR, '+
     'E_MAIL, TRABALHO, CARGO, DATA_INICIO, SALARIO, '+
     'ESTADO_CIVIL, CONJUGUE, LOCAL_TRAB, DATA_NASC, PAI, '+
     'MAE, CPF_CNPJ, RG_IE, REFER_PES, REFER_COM, FONE_COM, '+
     'CADASTRO, OBS, NATURALIDADE, LIMITE, FOTO)'+
     'VALUES( '+
     ':TIPO, :NOME, :ENDERECO, :CEP, :BAIRRO, :TELEFONE, '+
     ':FAX, :CODCIDADE, :UF, :TEMPO_MORADIA, :END_ANTERIOR, '+
     ':E_MAIL, :TRABALHO, :CARGO, :DATA_INICIO, :SALARIO, '+
     ':ESTADO_CIVIL, :CONJUGUE, :LOCAL_TRAB, :DATA_NASC, :PAI, '+
     ':MAE, :CPF_CNPJ, :RG_IE, :REFER_PES, :REFER_COM, :FONE_COM, '+
     ':CADASTRO, :OBS, :NATURALIDADE, :LIMITE, :FOTO)');
   ZQuery1.ParamByName('TIPO').Value := Tipo;
   zquery1.ParamByName('NOME').Value := Nome;
   zquery1.ParamByName('CPF').Value := Cpf;
   zquery1.ExecSQL;
end;

procedure TdmCliente.DataModuleCreate(Sender: TObject);
begin
  ZQuery1.Connection := DmPrincipal.ZConnection1;
end;

function TdmCliente.GetUltimaCompraCliente(idCliente: Integer): string;
begin
  with TZQuery.Create(nil) do
    try
      Connection := ZQuery1.Connection;
      SQL.Clear;
      SQL.Add('select DATA, TOTAL from VENDA where CODCLIENTE = ' +
        QuotedStr(IntToStr(idCliente)));
      Open;
      if not IsEmpty then
        Result := 'Data: ' + FormatDateTime('dd/mm/yyyy',
          FieldByName('DATA').AsDateTime) + ' - ' + 'Total: ' +
          FormatFloat('#,##0.00', FieldByName('TOTAL').AsFloat)
      else
        Result := 'Nao existem compras deste cliente.';
    finally
      Free;
    end;
end;

function TdmCliente.IsClienteRepetido(cpf_cnpj, rg_ie: string): boolean;
begin
  inherited;
  with TZQuery.Create(nil) do
    try
      Connection := ZQuery1.Connection;
      SQL.Clear;
      SQL.add('select count(1) from CLIENTES where CPF_CNPJ = ' +
        QuotedStr(cpf_cnpj) + ' or RG_IE = ' + QuotedStr(rg_ie));
      Open;
      Result := Fields[0].AsInteger > 0;
    finally
      Free;
    end;
end;

end.
