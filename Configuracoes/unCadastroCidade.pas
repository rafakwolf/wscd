unit unCadastroCidade;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, memds,  SqlDb,  DBCtrls,
  FMTBcd,   uniEdit, uniDBEdit, 
    uniPanel,  uniStatusBar;

type
  TfrmCadastroCidade = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    sqldPadraoCODCIDADE: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODCIDADE: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    dbeNomeCidade: TDBEdit;
    dbeCodCidade: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmCadastroCidade: TfrmCadastroCidade;

implementation

uses
  ConstPadrao;

{$R *.dfm}

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
