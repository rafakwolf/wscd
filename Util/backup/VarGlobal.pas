unit VarGlobal;

interface

uses Classes, Sqldb, unDmPrincipal, uClasses, uDmPesquisar;

function GetConnection: TSQLConnection;
function GetDataModule: TDmPrincipal;
function GetDmPesquisar: TDmPesquisar;

var
  IdUsuario: Integer;
  Usuario: string;
  Configuracao: TConfiguracao;
  Global: TConfigGlobal;
  Empresa: TEmpresa;
  Sistema: TSistema;

implementation

function GetConnection: TSQLConnection;
begin
  result := DmPrincipal.Conexao;
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
