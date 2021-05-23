unit unEnvelopes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr,  Mask,
  DBCtrls, FMTBcd, System.Actions, VarGlobal;

type
  TfrmEnvelopes = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldPadraoIDENVELOPE: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoENDERECO: TStringField;
    sqldPadraoIDCIDADE: TIntegerField;
    sqldPadraoBAIRRO: TStringField;
    sqldPadraoCEP: TStringField;
    sqldPadraoMENSAGEM: TStringField;
    cdsPadraoIDENVELOPE: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoIDCIDADE: TIntegerField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoMENSAGEM: TStringField;
    lbNome: TLabel;
    lbEndereco: TLabel;
    lbBairro: TLabel;
    lbCep: TLabel;
    lbMsg: TLabel;
    dbNome: TDBEdit;
    dbEndereco: TDBEdit;
    dbBairro: TDBEdit;
    dbCep: TDBEdit;
    dbMsg: TDBEdit;
    dbeCidade: TDBEdit;
    sqldCidade: TSQLDataSet;
    sqldCidadeCODCIDADE: TIntegerField;
    sqldCidadeDESCRICAO: TStringField;
    dspCidade: TDataSetProvider;
    cdsCidade: TClientDataSet;
    cdsCidadeCODCIDADE: TIntegerField;
    cdsCidadeDESCRICAO: TStringField;
    sqldPadraoNOMECIDADE: TStringField;
    cdsPadraoNOMECIDADE: TStringField;
    procedure actPrintExecute(Sender: TObject);
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure cdsPadraoIDCIDADEValidate(Sender: TField);
  private
    
  public
    
  end;

var
  frmEnvelopes: TfrmEnvelopes;

implementation

uses Funcoes, ConstPadrao, unModeloConsulta, uConfiguraRelatorio,
     unPrevEnvelPerson;

{$R *.dfm}

procedure TfrmEnvelopes.actPrintExecute(Sender: TObject);
begin
  inherited;
  with TfrmPrevEnvelPerson.Create(Self)do
  try
    with cdsPadrao do
    begin
      Close;
      CommandText := 'select '#13 +
                        'e.IDENVELOPE, '#13 +
                        'e.NOME, '#13 +
                        'e.ENDERECO, '#13 +
                        'e.IDCIDADE, '#13 +
                        'c.DESCRICAO CIDADE, '#13 +
                        'e.BAIRRO, '#13 +
                        'e.CEP, '#13 +
                        'e.MENSAGEM '#13 +
                      'from ENVELOPE e '#13 +
                      'left join CIDADES c on (c.CODCIDADE = e.IDCIDADE) '#13 +
                      'where IDENVELOPE = :ID';
      Params.ParamByName('ID').AsInteger := Self.cdsPadraoIDENVELOPE.AsInteger;
      Open;
    end;
    PrintIfNotEmptyRL(rrEnvelope);
  finally
    Free;
  end;
end;

procedure TfrmEnvelopes.dbeCidadeClickButton(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in [dsInsert, dsEdit] then
    if TfrmModeloConsulta.Execute('Cidade', cdsCidade, FN_CIDADES, DL_CIDADES) then
      cdsPadraoIDCIDADE.AsInteger := cdsCidadeCODCIDADE.AsInteger;
end;

procedure TfrmEnvelopes.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_ENVELOPE;
  DisplayLabels := DL_ENVELOPE;
  aCaption := 'Envelopes';
end;

procedure TfrmEnvelopes.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('ENVELOPE', cdsPadraoIDENVELOPE, GetConnection);
  SetFocusIfCan(dbNome);
end;

procedure TfrmEnvelopes.cdsPadraoIDCIDADEValidate(Sender: TField);
var
  NomeCidade: string;
begin
  inherited;
  //NomeCidade := GetFieldByID(GetConnection, 'CIDADES', 'DESCRICAO', 'CODCIDADE',
  //  Sender.AsInteger);
  if NomeCidade <> '' then
    cdsPadraoNOMECIDADE.AsString := NomeCidade;
end;

initialization
  RegisterClass(TfrmEnvelopes);
finalization
  UnRegisterClass(TfrmEnvelopes);

end.

