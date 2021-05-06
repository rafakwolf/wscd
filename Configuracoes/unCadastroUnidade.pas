unit unCadastroUnidade;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, DB, memds,  SqlDb, Menus,
  ActnList, StdCtrls, Buttons,   ComCtrls, 
  DBCtrls,  FMTBcd;

type
  TfrmCadastroUnidade = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TTimer;
    cdsPadrao: TMemDataSet;
    sqldPadraoCODUNIDADE: TIntegerField;
    sqldPadraoDESCRICAO: TStringField;
    cdsPadraoCODUNIDADE: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    dbeNomeUnidade: TDBEdit;
    dbeCodUnidade: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmCadastroUnidade: TfrmCadastroUnidade;

implementation

uses
  ConstPadrao;

{$R *.dfm}

procedure TfrmCadastroUnidade.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_UNIDADES;
  DisplayLabels := DL_UNIDADES;
  aCaption:= 'Unidades';
end;

initialization
  RegisterClass(TfrmCadastroUnidade);
finalization
  UnRegisterClass(TfrmCadastroUnidade);
end.
