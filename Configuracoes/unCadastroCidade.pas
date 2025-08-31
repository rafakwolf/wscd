unit unCadastroCidade;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls,   memds,  SqlDb,  DBCtrls, ZDataset, ZSqlUpdate,
  FMTBcd;

type

  { TfrmCadastroCidade }

  TfrmCadastroCidade = class(TfrmPadrao)
    dbeNomeCidade: TDBEdit;
    dbeCodCidade: TDBEdit;
    ZQuery1: TZQuery;
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
