unit uDBXConnectionParams;

interface

uses Classes, sqldb;

type
  TDBXConnectionParams = class
  public
    class procedure SetParams(conn: TSQLConnection;
      host, dbPath, user, pass, role: string; dbType, port: integer);
  end;

implementation

class procedure TDBXConnectionParams.SetParams(conn: TSQLConnection;
      host, dbPath, user, pass, role: string; dbType, port: integer);
begin

end;

end.
