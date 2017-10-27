unit unListagemProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, Buttons, StdCtrls, Menus, ImgList, UniGuiForm,
  ExtCtrls, uniGUIBaseClasses, uniGUIClasses, uniLabel, uniButton, uniBitBtn,
  uniBasicGrid, uniDBGrid, uniMainMenu;

type
  TfrmListagemProdutos = class(TUniForm)
    dsProdutos: TDataSource;
    edtBuscaProduto: TButtonedEdit;
    lbBuscaProduto: TUniLabel;
    btnOK: TUniBitBtn;
    Grade: TUniDBGrid;
    PopupCons: TUniPopupMenu;
    miFiltrar: TUniMenuItem;
    procedure GradeDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure miFiltrarClick(Sender: TObject);
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

procedure TfrmListagemProdutos.GradeDblClick(Sender: TObject);
begin
  Close;
end;
 
procedure TfrmListagemProdutos.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListagemProdutos.miFiltrarClick(Sender: TObject);
begin
  //Ed_Localizar(dsProdutos.DataSet, Self, Grade);
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

  if (edtBuscaProduto.Text <> '') then
    edtBuscaProduto.RightButton.Visible := true
  else
    edtBuscaProduto.RightButton.Visible := False;
end;

procedure TfrmListagemProdutos.edtBuscaProdutoRightButtonClick(Sender: TObject);
begin
  edtBuscaProduto.Clear;
  edtBuscaProduto.RightButton.Visible := False;
end;

initialization
  RegisterClass(TfrmListagemProdutos);
finalization
  UnRegisterClass(TfrmListagemProdutos);

end.
