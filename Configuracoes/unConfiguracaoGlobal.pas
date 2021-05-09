unit unConfiguracaoGlobal;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb, DBCtrls, ZDataset, ZSqlUpdate, FMTBcd;

type

  { TfrmConfigGlobal }

  TfrmConfigGlobal = class(TfrmPadrao)
    pgcConfigGlobal: TPageControl;
    tsCrediario: TTabSheet;
    tsCliente: TTabSheet;
    tsOrcamento: TTabSheet;
    tsVenda: TTabSheet;
    lbMsgOrcamRodape: TLabel;
    lbMsgRodapeVenda: TLabel;
    dbeJuro: TDBEdit;
    dbeIntervalo: TDBEdit;
    dbePrazoInicial: TDBEdit;
    dbeParcelas: TDBEdit;
    dbeLimiteCliente: TDBEdit;
    dbeIdadeCliente: TDBEdit;
    dbeTituloOrcam: TDBEdit;
    dbeColunaBobina: TDBEdit;
    dbeLinhaPularOrcam: TDBEdit;
    dbeTituloVenda: TDBEdit;
    dbeColunaBobinaVenda: TDBEdit;
    dbeLinhaPularVenda: TDBEdit;
    dbePortaImpVenda: TDBEdit;
    dbmmMsgRodape: TDBMemo;
    dbmmMsgRodapeVenda: TDBMemo;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure dbeJuroKeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  frmConfigGlobal: TfrmConfigGlobal;

implementation

uses Funcoes, ConstPadrao, unDmPrincipal;

{$R *.dfm}

procedure TfrmConfigGlobal.FormCreate(Sender: TObject);
begin
  inherited;
  actInsert.Visible := False;
  actPrint.Visible := False;
  actDelete.Visible := False;
  actSearch.Visible := False;
  ReordenaBotoes([btnAlterar, btnSalvar, btnCancelar, btnSair]);
  pgcConfigGlobal.ActivePageIndex := 0;
end;

procedure TfrmConfigGlobal.cdsPadraoAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  PostMessageAllForms(WM_CONFIG_GLOBAL_ALTERADO);
end;

procedure TfrmConfigGlobal.dbeJuroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

initialization
  RegisterClass(TfrmConfigGlobal);
finalization
  UnRegisterClass(TfrmConfigGlobal);
end.
