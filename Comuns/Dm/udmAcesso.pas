unit udmAcesso;

interface

uses
  System.SysUtils, System.Classes, udmGeralBase, Data.SqlExpr, Datasnap.DBClient;

type
  TdmAcesso = class(TdmGeralBase)
  private
  public
    function ValidaLogin(login, senha: string): TClientDataSet;
    function UsuarioExiste(login: string): Boolean;

    function GetListaAcesso(IdUsuario: Integer): TClientDataSet;
  end;

var
  dmAcesso: TdmAcesso;

implementation
uses DBXUtils;

{$R *.dfm}

function TdmAcesso.GetListaAcesso(IdUsuario: Integer): TClientDataSet;
begin
  Result := GetClientDataSet(GetConnection,
    'SELECT a.IDUSUARIOS, a.IDMENU, m.MENUITEM '+
    'FROM USUARIOSMENU a '+
    'join MENU m on (m.IDMENU = a.IDMENU) '+
    'where a.IDUSUARIOS = '+IntToStr(IdUsuario));
end;

function TdmAcesso.UsuarioExiste(login: string): Boolean;
begin
  Result := GetCount(GetConnection,'USUARIOS','LOGIN like '+QuotedStr(login)) > 0;
end;

function TdmAcesso.ValidaLogin(login, senha: string): TClientDataSet;
begin
  Result := GetClientDataSet(GetConnection,
    'SELECT a.IDUSUARIOS, a.NOME, a.LOGIN, a.SENHA FROM USUARIOS a '+
    'where a.LOGIN = '+QuotedStr(login)+' and a.SENHA = '+QuotedStr(senha));
end;

end.
