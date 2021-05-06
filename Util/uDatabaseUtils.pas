unit uDatabaseUtils;

interface

uses Classes, VarGlobal, SQLDB, ZDataset, ZConnection, SysUtils;

procedure UpdateSingleField(sqlText: String);
function SelecSingleField(query: string; conn: TZConnection): Variant;
function SQLFind(tabela, campo, valor: string; conn: TZConnection): boolean;
function GetFieldByID(conn: TZConnection; tabela, campoPesquisar,
  campoValor: string; valor: integer): Variant;

implementation

procedure UpdateSingleField(sqlText: string);
begin
  with TZQuery.Create(nil)do try
      Connection:= GetZConnection;
      SQL.Clear;
      SQL.Add(sqlText);
      ExecSQL;
  finally
    free;
  end;
end;

function SelecSingleField(query: string; conn: TZConnection): Variant;
begin
  with TZQuery.Create(nil)do try
      Connection:= conn;
      sql.clear();
      sql.Add(query);
      Open;
      Result := Fields[0].Value;
  finally
    free;
  end;
end;

function SQLFind(tabela, campo, valor: string; conn: TZConnection): boolean;
begin
  with TZQuery.Create(nil)do try
      Connection:= conn;
      sql.clear();
      sql.Add('select '+campo+' from '+tabela+' where '+campo+' = :'+valor);
      Open;
      Result := Fields[0].Value;
  finally
    free;
  end;
end;

function GetFieldByID(conn: TZConnection; tabela, campoPesquisar, campoValor: string; valor: integer): Variant;
begin
  with TZQuery.Create(nil)do try
      Connection:= conn;
      sql.clear();
      sql.Add('select '+campoValor+' from '+tabela+' where '+campoPesquisar+' = :'+IntToStr(valor));
      Open;
      Result := Fields[0].Value;
  finally
    free;
  end;
end;

end.
