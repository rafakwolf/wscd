unit udmBase;

interface

uses
  sysutils, Classes, ZConnection, db, mysql57conn, SQLDB;

type

  { TdmBase }

  TdmBase = class(TDataModule)
    ZConnection1: TZConnection;
  private
  protected
      function ConectaBanco: Boolean; virtual;
  public
    Conexao: TSQLConnection; // fake component, remove afterwards
  end;

var
  dmBase: TdmBase;

implementation

{$R *.dfm}

function TdmBase.ConectaBanco: Boolean;
begin
 raise Exception.Create('metodo nao implemantado');
end;

end.
