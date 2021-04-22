unit unBanco;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls,  SqlDb, memds,  DBCtrls,
   FMTBcd,   uniEdit, uniDBEdit, 
    uniPanel,  uniStatusBar;

type
  TfrmBanco = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    sqldPadraoIDBANCO: TIntegerField;
    sqldPadraoBANCO: TStringField;
    cdsPadraoIDBANCO: TIntegerField;
    cdsPadraoBANCO: TStringField;
    dbeCodCompensacao: TDBEdit;
    dbeBanco: TDBEdit;
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
