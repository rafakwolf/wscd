unit VarGlobal;

interface

uses Classes, sqldb, unDmPrincipal, uClasses, uDmPesquisar, ZConnection;

function GetConnection: TSQLConnection;
function GetZConnection: TZConnection;
function GetDataModule: TDmPrincipal;
function GetDmPesquisar: TDmPesquisar;

var
  IdUsuario: Integer;
  Usuario: string;
  Configuracao: TConfiguracao;
  Empresa: TEmpresa;
  Sistema: TSistema;

implementation

function GetConnection: TSQLConnection;
begin
  result := DmPrincipal.Conexao;
end;

function GetZConnection: TZConnection;
begin
  Result := DmPrincipal.ZConnection1;
end;

function GetDataModule: TDmPrincipal;
begin
  Result := DmPrincipal;
end;

function GetDmPesquisar: TDmPesquisar;
begin
  Result := dmPesquisar;
end;

end.
