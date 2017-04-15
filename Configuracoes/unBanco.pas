unit unBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, Provider, SqlExpr, DBClient, Mask, DBCtrls,
   FMTBcd, System.Actions;

type
  TfrmBanco = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dbeBanco: TDBEdit;
    sqldPadraoIDBANCO: TIntegerField;
    sqldPadraoBANCO: TStringField;
    cdsPadraoIDBANCO: TIntegerField;
    cdsPadraoBANCO: TStringField;
    dbeCodCompensacao: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmBanco: TfrmBanco;

implementation

uses ConstPadrao;

{$R *.dfm}

procedure TfrmBanco.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_BANCO;
  DisplayLabels := DL_BANCO;
  aCaption := 'Bancos';
end;

initialization
  RegisterClass(TfrmBanco);
finalization
  UnRegisterClass(TfrmBanco);

end.
