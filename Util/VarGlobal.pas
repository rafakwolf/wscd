unit VarGlobal;

interface

uses Classes, unDmPrincipal, uClasses, uDmPesquisar, ZConnection;

function GetConnection: TZConnection; overload;
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

function GetConnection: TZConnection;
begin
  Result := DmPrincipal.Conexao;
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
