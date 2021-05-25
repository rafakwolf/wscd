unit uClasses;

{$MODE Delphi}

interface

uses
  SysUtils, Classes, ZDataset, DB, Forms, unDmPrincipal, uUtilFncs, inifiles;

type
  TConfiguracao = class
  private
    sqldConfiguracao: TZQuery;
    function GetCaixaPadrao: Integer;
    function GetSenhaCaixa: String;
    function GetLancCaixa90Dias: Boolean;
    function GetMostrarSaldoCaixa: Boolean;
    function getRelZebrado: Boolean;
  public
    property CaixaPadrao         : Integer read GetCaixaPadrao;
    property SenhaCaixa          : String read GetSenhaCaixa;
    property MostrarSaldoCaixa   : Boolean read GetMostrarSaldoCaixa;
    property LancCaixa90Dias     : Boolean read GetLancCaixa90Dias;
    property RelZebrado          : Boolean read GetRelZebrado;

    constructor Create;
    destructor Free;
    procedure Atualizar;
  end;

  TEmpresa = class
  private
    sqldEmpresa: TZQuery;
    function GetBairro: String;
    function GetCep: String;
    function GetCidade: String;
    function GetCnpj: String;
    function GetEmpresa: String;
    function GetEndereco: String;
    function GetEstado: String;
    function GetFax: String;
    function GetInscEstadual: String;
    function GetResponsavel: String;
    function GetTelefone: String;
    function getEmail: string;
  public
    property Nome        : String read GetEmpresa;
    property Cnpj        : String read GetCnpj;
    property InscEstadual: String read GetInscEstadual;
    property Endereco    : String read GetEndereco;
    property Cidade      : String read GetCidade;
    property Bairro      : String read GetBairro;
    property Cep         : String read GetCep;
    property Telefone    : String read GetTelefone;
    property Fax         : String read GetFax;
    property Estado      : String read GetEstado;
    property Responsavel : String read GetResponsavel;
    property Email       : string read getEmail;

    constructor Create;
    destructor Free;
    procedure Atualizar;
  end;

  TSistema = class
  private
    sqldSistema: TZQuery;
    function GetAppCaption: String;
    function GetDataAcesso: String;
    function GetDataValidade: String;
    function GetHD: String;
    function GetPastaSistema: string;
    function GetSerial: string;
    function GetVersaoApp: String;
    function GetVersaoDB: String;
  public
    property AppCaption   : String read GetAppCaption;
    property VersaoApp    : String read GetVersaoApp;
    property VersaoDB     : String read GetVersaoDB;
    property DataAcesso   : String read GetDataAcesso;
    property HD           : String read GetHD;
    property DataValidade : String read GetDataValidade;
    property PastaSistema : string read GetPastaSistema;
    property Serial       : string read GetSerial;

    constructor Create;
    destructor Free;
    procedure Atualizar;
  end;

implementation

procedure TConfiguracao.Atualizar;
begin
  sqldConfiguracao.Close;
  sqldConfiguracao.Open;
end;

constructor TConfiguracao.Create;
begin
  sqldConfiguracao := TZQUery.Create(nil);
  with sqldConfiguracao do
  begin
    Connection := DmPrincipal.ZConnection1;
    Close;
    SQL.Text := 'select'+
                   ' CAIXAPADRAO,'+
                   ' SENHACAIXA,'+
                   ' MOSTRARSALDOCAIXA,'+
                   ' CAIXA90DIAS,'+
                   ' RELZEBRADO '+
                   'from CONFIGURACAO '+
                   'where NOMECOMPUTADOR = :COMP';
    Params.ParamByName('COMP').AsString := GetComputerName;
    Open;

    if IsEmpty then
    begin
      with TZQuery.Create(nil) do
      try
        Connection := DmPrincipal.ZConnection1;
        SQL.Text := 'insert into CONFIGURACAO(NOMECOMPUTADOR, CAIXAPADRAO) values(:NOMECOMPUTADOR, :CAIXAPADRAO)';
        Prepare;
        Params.ParamByName('NOMECOMPUTADOR').AsString := GetComputerName;
        Params.ParamByName('CAIXAPADRAO').AsInteger := 0;
        ExecSQL;
      finally
        Free;
      end;
    end;
  end;
end;

destructor TConfiguracao.Free;
begin
  sqldConfiguracao.Free;
end;

function TConfiguracao.GetCaixaPadrao: Integer;
begin
  Result := sqldConfiguracao.FieldByName('CAIXAPADRAO').AsInteger;
end;

function TConfiguracao.GetLancCaixa90Dias: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('CAIXA90DIAS').AsString = 'S');
end;

function TConfiguracao.GetMostrarSaldoCaixa: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('MOSTRARSALDOCAIXA').AsString = 'S');
end;

