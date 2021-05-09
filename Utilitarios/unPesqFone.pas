unit unPesqFone;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, DB, memds,  SqlDb, Grids,
  DBGrids, Buttons,  Menus, ZDataset, FMTBcd;

type

  { TfrmPesqFone }

  TfrmPesqFone = class(TfrmSimplePadrao)
    dsFone: TDataSource;
    mmPesqFone: TMainMenu;
    miRegistros: TMenuItem;
    miCadastrar: TMenuItem;
    N2: TMenuItem;
    miSair: TMenuItem;
    miOpcoes: TMenuItem;
    miOrdenar: TMenuItem;
    N1: TMenuItem;
    miPrint: TMenuItem;
    btnPesquisar: TBitBtn;
    btnImprimir: TBitBtn;
    edtNome: TEdit;
    edtFone: TEdit;
    dbgrdFones: TDBGrid;
    rgpPesquisa: TRadioGroup;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure rgpPesquisaClick(Sender: TObject);
    procedure miCadastrarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FSQL: string;
  public
  end;

var
  frmPesqFone: TfrmPesqFone;

implementation

uses Funcoes, unAgenda, unPrevRelAgenda, uConfiguraRelatorio;

{$R *.dfm}

procedure TfrmPesqFone.FormCreate(Sender: TObject);
begin
  inherited;
  ZReadOnlyQuery1.Open;
  FSQL := ZReadOnlyQuery1.SQL.Text;
end;

procedure TfrmPesqFone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ZReadOnlyQuery1.Close;
end;

procedure TfrmPesqFone.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FSQL := '';
  case rgpPesquisa.ItemIndex of
    0: begin
         ZReadOnlyQuery1.Filtered:=false;
         ZReadOnlyQuery1.filter := 'NOME like '+QuotedStr('%'+edtNome.Text+'%');
         ZReadOnlyQuery1.Filtered:=true;
       end;
    1: begin
         ZReadOnlyQuery1.Filtered:=false;
         ZReadOnlyQuery1.filter := 'TELEFONE like '+QuotedStr('%'+edtFone.Text+'%');
         ZReadOnlyQuery1.Filtered:=true;
       end;
  end;
end;

procedure TfrmPesqFone.rgpPesquisaClick(Sender: TObject);
begin
  inherited;
  if rgpPesquisa.ItemIndex = 0 then
  begin
    edtFone.Enabled := False;
    edtNome.Enabled := True;
    edtFone.Color := clBtnFace;
    edtNome.Color := clWindow;
    SetFocusIfCan(edtNome)
  end
  else if rgpPesquisa.ItemIndex = 1 then
  begin
    edtFone.Enabled := True;
    edtNome.Enabled := False;
    edtFone.Color := clWindow;
    edtNome.Color := clBtnFace;
    SetFocusIfCan(edtFone);
  end;
end;

procedure TfrmPesqFone.miCadastrarClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmAgenda', 'Agenda', Self);
end;

procedure TfrmPesqFone.btnImprimirClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevRelAgenda.Create(Self) do
  try
    sqldPadrao.Close;
    sqldPadrao.SQL.Clear;
    sqldPadrao.SQL.Text :=FSQL;
    sqldPadrao.Open;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmPesqFone.miSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPesqFone.FormShow(Sender: TObject);
begin
  inherited;
  rgpPesquisa.OnClick(Self);
end;

initialization
  RegisterClass(TfrmPesqFone);
finalization
  UnRegisterClass(TfrmPesqFone);
end.

