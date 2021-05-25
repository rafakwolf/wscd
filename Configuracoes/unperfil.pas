unit unPerfil;

{$mode delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, unPadrao;

type

  { TfrmPerfil }

  TfrmPerfil = class(TfrmPadrao)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmPerfil: TfrmPerfil;

implementation

{$R *.lfm}

{ TfrmPerfil }

procedure TfrmPerfil.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

initialization
  RegisterClass(TfrmPerfil);
finalization
  UnregisterClass(TfrmPerfil);

end.

