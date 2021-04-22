unit udmAcesso;

interface

uses
  SysUtils, Classes, udmGeralBase, Sqldb, memds,
  DB;

type
  TdmAcesso = class(TdmGeralBase)
  private
  public
    function ValidaLogin(login, senha: string): TMemDataSet;
    function UsuarioExiste(login: string): Boolean;

    function GetListaAcesso(IdUsuario: Integer): TMemDataSet;
  end;

var
  dmAcesso: TdmAcesso;

implementation

{$R *.dfm}

function TdmAcesso.GetListaAcesso(IdUsuario: Integer): TMemDataSet;
begin
  Result := GeTMemDataset(GetConnection,
    'SELECT a.IDUSUARIOS, a.IDMENU, m.MENUITEM '+
    'FROM USUARIOSMENU a '+
    'join MENU m on (m.IDMENU = a.IDMENU) '+
    'where a.IDUSUARIOS = '+IntToStr(IdUsuario));
end;

function TdmAcesso.UsuarioExiste(login: string): Boolean;
begin
  Result := GetCount(GetConnection,'USUARIOS','LOGIN like '+QuotedStr(login)) > 0;
end;

function TdmAcesso.ValidaLogin(login, senha: string): TMemDataSet;
begin
  Result := GeTMemDataset(GetConnection,
    'SELECT a.IDUSUARIOS, a.NOME, a.LOGIN, a.SENHA FROM USUARIOS a '+
    'where a.LOGIN = '+QuotedStr(login)+' and a.SENHA = '+QuotedStr(senha));
end;

end.
