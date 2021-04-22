unit unFornecedor;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, memds,  SqlDb, DBCtrls, VarGlobal,
     FMTBcd,    
   uniPanel,  uniStatusBar, uniEdit, uniDBEdit,
  uniMemo, uniDBMemo;

type
  TfrmFornecedor = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    sqldCidade: TSQLQuery;
    dspCidade: TComponent;
    cdsCidade: TMemDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    sqldPadraoCODFORNECEDOR: TIntegerField;
    sqldPadraoFANTAZIA: TStringField;
    sqldPadraoRAZAOSOCIAL: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoCIDADE: TIntegerField;
    sqldPadraoNOMECIDADE: TStringField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoCNPJ: TStringField;
    sqldPadraoIE: TStringField;
    sqldPadraoCEP: TStringField;
    sqldPadraoTELEFONE: TStringField;
    sqldPadraoFAX: TStringField;
    sqldPadraoEMAIL: TStringField;
    sqldPadraoUF: TStringField;
    sqldPadraoOBS: TMemoField;
    sqldPadraoVENDEDOR: TStringField;
    sqldPadraoTELEFONEVENDEDOR: TStringField;
    sqldPadraoEMAILVENDEDOR: TStringField;
    cdsPadraoCODFORNECEDOR: TIntegerField;
    cdsPadraoFANTAZIA: TStringField;
    cdsPadraoRAZAOSOCIAL: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoCIDADE: TIntegerField;
    cdsPadraoNOMECIDADE: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCNPJ: TStringField;
    cdsPadraoIE: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoTELEFONE: TStringField;
    cdsPadraoFAX: TStringField;
    cdsPadraoEMAIL: TStringField;
    cdsPadraoUF: TStringField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoVENDEDOR: TStringField;
    cdsPadraoTELEFONEVENDEDOR: TStringField;
    cdsPadraoEMAILVENDEDOR: TStringField;
    sqldPadraoDATACAD: TDateField;
    cdsPadraoDATACAD: TDateField;
    sqldPadraoTIPO: TStringField;
    cdsPadraoTIPO: TStringField;
    btnContas: TBitBtn;
    dbdDataCadastro: TDBEdit;
    dbeCidade: TDBEdit;
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
    bvlLinha: TPanel;
    dbmObs: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure miRelFornDataClick(Sender: TObject);
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure miRelPorCidadeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsPadraoCIDADEValidate(Sender: TField);
    procedure btnContasClick(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure cdsPadraoCNPJSetText(Sender: TField; const Text: String);
    procedure miAjustarCNPJClick(Sender: TObject);
    procedure cdsPadraoTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsPadraoTIPOSetText(Sender: TField; const Text: String);
  private
    Repetido: Boolean;
  public
    procedure AntesSalvar; override;
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

uses Funcoes, unModeloConsulta, ConstPadrao, unPrevRelFornData,
     uConfiguraRelatorio, unContasPagar, Extensos, uDatabaseutils;

{$R *.dfm}

procedure TfrmFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_FORN;
  DisplayLabels := DL_FORN;
  aCaption := 'Fornecedores';
end;

procedure TfrmFornecedor.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevRelFornData.Create(Self) do
  try
    cdsPadrao.Close;
    cdsPadrao.SQL.Clear; SQL.Text :='select * from VIEWRELFORN order by CIDADE, FANTAZIA';
    cdsPadrao.Open;
    TipoRelatorio := 0;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmFornecedor.miRelFornDataClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioFornecedorData', 'Fornecedores por data', Self);
end;

procedure TfrmFornecedor.dbeCidadeClickButton(Sender: TObject);
begin
  inherited;
//  if (cdsPadrao.State in [dsInsert, dsEdit]) then
//    if TfrmModeloConsulta.Execute('Cidade', cdsCidade, FN_CIDADES, DL_CIDADES) then
//      cdsPadraoCIDADE.AsInteger := cdsCidadeCODCIDADE.AsInteger;
end;

procedure TfrmFornecedor.miRelPorCidadeClick(Sender: TObject);
begin
  inherited;
  ChamaForm('TfrmRelatorioFornecedorCidade', 'Fornecedores por cidade', Self);
end;

procedure TfrmFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if cdsCidade.Active then
    cdsCidade.Close;
end;

procedure TfrmFornecedor.cdsPadraoCIDADEValidate(Sender: TField);
var
  NomeCidade: string;
begin
  inherited;
  NomeCidade := GetFieldByID(GetConnection, 'CIDADES', 'DESCRICAO', 'CODCIDADE',
    Sender.AsInteger);
  if NomeCidade <> '' then
    cdsPadraoNOMECIDADE.AsString := NomeCidade;
end;

procedure TfrmFornecedor.btnContasClick(Sender: TObject);
begin
  inherited;
  frmContasPagar := TfrmContasPagar.Create(Self);
  frmContasPagar.Caption := 'Contas por Fornecedor: '+cdsPadraoFANTAZIA.AsString;
  frmContasPagar.TipoChamada := 1;
  frmContasPagar.IdForn := cdsPadraoCODFORNECEDOR.AsInteger;
  frmContasPagar.ShowModal;
end;

procedure TfrmFornecedor.AntesSalvar;
begin
  inherited;
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    SQL.Clear; SQL.Text :='select count(1) from FORNECEDORES where CNPJ = '+QuotedStr(dbeCnpj.Text);
    Open;
    Repetido := Fields[0].AsInteger > 0;
  finally
    Free;
  end;

  if (ModoInsert(cdsPadrao) and Repetido) then
  begin
    MsgAviso('Fornecedor com este CNPJ j� est� cadastrado.');
    Abort;
  end;
end;

procedure TfrmFornecedor.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('FORNECEDORES', cdsPadraoCODFORNECEDOR, sqldPadrao.SQLConnection);
  SetFocusIfCan(dbeNomeRzSocial);
end;

procedure TfrmFornecedor.cdsPadraoCNPJSetText(Sender: TField;
  const Text: String);
begin
  inherited;    {
  if ValidaCampo(Text, 1) then
    Sender.AsString := FormatarDoc(Text, 1)
  else
  begin
    MsgCuidado('CNPJ inv�lido.');
    Sender.Clear;
    Sender.FocusControl;
    Exit;
  end;   }
end;

procedure TfrmFornecedor.miAjustarCNPJClick(Sender: TObject);

  procedure AjustaRequires(b: Boolean);
  begin
    cdsPadraoRAZAOSOCIAL.Required      := b;
    cdsPadraoCIDADE.Required           := b;
    cdsPadraoCNPJ.Required             := b;
    cdsPadraoVENDEDOR.Required         := b;
    cdsPadraoTELEFONE.Required         := b;
    cdsPadraoTELEFONEVENDEDOR.Required := b;
  end;

var
  Erro: Boolean;
begin
  inherited;
  try
    try
      Erro := False;

      AjustaRequires(False);
      cdsPadrao.First;
      cdsPadrao.DisableControls;
      while not cdsPadrao.Eof do
      begin
        if Trim(cdsPadraoCNPJ.AsString) <> '' then
        begin{
          if ValidaCampo(cdsPadraoCNPJ.AsString, 1) then
          begin
            cdsPadrao.Edit;
            cdsPadraoCNPJ.AsString := FormatarDoc(cdsPadraoCNPJ.AsString, 1);
            cdsPadrao.ApplyUpdates(0);
          end;}
        end;
        cdsPadrao.Next;
      end;
    except
      Erro := True;
      raise Exception.Create('Erro ao ajustar CNPJs.');
    end;
  finally

    if not Erro then
      MsgAviso('Ajuste de CNPJs conclu�do!');
    AjustaRequires(True);
    cdsPadrao.EnableControls;
  end;
end;

procedure TfrmFornecedor.cdsPadraoTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsString = 'F' then
    Text := 'F�sica'
  else
    Text := 'Jur�dica';
end;

procedure TfrmFornecedor.cdsPadraoTIPOSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if Text = 'F�sica' then
    Sender.AsString := 'F'
  else
    Sender.AsString := 'J';
end;

initialization
  RegisterClass(TfrmFornecedor);
finalization
  UnRegisterClass(TfrmFornecedor);
end.


