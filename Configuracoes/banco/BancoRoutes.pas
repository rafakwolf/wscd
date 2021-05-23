unit BancoRoutes;

interface

uses
  Horse,
  BaseController,
  Banco;

procedure List(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Find(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure List(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  controller : TBaseController<TBanco>;
begin
  controller := TBaseController<TBanco>.Create;
  try
    controller.List(Req, Res, Next);
  finally
    controller.Free;
  end;
end;

procedure Find(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  controller : TBaseController<TBanco>;
begin
  controller := TBaseController<TBanco>.Create;
  controller.IdField := 'IDBANCO';
  try
    controller.Find(Req, Res, Next);
  finally
    controller.Free;
  end;
end;

procedure Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  controller : TBaseController<TBanco>;
begin
  controller := TBaseController<TBanco>.Create;
  try
    controller.Insert(Req, Res, Next);
  finally
    controller.Free;
  end;
end;

procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  controller : TBaseController<TBanco>;
begin
  controller := TBaseController<TBanco>.Create;
  controller.IdField := 'IDBANCO';
  try
    controller.Update(Req, Res, Next);
  finally
    controller.Free;
  end;
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  controller : TBaseController<TBanco>;
begin
  controller := TBaseController<TBanco>.Create;
  controller.IdField := 'IDBANCO';
  try
    controller.Delete(Req, Res, Next);
  finally
    controller.Free;
  end;
end;

end.
