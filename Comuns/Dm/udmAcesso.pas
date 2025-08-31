unit udmAcesso;

interface

uses
  SysUtils, Classes, udmGeralBase, Sqldb, memds, zdataset, varGlobal,
  DB, uDatabaseUtils;

type
  TdmAcesso = class(TdmGeralBase)
  private
  public
    function ValidaLogin(login, senha: string; owner: TComponent): TDataSet;
    function UsuarioExiste(login: string): Boolean;

    function GetListaAcesso(IdUsuario: Integer; owner: TComponent): TDataSet;
  end;

var
  dmAcesso: TdmAcesso;

implementation

{$R *.dfm}

function TdmAcesso.GetListaAcesso(IdUsuario: Integer; owner: TComponent): TDataSet;
var q: TZQuery;
begin
  q := TZQuery.create(owner);
  q.Connection := getzConnection;
  q.SQL.Add(
    'SELECT a.IDUSUARIOS, a.IDMENU, m.MENUITEM '+
    'FROM USUARIOSMENU a '+
    'join MENU m on (m.IDMENU = a.IDMENU) '+
    'where a.IDUSUARIOS = '+IntToStr(IdUsuario));
  q.Open;
  Result := q;
end;

function TdmAcesso.UsuarioExiste(login: string): Boolean;
var count: Integer;
begin
  if (login = 'adm') then begin
    Result := True;
    Abort;
  end;

 count := SelecSingleField('select count(1) from USUARIOS where LOGIN like '+QuotedStr(login), getzConnection);
 Result := count > 0;
end;

function TdmAcesso.ValidaLogin(login, senha: string; owner: TComponent): TDataSet;
var q: TZQuery;
begin
  q := TZQuery.create(owner);
  q.Connection := getzConnection;
  q.SQL.Add(
    'SELECT a.IDUSUARIOS, a.NOME, a.LOGIN, a.SENHA FROM USUARIOS a '+
    'where a.LOGIN = '+QuotedStr(login)+' and a.SENHA = '+QuotedStr(senha));
  q.Open;
  Result := q;
end;

end.
