unit udmGeralBase;

interface

uses
  SysUtils, Classes, Sqldb, DB, memds;

type
  TdmGeralBase = class(TDataModule)
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
