unit unRelatorioProdutoEstMinForn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrls;

type
  TfrmRelatorioProdutoEstMinForn = class(TfrmDialogoRelatorioPadrao)
    dbeForn: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeFornClickButton(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
    SQLPadrao: string;
  end;

var
  frmRelatorioProdutoEstMinForn: TfrmRelatorioProdutoEstMinForn;

implementation

uses
  Funcoes, uConfiguraRelatorio, unPrevProdutoEstoque, VarGlobal,
  unModeloConsulta, ConstPadrao;

{$R *.dfm}

procedure TfrmRelatorioProdutoEstMinForn.Imprimir(p: Boolean);
begin
  if (dbeForn.Text = '') then
  begin
    MsgErro(UM_FILTROINVALIDO);
    SetFocusIfCan(dbeForn);
    Abort;
  end
  else
  begin
    with TfrmPrevProdutoEstoque.Create(Self) do
    try
      with cdsPadrao do
      begin
        Close;
        Params.ParamByName('COD').AsInteger :=
          GetDmPesquisar.cdsPesqFornCODFORNECEDOR.AsInteger;
        Open;
      end;
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      cdsPadrao.Close;
      Free;
    end;
  end;
end;

procedure TfrmRelatorioProdutoEstMinForn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GetDmPesquisar.cdsPesqForn.Close;
  inherited;
end;

procedure TfrmRelatorioProdutoEstMinForn.dbeFornClickButton(
  Sender: TObject);
begin
  inherited;
  GetDmPesquisar.cdsPesqForn.Close;
  GetDmPesquisar.cdsPesqForn.CommandText := SQLPadrao;
  if not TfrmModeloConsulta.Execute('Fornecedor', GetDmPesquisar.cdsPesqForn, FN_FORN,
    DL_FORN) then
    GetDmPesquisar.cdsPesqForn.Close;
end;

procedure TfrmRelatorioProdutoEstMinForn.btnVisualizarClick(
  Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioProdutoEstMinForn.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmRelatorioProdutoEstMinForn.FormCreate(Sender: TObject);
begin
  inherited;
  dsPadrao.DataSet := GetDmPesquisar.cdsPesqForn;
  SQLPadrao := GetDmPesquisar.sqldPesqForn.CommandText;
end;

initialization
  RegisterClass(TfrmRelatorioProdutoEstMinForn);
finalization
  UnRegisterClass(TfrmRelatorioProdutoEstMinForn);
end.
