unit udmGeralBase;

interface

uses
  System.SysUtils, System.Classes, Data.SqlExpr, Data.DB, Datasnap.DBClient,
  Datasnap.Win.TConnect;

type
  TdmGeralBase = class(TDataModule)
    LocalConnection1: TLocalConnection;
  private
  protected
    function GetConnection: TSQLConnection; virtual;
  public
  end;

var
  dmGeralBase: TdmGeralBase;

implementation
uses VarGlobal;

{$R *.dfm}

function TdmGeralBase.GetConnection: TSQLConnection;
begin
  Result := VarGlobal.GetConnection;
end;

end.
