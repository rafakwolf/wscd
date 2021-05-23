unit uDatabaseUtils;

interface

uses
  Classes, VarGlobal, ZConnection, Datasnap.DBClient, ZDataset, sqlexpr;

procedure UpdateSingleField(psql: String);
function SelectSingleField(query: string; conn: TZConnection): Variant;
function GetProximoID(tabela, fieldId: string; conn: TZConnection): Integer;
function SQLFind(tabela, campo, valor: string; conn: TSQLConnection): boolean;
function GetFieldByID(conn: TZConnection; tabela, campoPesquisar,
  campoValor: string; valor: integer): Variant;
function GetSQLFromQuery(cds: TClientDataset): string;

implementation

procedure UpdateSingleField(psql: String);
begin
  with TZQuery.Create(nil)do try
      Connection:= GetConnection;
      SQL.Text := psql;
      ExecSQL;
  finally
    free;
  end;
end;

function SelectSingleField(query: string; conn: TZConnection): Variant;
begin
  with TZQuery.Create(nil)do try
      Connection:= GetConnection;
      SQL.Text:=query;
      Open;
      Result := Fields[0].Value;
  finally
    free;
  end;
end;

function GetProximoID(tabela, fieldId: string; conn: TZConnection): Integer;
begin
  Result := 0; // TODO: implementar
end;

function SQLFind(tabela, campo, valor: string; conn: TSQLConnection): boolean;
begin
  //TODO: implementar
end;

function GetFieldByID(conn: TZConnection; tabela, campoPesquisar, campoValor: string; valor: integer): Variant;
begin
  // TODO: Implementar
end;

function GetSQLFromQuery(cds: TClientDataset): string;
begin

end;

end.
