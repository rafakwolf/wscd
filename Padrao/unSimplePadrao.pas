unit unSimplePadrao;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBGrids, LCLType;

type
  TfrmSimplePadrao = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmSimplePadrao: TfrmSimplePadrao;

implementation
uses SqlDb, VarGlobal;

{$R *.dfm}

procedure TfrmSimplePadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSimplePadrao.FormCreate(Sender: TObject);
var x: Integer;
begin
  for x := 0 to ComponentCount - 1 do
  begin
    if Components[x] is TSQLQuery then
    begin
      if (not Assigned(TSQLQuery(Components[x]).SQLConnection)) then
        TSQLQuery(Components[x]).SQLConnection := GetConnection;
    end;

  end;
end;

procedure TfrmSimplePadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
