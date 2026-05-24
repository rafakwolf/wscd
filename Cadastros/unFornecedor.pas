unit unFornecedor;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb, DBCtrls, ZSqlUpdate, ZDataset, VarGlobal,
  FMTBcd;

type

  { TfrmFornecedor }

  TfrmFornecedor = class(TfrmPadrao)
    lbNomeRzSocial: TLabel;
    lbNomeFantazia: TLabel;
    lbCnpj: TLabel;
    lbInscEstadual: TLabel;
    lbEndereco: TLabel;
    lbBairro: TLabel;
    lbCep: TLabel;
    lbEstado: TLabel;
    lbCidade: TLabel;
    lbTelefone: TLabel;
    lbFax: TLabel;
    lbDataCadastro: TLabel;
    lbEmail: TLabel;
    lbNomeVendedor: TLabel;
    lbTelefoneVendedor: TLabel;
    lbEmailVendedor: TLabel;
    lbObs: TLabel;
    btnContas: TBitBtn;
    dbdDataCadastro: TDBEdit;
    dbeTelefoneVendedor: TDBEdit;
    dbeEmailVendedor: TDBEdit;
    dbeNomeVendedor: TDBEdit;
    dbeFax: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeInscEstadual: TDBEdit;
    dbeCnpj: TDBEdit;
    dbeCep: TDBEdit;
    dbeBairro: TDBEdit;
    dbeEstado: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeNomeRzSocial: TDBEdit;
    dbeNomeFantazia: TDBEdit;
    dbeEmail: TDBEdit;
    dbcmbCidade: TDBLookupComboBox;
    dbmObs: TDBMemo;
    dsCidades: TDataSource;
    menu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    sqldPadrao: TZQuery;
    sqldCidades: TZReadOnlyQuery;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure miRelFornDataClick(Sender: TObject);
    procedure miRelPorCidadeClick(Sender: TObject);
    procedure btnContasClick(Sender: TObject);
  private
    Repetido: Boolean;
  public
    procedure AntesSalvar; override;
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

uses Funcoes, unModeloConsulta, ConstPadrao, unPrevRelFornData,
     uConfiguraRelatorio, unContasPagar, Extensos, uDatabaseUtils;

{$R *.dfm}

procedure TfrmFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_FORN;
  DisplayLabels := DL_FORN;
  aCaption := 'Fornecedores';
  sqldCidades.open;
end;

procedure TfrmFornecedor.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  inherited;
  sqldCidades.close;
end;

procedure TfrmFornecedor.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevRelFornData.Create(Self) do
  try
    sqldPadrao.Close;
    sqldPadrao.SQL.Clear;
    sqldPadrao.SQL.Text :='select * from VIEWRELFORN order by CIDADE, FANTAZIA';
    sqldPadrao.Open;
    TipoRelatorio := 0;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    sqldPadrao.Close;
    Free;
  end;
end;

procedure TfrmFornecedor.FormShow(Sender: TObject);
begin
  IgnoreAutoGenerateLabels:=true;
  inherited;
end;

procedure TfrmFornecedor.MenuItem1Click(Sender: TObject);
begin

end;

procedure TfrmFornecedor.miRelFornDataClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioFornecedorData', 'Fornecedores por data', Self);
end;

procedure TfrmFornecedor.miRelPorCidadeClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioFornecedorCidade', 'Fornecedores por cidade', Self);
end;

procedure TfrmFornecedor.btnContasClick(Sender: TObject);
begin
  inherited;
  frmContasPagar := TfrmContasPagar.Create(Self);
  frmContasPagar.Caption := 'Contas por Fornecedor: '+
    sqldPadrao.FieldByName('FANTASIA').AsString;
  frmContasPagar.TipoChamada := 1;
  frmContasPagar.IdForn := sqldPadrao.FieldByName('CODFORNECEDOR').AsInteger;
  frmContasPagar.ShowModal;
end;

procedure TfrmFornecedor.AntesSalvar;
begin
  inherited;
  with TZQuery.Create(nil) do
  try
    Connection := getzconnection;
    SQL.Clear;
    SQL.Text :='select count(1) from FORNECEDORES where CNPJ = '+QuotedStr(dbeCnpj.Text);
    Open;
    Repetido := Fields[0].AsInteger > 0;
  finally
    Free;
  end;

  if (ModoInsert(sqldPadrao) and Repetido) then
  begin
    MsgAviso('Fornecedor com este CNPJ ja esta cadastrado.');
    Abort;
  end;
end;

initialization
  RegisterClass(TfrmFornecedor);
finalization
  UnRegisterClass(TfrmFornecedor);
end.


