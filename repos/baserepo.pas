unit baseRepo;

{$mode delphi}

interface

uses
  Classes, SysUtils, fpjson, jsonparser, ZDataset, ZConnection;

type

  { TBaseRepo }

  TBaseRepo = class
    private
      conn: TZConnection;
      FIdField: string;
      fTableName: string;
    protected
      function getTableColumns(tableName: string): TStrings;

      function createInsertHeader(cols: TStrings): string;
      function createInsertValues(cols: TStrings): string;

      function createUpdateSql(cols: TStrings): string;
    public
      constructor Create(dbConnection: TZConnection; tableName, idField: string); overload;

      function Add(data: string): string;
      function Update(id: Integer; data: string): string;
      procedure Remove(id: Integer);
      function GetAll(fields, sortField: string): TZQuery;
      function GetById(id: Integer): TZQuery;

  end;

implementation

{ TBaseRepo }

function TBaseRepo.getTableColumns(tableName: string): TStrings;
begin
  with TZQuery.create(nil) do
  try
     Connection := conn;
     SQL.Clear;
     SQL.Add('select * from '+tableName+' where 0=1');
     Open;
     Result := TStringList.Create;
     GetFieldNames(Result);
  finally
    free;
  end;
end;

function TBaseRepo.createInsertHeader(cols: TStrings): string;
var i: Integer;
  sql: string;
begin
  sql := 'insert into '+fTableName+'(';
  for i := 0 to cols.Count-1 do
  begin
       if (cols[i] <> FIdField) then
       begin
            sql := sql + cols[i]+',';
       end;
  end;
  Result := Copy(sql, 1, Length(sql)-1) + ')';
end;

function TBaseRepo.createInsertValues(cols: TStrings): string;
var i: Integer;
  sql: string;
begin
  sql := ' values (';
  for i := 0 to cols.Count-1 do
  begin
       if (cols[i] <> FIdField) then
       begin
            sql := sql + ':'+cols[i]+',';
       end;
  end;
  Result := Copy(sql, 1, Length(sql)-1) + ')';
end;

function TBaseRepo.createUpdateSql(cols: TStrings): string;
var i: Integer;
  sql: string;
begin
  sql := 'update ' + fTableName + ' set ';
  for i := 0 to cols.Count-1 do
  begin
       if (cols[i] <> FIdField) then
       begin
            sql := sql + cols[i] + '=:'+cols[i]+',';
       end;
  end;
  Result := Copy(sql, 1, Length(sql)-1) + ' where '+FIdField+' =:'+FIdField;
end;

constructor TBaseRepo.Create(dbConnection: TZConnection; tableName, idField: string);
begin
  inherited Create;
  conn := dbConnection;
  fTableName:=tableName;
  FIdField:=idField;
end;

function TBaseRepo.Add(data: string): string;
var json: TJSONObject;
  insertSql: string;
  cols: TStrings;
  i: Integer;
begin
  json := GetJSON(data) as TJSONObject;
  cols := getTableColumns(fTableName);
  try
     insertSql := createInsertHeader(cols) + createInsertValues(cols);

     with TZQuery.create(nil) do
     try
        Connection:=conn;
        SQL.Clear;
        SQL.Add(insertSql);
        Prepare;

        for i := 0 to cols.Count-1 do
        begin
             if (cols[i] <> FIdField) then
             begin
                  if (json.IndexOfName(cols[i]) >= 0) then
                  begin
                       ParamByName(cols[i]).Value := json.Get(cols[i]);
                  end;
             end;
        end;

        ExecSQL;
     finally
       free;
     end;
     Result := insertSql;
  finally
    cols.free;
  end;
end;

function TBaseRepo.Update(id: Integer; data: string): string;
var json: TJSONObject;
  updateSql: string;
  cols: TStrings;
  i: Integer;
begin
  json := GetJSON(data) as TJSONObject;
  cols := getTableColumns(fTableName);
  try
     updateSql := createUpdateSql(cols);

     with TZQuery.create(nil) do
     try
        Connection:=conn;
        SQL.Clear;
        SQL.Add(updateSql);
        Prepare;

        for i := 0 to cols.Count-1 do
        begin
             if (cols[i] <> FIdField) then
             begin
                  if (json.IndexOfName(cols[i]) >= 0) then
                  begin
                       ParamByName(cols[i]).Value := json.Get(cols[i]);
                  end;
             end;
        end;

        ParamByName(FIdField).Value := id;

        ExecSQL;
     finally
       free;
     end;
     Result := updateSql;
  finally
    cols.free;
  end;
end;

procedure TBaseRepo.Remove(id: Integer);
begin
   with TZQuery.create(nil) do
   try
      Connection:=conn;
      SQL.Clear;
      SQL.Add('delete from '+fTableName+ ' where '+FIdField+' =:'+FIdField);
      Prepare;
      ParamByName(FIdField).Value := id;
      ExecSQL;
   finally
     free;
   end;
end;

function TBaseRepo.GetAll(fields, sortField: string): TZQuery;
var q: TZQuery;
begin
  q := TZQuery.create(nil);
  with q do
  begin
     Connection:=conn;
     SQL.Clear;
     SQL.Add('select '+fields+' from '+fTableName+ ' order by '+sortField);
     Prepare;
     Open;
  end;
  Result := q;
end;

function TBaseRepo.GetById(id: Integer): TZQuery;
var q: TZQuery;
begin
  q := TZQuery.create(nil);
  with q do
  begin
     Connection:=conn;
     SQL.Clear;
     SQL.Add('select * from '+fTableName+ ' where '+FIdField+' =:'+FIdField);
     Prepare;
     ParamByName(FIdField).Value := id;
     Open;
  end;
  Result := q;
end;

end.

