unit BaseRepo;

interface

uses
  dbebr.factory.interfaces,
  dbebr.factory.firedac,
  ormbr.container.objectset.interfaces,
  ormbr.container.objectset,
  System.Generics.Collections,
  ZConnection,
  dbebr.factory.zeos;

type TBaseRepo<T: class, constructor> = class

  protected
    FConnection : IDBConnection;
    FORMBrContainer : IContainerObjectSet<T>;

  public
    procedure insert(Value: T);
    procedure update(Value: T);
    procedure delete(Value: T);
    procedure modify(Value: T);

    function listAll: TObjectList<T>;
    function findWhere(AWhere: String): T;

    constructor create(Connection: TZConnection);

end;

implementation

constructor TBaseRepo<T>.create(Connection: TZConnection);
begin
  FConnection := TFactoryZeos.Create(Connection, dnFirebird);
  FORMBrContainer := TContainerObjectSet<T>.Create(FConnection);
end;

procedure TBaseRepo<T>.delete(Value: T);
begin
  FORMBrContainer.Delete(Value);
end;

function TBaseRepo<T>.findWhere(AWhere: String): T;
var
  list : TObjectList<T>;
  i: Integer;
begin
  result := nil;
  list := FORMBrContainer.FindWhere(AWhere);
  try
    list.OwnsObjects := False;
    if list.Count > 0 then
      result := list.First;

    for i := 1 to list.Count - 1 do
      list[i].free;
  finally
    list.Free;
  end;
end;

procedure TBaseRepo<T>.insert(Value: T);
begin
  FORMBrContainer.Insert(Value);
end;

function TBaseRepo<T>.listAll: TObjectList<T>;
begin
  result := FORMBrContainer.Find;
end;

procedure TBaseRepo<T>.modify(Value: T);
begin
  FORMBrContainer.Modify(Value);
end;

procedure TBaseRepo<T>.update(Value: T);
begin
  FORMBrContainer.Update(Value);
end;

end.

