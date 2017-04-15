unit uClassesMenu;

interface

uses Classes;


type TPLItemMenu = class
public
  IdItemMenu: integer;
  IdParentItemMenu: Integer;
  Nome: string;
  Caption: string;

  constructor Create(id: Integer; nome, caption: string; idPai: integer); overload;
end;

type TPLItemsMenu = array of TPLItemMenu;

implementation

constructor TPLItemMenu.Create(id: Integer; nome, caption: string; idPai: integer);
begin
  self.IdItemMenu := id;
  self.IdParentItemMenu := idPai;
  self.Nome := nome;
  self.Caption := caption;
end;

end.
