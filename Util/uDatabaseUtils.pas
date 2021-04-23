unit uDatabaseUtils;

interface

uses Classes, VarGlobal, SQLDB, memds;

procedure UpdateSingleField(sqlText: String);
function SelecTFMTBCDField(query: string; conn: TSQLConnection): Variant;
function GetProximoID(tabela, fieldId: string; conn: TSQLConnection): Integer;
function SQLFind(tabela, campo, valor: string; conn: TSQLConnection): boolean;
function GetFieldByID(conn: TSQLConnection; tabela, campoPesquisar,
  campoValor: string; valor: integer): Variant;
function GetSQLFromQuery(cds: TMemDataset): string;

implementation

procedure UpdateSingleField(sqlText: string);
begin
  with TSQLQuery.Create(nil)do try
      SQLConnection:= GetConnection;
      SQL.Clear;
      SQL.Add(sqlText);
      ExecSQL;
  finally
    free;
  end;
end;

function SelecTFMTBCDField(query: string; conn: TSQLConnection): Variant;
begin
  with TSQLQuery.Create(nil)do try
      SQLConnection:= GetConnection;
      sql.clear(); sql.Add(query);
      Open;
      Result := Fields[0].Value;
  finally
    free;
  end;
end;

function GetProximoID(tabela, fieldId: string; conn: TSQLConnection): Integer;
begin
  Result := 0; // TODO: implementar
end;

function SQLFind(tabela, campo, valor: string; conn: TSQLConnection): boolean;
begin
  //TODO: implementar
end;

function GetFieldByID(conn: TSQLConnection; tabela, campoPesquisar, campoValor: string; valor: integer): Variant;
begin
  // TODO: Implementar
end;

function GetSQLFromQuery(cds: TMemDataset): string;
begin

end;

end.
