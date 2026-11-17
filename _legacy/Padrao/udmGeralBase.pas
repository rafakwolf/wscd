unit udmGeralBase;

interface

uses
  SysUtils, Classes, Sqldb, DB, memds, ZConnection;

type
  TdmGeralBase = class(TDataModule)
  private
  protected
    function GetConnection: TZConnection; virtual;
  public
  end;

var
  dmGeralBase: TdmGeralBase;

implementation
uses VarGlobal;

{$R *.dfm}

function TdmGeralBase.GetConnection: TZConnection;
begin
  Result := VarGlobal.GetZConnection;
end;

end.
