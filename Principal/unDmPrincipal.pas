unit unDmPrincipal;

{$MODE Delphi}

interface

uses
  SysUtils, Classes, DB, sqldb, Dialogs, Forms, Controls,
  Messages, ExtCtrls,  Graphics,  LCLIntf, LCLType, LMessages, FMTBcd,
  udmBase;

type

  { TDmPrincipal }

  TDmPrincipal = class(TdmBase)
    procedure DataModuleCreate(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    function ConectaBanco: Boolean; override;

    function EnviaCaixa(Data: TDateTime; Historico: string; Doc: string;
      Tipo: string; Valor: Currency; IdConta: Integer = 0): Boolean;


    function SituacaoClienteOk(Valor: Currency; Codigo: Integer): Boolean;
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

{$R *.lfm}

procedure TDmPrincipal.ConexaoBeforeConnect(Sender: TObject);
begin
  inherited;
  ZConnection1.HostName:='127.0.0.1';
  ZConnection1.Port:=3306;
  ZConnection1.Database:='wscd';
  ZConnection1.User:='root';
  ZConnection1.Password:='mysqlrocks!';
  ZConnection1.Protocol:='mysql';
  ZConnection1.LibraryLocation:='/opt/homebrew/Cellar/mysql-client/9.4.0/lib/libmysqlclient.24.dylib';
end;

procedure TDmPrincipal.DataModuleDestroy(Sender: TObject);
begin
   ZConnection1.Disconnect;
end;

procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
begin
  Application.HintHidePause := 5000;
  Application.HintPause := 10;
end;

function TDmPrincipal.SituacaoClienteOk(Valor: Currency;
  Codigo: Integer): Boolean;
begin
end;

function TDmPrincipal.ConectaBanco: Boolean;
begin
  ZConnection1.Connect;
  Result := ZConnection1.Connected;
end;

function TDmPrincipal.EnviaCaixa(Data: TDateTime; Historico: string;
  Doc: string; Tipo: string; Valor: Currency; IdConta: Integer): Boolean;
begin
  // not implemented yet
end;

end.
