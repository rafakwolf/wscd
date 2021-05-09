unit ufmUsuarioItemMenu;

interface

uses
  Messages, ExtCtrls, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, StdCtrls, Buttons, ComCtrls, Sqldb, ImgList, Menus,
  uClassesMenu, memds, DBCtrls, ZDataset, ZSqlUpdate, ConstPadrao, Funcoes,
  unPadrao, unDmPrincipal, FMTBcd;

type

  { TfrmUsuarioItemMenu }

  TfrmUsuarioItemMenu = class(TfrmPadrao)
    dbeSenha: TDBEdit;
    dbeLogin: TDBEdit;
    dbeNomeUsuario: TDBEdit;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmUsuarioItemMenu: TfrmUsuarioItemMenu;

implementation

uses Math;

{$R *.dfm}

procedure TfrmUsuarioItemMenu.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames       := FN_USUARIOS;
  DisplayLabels    := DL_USUARIOS;
  aCaption         := 'Usuarios';
end;


initialization
  RegisterClass(TfrmUsuarioItemMenu);
finalization
  UnregisterClass(TfrmUsuarioItemMenu);

end.

