unit unListaPadrao;

{$mode delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, EditBtn,
  StdCtrls;

type

  { TformListaPadrao }

  TformListaPadrao = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    edtBuscar: TEditButton;
  private

  public

  end;

var
  formListaPadrao: TformListaPadrao;

implementation

{$R *.lfm}

end.

