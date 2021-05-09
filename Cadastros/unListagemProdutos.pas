unit unListagemProdutos;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, Buttons, StdCtrls, Menus, ImgList, 
  LCLType, ZDataset;

type

  { TfrmListagemProdutos }

  TfrmListagemProdutos = class(TForm)
    dsProdutos: TDataSource;
    lbBuscaProduto: TLabel;
    btnOK: TBitBtn;
    Grade: TDBGrid;
    PopupCons: TPopupMenu;
    miFiltrar: TMenuItem;
    edtBuscaProduto: TEdit;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtBuscaProdutoChange(Sender: TObject);
    procedure edtBuscaProdutoRightButtonClick(Sender: TObject);
  private
  public
  end;

var
  frmListagemProdutos: TfrmListagemProdutos;

implementation

uses Funcoes, unProduto;

{$R *.dfm}

procedure TfrmListagemProdutos.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListagemProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmListagemProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmListagemProdutos.edtBuscaProdutoChange(Sender: TObject);
begin
  dsProdutos.DataSet.Locate('DESCRICAO',
    edtBuscaProduto.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmListagemProdutos.edtBuscaProdutoRightButtonClick(Sender: TObject);
begin
  edtBuscaProduto.Clear;
end;

initialization
  RegisterClass(TfrmListagemProdutos);
finalization
  UnRegisterClass(TfrmListagemProdutos);

end.
