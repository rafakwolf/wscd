unit uMenuActions;

interface

uses
  ActnList;

type TMenuActions = class
  private
    fListaDeActions: TActionList;
  public
    procedure AbrirForm(nomeDoEventoAjax: string);

    constructor Create(listaDeActions: TActionList);
end;

implementation

procedure TMenuActions.AbrirForm(nomeDoEventoAjax: string);
var
  I: Integer;
begin
  for I := 0 to fListaDeActions.ActionCount-1 do
  begin
    if (fListaDeActions.Actions[i].Name = nomeDoEventoAjax) then
    begin
      TAction(fListaDeActions.Actions[i]).Execute;
      Break;
    end;
  end;
end;

constructor TMenuActions.Create(listaDeActions: TActionList);
begin
  fListaDeActions := listaDeActions;
end;

end.
