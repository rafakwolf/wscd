unit unDmPrincipal;

interface

uses
  SysUtils, Classes, DB, Dialogs, Forms, Controls,
  Messages, Graphics, Windows, FMTBcd,
  udmBase, ZAbstractConnection, ZConnection, ormbr.dml.generator.firebird;

type
  TDmPrincipal = class(TdmBase)
    procedure ConexaoBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    function ConectaBanco: Boolean; override;

    function EnviaCaixa(Data: TDateTime; Historico: string;
      Doc: string; Tipo: string; Valor: Currency; IdConta: Integer = 0): Boolean;

    function SituacaoClienteOk(Valor: Currency; Codigo: Integer): Boolean;

    function Conexao: TZConnection;
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

{$R *.dfm}

function TDmPrincipal.Conexao: TZConnection;
begin
  Result := dbConn;
end;

procedure TDmPrincipal.ConexaoBeforeConnect(Sender: TObject);
begin
  inherited;
  dbConn.HostName := 'localhost';
  dbConn.Port := 3050;
  dbConn.Database := 'd:\dev\desktop\wscd\database\CPR2.fdb';
  dbConn.User := 'SYSDBA';
  dbConn.Password := 'masterkey';
  dbConn.Catalog := 'UTF8';
end;

procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
begin
  inherited;
  dbConn.Connect;
end;

procedure TDmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  dbConn.Disconnect;
end;

function TDmPrincipal.EnviaCaixa(Data: TDateTime; Historico, Doc, Tipo: string;
  Valor: Currency; IdConta: Integer): Boolean;
begin
end;

function TDmPrincipal.SituacaoClienteOk(Valor: Currency;
  Codigo: Integer): Boolean;
begin
end;

function TDmPrincipal.ConectaBanco: Boolean;
begin
 try
   dbConn.Connected := true;
   Result := true;
 except
   Result := false;
 end;
end;

end.
