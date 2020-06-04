unit uNotifyEventDispatcher;

{$MODE Delphi}

interface

{uses System.Classes, System.SysUtils;}

type
  TNotifyEventDispatcher = class(TComponent)
  protected
    FClosure: TProc<TObject>;

    procedure OnNotifyEvent(Sender: TObject);
  public
    class function Create(Owner: TComponent; Closure: TProc<TObject>): TNotifyEvent; overload;

    function Attach(Closure: TProc<TObject>): TNotifyEvent;
  end;

implementation

class function TNotifyEventDispatcher.Create(Owner: TComponent; Closure: TProc<TObject>): TNotifyEvent;
begin
  Result := TNotifyEventDispatcher.Create(Owner).Attach(Closure)
end;

function TNotifyEventDispatcher.Attach(Closure: TProc<TObject>): TNotifyEvent;
begin
  FClosure := Closure;
  Result := Self.OnNotifyEvent
end;

procedure TNotifyEventDispatcher.OnNotifyEvent(Sender: TObject);
begin
  if Assigned(FClosure) then
    FClosure(Sender)
end;

end.
