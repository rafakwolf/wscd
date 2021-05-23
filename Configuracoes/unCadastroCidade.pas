unit unCadastroCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, Mask, DBCtrls,
   FMTBcd, System.Actions;

type
  TfrmCadastroCidade = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dbeCodCidade: TDBEdit;
    dbeNomeCidade: TDBEdit;
    sqldPadraoCODCIDADE: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODCIDADE: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmCadastroCidade: TfrmCadastroCidade;

implementation

uses
  ConstPadrao, Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmCadastroCidade.FormShow(Sender: TObject);
begin
  inherited;
//  MsgAviso('Já existem ' + IntToStr(ContRegTable('CIDADES', GetConnection)) +
//    ' Cidades cadastradas, ' + #13 +
//    'por isso quando for cadastrar uma nova Cidade, use a pesquisa, ' + #13 +
//    'e verifique se ela já não existe.', 'Atenção');
end;

procedure TfrmCadastroCidade.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('CIDADES', cdsPadraoCODCIDADE, GetConnection);
  SetFocusIfCan(dbeNomeCidade);
end;

procedure TfrmCadastroCidade.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_CIDADES;
  DisplayLabels := DL_CIDADES;
  aCaption := 'Cidades';
end;

initialization
  RegisterClass(TfrmCadastroCidade);
finalization
  UnRegisterClass(TfrmCadastroCidade);
end.
