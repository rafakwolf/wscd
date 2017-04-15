unit uDBXConnectionParams;

interface

uses Classes, sqlexpr;

type
  TDBXConnectionParams = class
  public
//    'localhost/3050',
//    'D:\ProjetosDELPHI\WSCD\Database\CPR2.fdb',
//    'SYSDBA','masterkey','RDB$ADMIN',dtFirebird,3050


    class procedure SetParams(conn: TSQLConnection;
      host, dbPath, user, pass, role: string; dbType, port: integer);
  end;

implementation

{ TDBXConnectionParams }

class procedure TDBXConnectionParams.SetParams(conn: TSQLConnection;
      host, dbPath, user, pass, role: string; dbType, port: integer);
begin

end;

end.
