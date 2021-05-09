unit unPerfilPermissao;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb,  DBCtrls,
   Grids, DBGrids, ImgList, ZSqlUpdate, ZDataset, unPrincipal, FMTBcd;

type

  { TfrmPerfilPermissao }

  TfrmPerfilPermissao = class(TfrmPadrao)
    dbePerfil: TDBEdit;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmPerfilPermissao: TfrmPerfilPermissao;

implementation

uses Funcoes, ConstPadrao;

{$R *.dfm}

procedure TfrmPerfilPermissao.FormCreate(Sender: TObject);
begin
  inherited;
  actPrint.Visible := False;

  FieldNames := FN_PERFIL;
  DisplayLabels := DL_PERFIL;
  aCaption := 'Perfis/Permissoes';
end;

initialization
  RegisterClass(TfrmPerfilPermissao);
finalization
  UnRegisterClass(TfrmPerfilPermissao);

end.

