unit unListagemPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB,
  DBClient, Provider, SqlExpr, FMTBcd, unSimplePadrao, uniGUIBaseClasses,
  uniGUIClasses, uniLabel, uniButton, uniBitBtn, uniEdit, uniMultiItem,
  uniComboBox, uniBasicGrid, uniDBGrid;

type
  TfrmListagemPrecos = class(TfrmSimplePadrao)
    dsProdutos: TDataSource;
    sqldProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    cdsProdutoCODIGO: TIntegerField;
    cdsProdutoCODIGOBARRA: TStringField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoDESCRICAO: TStringField;
    cdsProdutoESTOQUE: TIntegerField;
    cdsProdutoPRECO: TFMTBCDField;
    cdsProdutoFORNECEDOR: TStringField;
    cdsProdutoGRUPO: TStringField;
    sqldProdutoCODIGO: TIntegerField;
    sqldProdutoCODIGOBARRA: TStringField;
    sqldProdutoREFERENCIA: TStringField;
    sqldProdutoDESCRICAO: TStringField;
    sqldProdutoESTOQUE: TIntegerField;
    sqldProdutoPRECO: TFMTBCDField;
    sqldProdutoFORNECEDOR: TStringField;
    sqldProdutoGRUPO: TStringField;
    lbCampo: TLabel;
    btnFechar: TBitBtn;
    btnPesquisar: TBitBtn;
    edtPesquisa: TEdit;
    cbbCampo: TComboBox;
    Grade: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbbCampoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CarregaCampos;
  public
  end;

var
  frmListagemPrecos: TfrmListagemPrecos;

implementation

uses Funcoes;

{$R *.dfm}

procedure TfrmListagemPrecos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListagemPrecos.FormShow(Sender: TObject);
begin
  cdsProduto.Open;
  CarregaCampos;
end;

procedure TfrmListagemPrecos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cdsProduto.Active then
    cdsProduto.Close;
  Action := caFree;
end;

procedure TfrmListagemPrecos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    Close;
  if Key = VK_F1 then
    ChamaHelp(Self, 60,'');
end;

procedure TfrmListagemPrecos.FormCreate(Sender: TObject);
begin
  inherited;
  CentralizaForm(Self);
end;

procedure TfrmListagemPrecos.CarregaCampos;
var
  i: Integer;
begin
  cbbCampo.Items.Clear;
  for i := 0 to cdsProduto.FieldCount - 1 do
    cbbCampo.Items.Add(FirstUpper(cdsProduto.Fields[i].DisplayLabel));
  if cbbCampo.Items.Count > 0 then
    cbbCampo.ItemIndex := 0;  
end;

procedure TfrmListagemPrecos.btnPesquisarClick(Sender: TObject);
var
  FSQL: string;
begin
  if edtPesquisa.Text = '' then
    FSQL := 'select * from VIEWPESQUISAPRECO'
  else
    FSQL := 'select * from VIEWPESQUISAPRECO where upper(udf_CollateBr('+
            AnsiUpperCase(cbbCampo.Text)+')) like upper(udf_CollateBr('+
            QuotedStr('%'+edtPesquisa.Text+'%')+'))';

  cdsProduto.Close;
  cdsProduto.CommandText := '';
  cdsProduto.CommandText := FSQL;
  cdsProduto.Open;
end;

procedure TfrmListagemPrecos.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = ',' then
     Key := '.';
end;

procedure TfrmListagemPrecos.cbbCampoClick(Sender: TObject);
begin
  if cbbCampo.ItemIndex <> -1 then
    SetFocusIfCan(edtPesquisa);
end;

procedure TfrmListagemPrecos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl is TCustomMemo) or
            ((ActiveControl is TCustomCombo) and
             (TCustomCombo(ActiveControl).DroppedDown)) then
    begin
      Key := #0;
      Exit;
    end
    else if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
    end
    else if (ActiveControl is TDBGrid) then
    begin
      with TDBGrid(ActiveControl) do
        if SelectedIndex < (FieldCount-1) then
          SelectedIndex := SelectedIndex+1
        else
          SelectedIndex := 0;
    end;
  end;
end;

initialization
  RegisterClass(TfrmListagemPrecos);
finalization
  UnRegisterClass(TfrmListagemPrecos);

end.