function TConfiguracao.getRelZebrado: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('RELZEBRADO').AsString = 'S');
end;

function TConfiguracao.GetSenhaCaixa: String;
begin
  Result := sqldConfiguracao.FieldByName('SENHACAIXA').AsString;
end;

procedure TEmpresa.Atualizar;
begin
  sqldEmpresa.Close;
  sqldEmpresa.Open;
end;

constructor TEmpresa.Create;
begin
  sqldEmpresa := TZQuery.Create(nil);
  with sqldEmpresa do
  begin
    Connection := DmPrincipal.ZConnection1;
    SQL.Text := 'SELECT '+
     ' e.RAZASOCIAL as RAZAOSOCIAL, '+
     ' e.CNPJ, '+
     ' e.IE, '+
     ' e.ENDERECO, '+
     ' c.Descricao, '+
     ' e.BAIRRO, '+
     ' e.CEP, '+
     ' e.TELEFONE, '+
     ' e.FAX, '+
     ' e.UF, '+
     ' e.RESPONSAVEL, '+
     ' e.Logoempresa, '+
     ' e.EMAIL '+
    'FROM EMPRESA e '+
    'LEFT JOIN CIDADES c on (e.Idcidade = c.Codcidade)';
    Open;
  end;
end;

destructor TEmpresa.Free;
begin
  sqldEmpresa.Free;
end;

function TEmpresa.GetBairro: String;
begin
  Result := sqldEmpresa.FieldByName('BAIRRO').AsString;
end;

function TEmpresa.GetCep: String;
begin
  Result := sqldEmpresa.FieldByName('CEP').AsString;
end;

function TEmpresa.GetCidade: String;
begin
  Result := sqldEmpresa.FieldByName('CIDADE').AsString;
end;

function TEmpresa.GetCnpj: String;
begin
  Result := sqldEmpresa.FieldByName('CNPJ').AsString;
end;

function TEmpresa.getEmail: string;
begin
  Result := sqldEmpresa.FieldByName('EMAIL').AsString;
end;

function TEmpresa.GetEmpresa: String;
begin
  Result := sqldEmpresa.FieldByName('RAZAOSOCIAL').AsString;
end;

function TEmpresa.GetEndereco: String;
begin
  Result := sqldEmpresa.FieldByName('ENDERECO').AsString;
end;

function TEmpresa.GetEstado: String;
begin
  Result := sqldEmpresa.FieldByName('UF').AsString;
end;

function TEmpresa.GetFax: String;
begin
  Result := sqldEmpresa.FieldByName('FAX').AsString;
end;

function TEmpresa.GetInscEstadual: String;
begin
  Result := sqldEmpresa.FieldByName('IE').AsString;
end;

function TEmpresa.GetResponsavel: String;
begin
  Result := sqldEmpresa.FieldByName('RESPONSAVEL').AsString;
end;

function TEmpresa.GetTelefone: String;
begin
  Result := sqldEmpresa.FieldByName('TELEFONE').AsString;
end;

procedure TSistema.Atualizar;
begin
  sqldSistema.Close;
  sqldSistema.Open;
end;

constructor TSistema.Create;
begin
  sqldSistema := TZQuery.Create(nil);
  with sqldSistema do
  begin
    Connection := DmPrincipal.ZConnection1;
    SQL.Text := 'select '+
                   '  s.IDSISTEMA,'+
                   '  s.VERSAO,'+
                   '  s.DATAVALIDADE,'+
                   '  s.DATA_ACESSO,'+
                   '  s.SERIAL,'+
                   '  s.HD '+
                   'from SISTEMA s '+
                   'where s.IDSISTEMA = 1';
    Open;
  end;
end;

destructor TSistema.Free;
begin
  sqldSistema.Free;
end;

function TSistema.GetAppCaption: String;
begin
  Result := 'CPR - Sistema Comercial';
end;

function TSistema.GetDataAcesso: String;
begin
  Result := sqldSistema.FieldByName('DATA_ACESSO').AsString;
end;

function TSistema.GetDataValidade: String;
begin
  Result := sqldSistema.FieldByName('DATAVALIDADE').AsString;
end;

function TSistema.GetHD: String;
begin
  Result := sqldSistema.FieldByName('HD').AsString;
end;

function TSistema.GetPastaSistema: string;
begin
  Result := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName));
end;

function TSistema.GetSerial: string;
begin
  Result := sqldSistema.FieldByName('SERIAL').AsString;
end;

function TSistema.GetVersaoApp: String;
begin
  Result := GetBuildInfo(ParamStr(0));
end;

function TSistema.GetVersaoDB: String;
begin
  Result := sqldSistema.FieldByName('VERSAO').AsString;
end;

end.

