unit BaseController;

interface

uses
  Horse,
  BaseRepo,
  System.JSON,
  REST.Json,
  ormbr.json,
  System.Generics.Collections,
  unDmPrincipal;

type
  TBaseController<T: class, constructor> = class
  private
    FIdField: string;
  public
    property IdField: string read FIdField write FIdField;

    procedure List(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Find(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

const CType: string = 'application/json; charset=utf-8';

implementation

procedure TBaseController<T>.Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  conn: TDmPrincipal;
  repo : TBaseRepo<T>;
  data : T;
begin
  data := TORMBrJson.JsonToObject<T>(Req.Body);
  try
    conn := TDmPrincipal.Create(nil);
    try
      repo := TBaseRepo<T>.create(conn.dbConn);
      try
        repo.insert(data);
        Res.Send(TORMBrJson.ObjectToJsonString(data))
           .Status(201)
           .ContentType(CType);
      finally
        repo.Free;
      end;
    finally
      conn.Free;
    end;
  finally
    data.Free;
  end;
end;

procedure TBaseController<T>.Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  conn: TDmPrincipal;
  repo : TBaseRepo<T>;
  data : T;
  id : String;
begin
  id := Req.Params['id'];
  conn := TDmPrincipal.Create(nil);
  try
    repo := TBaseRepo<T>.create(conn.dbConn);
    try
      data := repo.findWhere(FIdField + ' = ' + id);
      try
        repo.modify(data);
        TORMBrJson.JsonToObject(Req.Body, data);
        repo.update(data);
        Res.Send(TORMBrJson.ObjectToJsonString(data))
           .ContentType(CType);
      finally
        data.Free;
      end;
    finally
      repo.Free;
    end;
  finally
    conn.Free;
  end;
end;

procedure TBaseController<T>.Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  conn: TDmPrincipal;
  repo : TBaseRepo<T>;
  data : T;
  id : String;
begin
  id := Req.Params['id'];
  conn := TDmPrincipal.Create(nil);
  try
    repo := TBaseRepo<T>.create(conn.dbConn);
    try
      data := repo.findWhere(fIdField + ' = ' + id);
      try
        repo.delete(data);
        Res.Status(204);
      finally
        data.Free;
      end;
    finally
      repo.Free;
    end;
  finally
    conn.Free;
  end;
end;

procedure TBaseController<T>.Find(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  conn: TDmPrincipal;
  repo : TBaseRepo<T>;
  data : T;
  id : String;
begin
  id := Req.Params['id'];
  conn := TDmPrincipal.Create(nil);
  try
    repo := TBaseRepo<T>.create(conn.dbConn);
    try
      data := repo.findWhere(fIdField + ' = ' + id);
      try
        Res.Send(TORMBrJson.ObjectToJsonString(data))
           .ContentType(CType);
      finally
        data.Free;
      end;
    finally
      repo.Free;
    end;
  finally
    conn.Free;
  end;
end;

procedure TBaseController<T>.List(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  dataList: TObjectList<T>;
  conn: TDmPrincipal;
  repo : TBaseRepo<T>;
begin
  conn := TDmPrincipal.Create(nil);
  try
    repo := TBaseRepo<T>.Create(conn.dbConn);
    try
      dataList := repo.listAll;
      try
        Res.Send(TORMBrJson.ObjectListToJsonString<T>(dataList))
           .ContentType(CType);
      finally
        dataList.Free;
      end;
    finally
      repo.Free;
    end;
  finally
    conn.Free;
  end;
end;

end.
