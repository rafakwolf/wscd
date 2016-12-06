unit unAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmAguarde = class(TForm)
    pnlAguarde: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    class procedure Execute(pMsg: string);
    procedure Fecha;
  end;

var
  frmAguarde: TfrmAguarde;

implementation

{$R *.dfm}

procedure TfrmAguarde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action     := caFree;
  frmAguarde := nil;
end;

class procedure TfrmAguarde.Execute(pMsg: string);
begin
   frmAguarde := TfrmAguarde.Create(Application);
   with frmAguarde do
   try
     pnlAguarde.Caption := pMsg;
     Show;
     Application.ProcessMessages;
   finally
   end;
end;

procedure TfrmAguarde.Fecha;
begin
  Close;
end;

end.
