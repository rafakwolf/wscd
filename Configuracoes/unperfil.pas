unit unPerfil;

{$mode delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, unPadrao,
  ZDataset, ZSqlUpdate, ZAbstractRODataset;

type

  { TfrmPerfil }

  TfrmPerfil = class(TfrmPadrao)
    DBEdit1: TDBEdit;
    ZQuery1: TZQuery;
    ZQuery1IDPERFIL: TZIntegerField;
    ZQuery1PERFIL: TZRawStringField;
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

