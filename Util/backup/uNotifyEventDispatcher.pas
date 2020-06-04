unit uNotifyEventDispatcher;

{$MODE Delphi}

interface

uses Classes, SysUtils;

type
  TNotifyEventDispatcher = class(TComponent)
  protected
    FClosure: TProcedure;

    procedure OnNotifyEvent(Sender: TObject);
  public
    class function Create(Owner: TComponent; Closure: TProcedure): TNotifyEvent; overload;

    function Attach(Closure: TProcedure): TNotifyEvent;
  end;

implementation

class function TNotifyEventDispatcher.Create(Owner: TComponent; Closure: TProcedure): TNotifyEvent;
begin
  Result := TNotifyEventDispatcher.Create(Owner).Attach(Closure)
end;

function TNotifyEventDispatcher.Attach(Closure: TProcedure): TNotifyEvent;
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
