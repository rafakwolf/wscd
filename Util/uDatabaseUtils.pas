unit uDatabaseUtils;

interface

uses Classes, VarGlobal, sqlexpr, Datasnap.DBClient;

procedure UpdateSingleField(sql: String);
function SelectSingleField(query: string; conn: TSQLConnection): Variant;
function GetProximoID(tabela, fieldId: string; conn: TSQLConnection): Integer;
function SQLFind(tabela, campo, valor: string; conn: TSQLConnection): boolean;
function GetFieldByID(conn: TSQLConnection; tabela, campoPesquisar,
  campoValor: string; valor: integer): Variant;
function GetSQLFromQuery(cds: TClientDataset): string;

implementation

procedure UpdateSingleField(sql: String);
begin
  with TSQLDataSet.Create(nil)do try
      SQLConnection:= GetConnection;
      CommandText:=sql;
      ExecSQL;
  finally
    free;
  end;
end;

function SelectSingleField(query: string; conn: TSQLConnection): Variant;
begin
  with TSQLDataSet.Create(nil)do try
      SQLConnection:= GetConnection;
      CommandText:=query;
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

function GetSQLFromQuery(cds: TClientDataset): string;
begin

end;

end.
