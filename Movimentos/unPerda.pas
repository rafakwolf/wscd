unit unPerda;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, Buttons, ExtCtrls, ComCtrls,
  memds,  SqlDb, StdCtrls, DBCtrls, VarGlobal,
     FMTBcd, lcltype;

type
  TfrmPerda = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoCODPRODUTO: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoMOTIVO: TStringField;
    sqldPadraoOBS: TMemoField;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoCODPRODUTO: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoMOTIVO: TStringField;
    cdsPadraoOBS: TMemoField;
    sqldProduto: TSQLQuery;
    dspProduto: TComponent;
    cdsProduto: TMemDataSet;
    sqldProdutoIDPRODUTO: TIntegerField;
    sqldProdutoCODBARRA: TStringField;
    sqldProdutoDESCRICAO: TStringField;
    sqldProdutoABREVIACAO: TStringField;
    sqldProdutoVENDA: TFMTBCDField;
    sqldProdutoCUSTO: TFMTBCDField;
    cdsProdutoIDPRODUTO: TIntegerField;
    cdsProdutoCODBARRA: TStringField;
    cdsProdutoDESCRICAO: TStringField;
    cdsProdutoABREVIACAO: TStringField;
    cdsProdutoVENDA: TFMTBCDField;
    cdsProdutoCUSTO: TFMTBCDField;
    sqldPadraoQTDE: TIntegerField;
    sqldPadraoPRECO: TFMTBCDField;
    cdsPadraoQTDE: TIntegerField;
    cdsPadraoPRECO: TFMTBCDField;
    lbQtde: TLabel;
    lbPreco: TLabel;
    lbObs: TLabel;
    lbPrecoCusto: TLabel;
    dbdData: TDBEdit;
    dbQtde: TDBEdit;
    dbProduto: TDBEdit;
    dbPreco: TDBEdit;
    dbmOBS: TDBMemo;
    dbrgrpMOTIVO: TDBRadioGroup;
    procedure dbProdutoClickButton(Sender: TObject);
    procedure cdsPadraoCODPRODUTOValidate(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
  private
  public
  end;

var
  frmPerda: TfrmPerda;

implementation

uses Funcoes, ConstPadrao,  unModeloConsulta, unPrevPerda,
     uConfiguraRelatorio,  uDatabaseutils;

{$R *.dfm}

procedure TfrmPerda.dbProdutoClickButton(Sender: TObject);
begin
  inherited;
//  if ModoInsertEdit(cdsPadrao) then
//    if TfrmModeloConsulta.Execute('Produto', cdsProduto, FN_PRODUTOS, DL_PRODUTOS) then
//    begin
//      cdsPadraoCODPRODUTO.AsInteger := cdsProdutoIDPRODUTO.AsInteger;
//      cdsPadraoPRECO.AsFloat        := cdsProdutoCUSTO.AsFloat;
//    end;
end;

procedure TfrmPerda.cdsPadraoCODPRODUTOValidate(Sender: TField);
var
  NomeProduto: string;
begin
  NomeProduto := GetFieldByID(GetConnection, 'PRODUTOS', 'DESCRICAO', 'IDPRODUTO',
    Sender.AsInteger);
  if NomeProduto <> '' then
    cdsPadraoDESCRICAO.AsString := NomeProduto;
end;

procedure TfrmPerda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if cdsProduto.Active then
    cdsProduto.Close;
  inherited;
end;

procedure TfrmPerda.FormShow(Sender: TObject);
begin
  inherited;
  cdsProduto.Open;
end;

procedure TfrmPerda.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_PERDAS;
  DisplayLabels := DL_PERDAS;
  aCaption := 'Perdas';
end;

procedure TfrmPerda.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('PERDA', cdsPadraoCODIGO, GetConnection);
  SetFocusIfCan(dbProduto);
end;

procedure TfrmPerda.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevPerda.Create(Self) do
  try
    cdsPadrao.Open;
    //lbTitulo.Caption := 'Listagem de perdas';
    PrintIfNotEmptyRL(rrPadrao);
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmPerda);
finalization
  UnRegisterClass(TfrmPerda);
end.

