unit ufmUsuarioItemMenu;

interface

uses
  Messages, ExtCtrls, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, StdCtrls, Buttons, ComCtrls, Sqldb, ImgList, Menus,
  memds, DBCtrls, ZDataset, ZSqlUpdate, ConstPadrao, Funcoes,
  unPadrao, unDmPrincipal, FMTBcd;

type

  { TfrmUsuarioItemMenu }

  TfrmUsuarioItemMenu = class(TfrmPadrao)
    DataSource1: TDataSource;
    dbeSenha: TDBEdit;
    dbeLogin: TDBEdit;
    dbeNomeUsuario: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ZQuery1: TZQuery;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
  FieldNames    := FN_USUARIOS;
  DisplayLabels := DL_USUARIOS;
  aCaption      := 'Usuarios';
  ZReadOnlyQuery1.Open;
end;

procedure TfrmUsuarioItemMenu.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  inherited;
  ZReadOnlyQuery1.Close;
end;


initialization
  RegisterClass(TfrmUsuarioItemMenu);
finalization
  UnregisterClass(TfrmUsuarioItemMenu);

end.

