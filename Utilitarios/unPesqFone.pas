unit unPesqFone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, ExtCtrls, Buttons,  Menus, FMTBcd, uniMainMenu, uniGUIBaseClasses,
  uniGUIClasses, uniButton, uniBitBtn, uniEdit, uniBasicGrid, uniDBGrid;

type
  TfrmPesqFone = class(TfrmSimplePadrao)
    sqldFone: TSQLDataSet;
    dspFone: TDataSetProvider;
    cdsFone: TClientDataSet;
    dsFone: TDataSource;
    rgpPesquisa: TRadioGroup;
    sqldFoneNOME: TStringField;
    sqldFoneTELEFONE: TStringField;
    sqldFoneFAX: TStringField;
    cdsFoneNOME: TStringField;
    cdsFoneTELEFONE: TStringField;
    cdsFoneFAX: TStringField;
    mmPesqFone: TUniMainMenu;
    miRegistros: TUniMenuItem;
    miCadastrar: TUniMenuItem;
    N2: TUniMenuItem;
    miSair: TUniMenuItem;
    miOpcoes: TUniMenuItem;
    miOrdenar: TUniMenuItem;
    N1: TUniMenuItem;
    miPrint: TUniMenuItem;
    btnPesquisar: TUniBitBtn;
    btnImprimir: TUniBitBtn;
    edtNome: TUniEdit;
    edtFone: TUniEdit;
    dbgrdFones: TUniDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbgrdFonesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgpPesquisaClick(Sender: TObject);
    procedure miCadastrarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure miOrdenarClick(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FSQL: string;
  public
  end;

var
  frmPesqFone: TfrmPesqFone;

implementation

uses Funcoes, unAgenda, unPrevRelAgenda, uConfiguraRelatorio,
  unOrdenarDados;

{$R *.dfm}

procedure TfrmPesqFone.FormCreate(Sender: TObject);
begin
  inherited;
  cdsFone.Open;
  FSQL := sqldFone.CommandText;
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
  cdsFone.Close;
  cdsFone.CommandText := FSQL;
  cdsFone.Open;
end;

procedure TfrmPesqFone.dbgrdFonesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  //GridZebrado(cdsFone.RecNo, dbgrdFones, Rect, DataCol, Column, State);
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
    cdsPadrao.Close;
    cdsPadrao.CommandText := FSQL;
    cdsPadrao.Open;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

procedure TfrmPesqFone.miOrdenarClick(Sender: TObject);
var
  SQLRetorno: string;
begin
  inherited;
  if TfrmOrdenarDados.Execute(FSQL, SQLRetorno) then
  begin
    cdsFone.Close;
    FSQL := '';
    FSQL := SQLRetorno;
    cdsFone.CommandText := FSQL;
    cdsFone.Open;
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

