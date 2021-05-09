unit unCadastroUnidade;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, DB, SqlDb, Menus,
  ActnList, StdCtrls, Buttons,   ComCtrls, 
  DBCtrls, ZDataset, ZSqlUpdate,  FMTBcd;

type

  { TfrmCadastroUnidade }

  TfrmCadastroUnidade = class(TfrmPadrao)
    dbeNomeUnidade: TDBEdit;
    dbeCodUnidade: TDBEdit;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
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
