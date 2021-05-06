unit unPesqFone;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, DB, memds,  SqlDb, Grids,
  DBGrids, Buttons,  Menus, FMTBcd;

type
  TfrmPesqFone = class(TfrmSimplePadrao)
    sqldFone: TSQLQuery;
    dspFone: TComponent;
    cdsFone: TMemDataSet;
    dsFone: TDataSource;
    sqldFoneNOME: TStringField;
    sqldFoneTELEFONE: TStringField;
    sqldFoneFAX: TStringField;
    cdsFoneNOME: TStringField;
    cdsFoneTELEFONE: TStringField;
    cdsFoneFAX: TStringField;
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
  cdsFone.Open;
  FSQL := sqldFone.SQL.Text;
end;

procedure TfrmPesqFone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsFone.Close;
end;

procedure TfrmPesqFone.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  FSQL := '';
  case rgpPesquisa.ItemIndex of
    0: begin
         if (ClearMask(edtNome.Text) = '') then
           FSQL := 'select * from VIEWPESQUISAFONE'
         else
           FSQL := 'select * from VIEWPESQUISAFONE where upper(udf_CollateBr(NOME)) like '+
             AnsiUpperCase(QuotedStr('%'+edtNome.Text+'%'));
       end;
    1: begin
         if (ClearMask(edtFone.Text) = '') then
           FSQL := 'select * from VIEWPESQUISAFONE'
         else
           FSQL := 'select * from VIEWPESQUISAFONE where upper(udf_CollateBr(TELEFONE)) like '+
             AnsiUpperCase(QuotedStr('%'+edtFone.Text+'%'));
       end;
  end;
  sqldFone.Close;
  sqldFone.SQL.Clear; sqldFone.SQL.Text :=FSQL;
  sqldFone.Open;
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
    sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :=FSQL;
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

