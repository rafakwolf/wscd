unit unDadosEmpresa;

interface

uses
  Messages, ExtCtrls, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls, ExtDlgs, DBCtrls, ZSqlUpdate, ZDataset, Sqldb, FMTBcd;

type

  { TfrmDadosEmpresa }

  TfrmDadosEmpresa = class(TfrmPadrao)
    opdLogo: TOpenPictureDialog;
    dsSistema: TDataSource;
    lbFantazia: TLabel;
    lbRazaoSocial: TLabel;
    lbCnpj: TLabel;
    lbInscEstadual: TLabel;
    lbEndereco: TLabel;
    lbBairro: TLabel;
    lbTelefone: TLabel;
    lbResponsavel: TLabel;
    LabelFax: TLabel;
    lbUF: TLabel;
    lbCep: TLabel;
    lbInscMunicipal: TLabel;
    dbeInscMunicipal: TDBEdit;
    dbeFax: TDBEdit;
    dbeRazaoSocial: TDBEdit;
    dbeResponsavel: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCep: TDBEdit;
    dbeInscEstadual: TDBEdit;
    dbeFantazia: TDBEdit;
    dbeCnpj: TDBEdit;
    dbeUF: TDBEdit;
    dbeEmail: TDBEdit;
    gbLogoMarca: TGroupBox;
    btnBuscaImg: TBitBtn;
    btnApagaImg: TBitBtn;
    dbiLogoMarca: TDBImage;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApagaImgClick(Sender: TObject);
  private
  public
  end;

var
  frmDadosEmpresa: TfrmDadosEmpresa;

implementation

uses Funcoes,  unModeloConsulta, ConstPadrao, VarGlobal, uDatabaseutils;

{$R *.dfm}

procedure TfrmDadosEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  actInsert.Visible := False;
  actPrint.Visible := False;
  actDelete.Visible := False;
  actSearch.Visible := False;
  ReordenaBotoes([btnAlterar, btnSalvar, btnCancelar, btnSair]);
  Sistema.Atualizar;
end;

procedure TfrmDadosEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  if zquery1.IsEmpty then
    zquery1.Insert;
  zquery1.Open;
end;

procedure TfrmDadosEmpresa.btnApagaImgClick(Sender: TObject);
begin
  inherited;
  if (zquery1.State in [dsInsert, dsEdit]) then
    dbiLogoMarca.Field.Clear;
end;

initialization
  RegisterClass(TfrmDadosEmpresa);
finalization
  UnRegisterClass(TfrmDadosEmpresa);
end.

