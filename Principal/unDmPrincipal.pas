unit unDmPrincipal;

{$MODE Delphi}

interface

uses
  SysUtils, Classes, DB, sqldb, Dialogs, Forms, Controls,
  Messages, Graphics,  LCLIntf, LCLType, LMessages, FMTBcd,
  udmBase;

type
  TDmPrincipal = class(TdmBase)
    procedure DataModuleCreate(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
  public
    function ConectaBanco: Boolean; override;

    function EnviaCaixa(Data: TDateTime; Historico: string;
      Doc: string; Tipo: string; Valor: Currency; IdConta: Integer = 0): Boolean;

    function SituacaoClienteOk(Valor: Currency; Codigo: Integer): Boolean;
  end;

var
  DmPrincipal: TDmPrincipal;

implementation
uses uDBXConnectionParams;

{$R *.lfm}

procedure TDmPrincipal.ConexaoBeforeConnect(Sender: TObject);
begin
  inherited;
  TDBXConnectionParams.setParams(Conexao,
    'localhost/3050',
    'D:\ProjetosDELPHI\WSCD\Database\CPR2.fdb',
    'SYSDBA','masterkey','RDB$ADMIN',0,3050);
end;

procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
begin
  Application.HintHidePause := 5000;
  Application.HintPause := 10;
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
  Conexao.Open;
end;

end.
