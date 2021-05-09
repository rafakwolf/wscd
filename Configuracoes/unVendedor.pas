unit unVendedor;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, Buttons,   ComCtrls,
  memds, Sqldb, StdCtrls, DBCtrls, ZSqlUpdate, ZDataset, FMTBcd;

type

  { TfrmVendedor }

  TfrmVendedor = class(TfrmPadrao)
    dbeIdVendedor: TDBEdit;
    dbeVendedor: TDBEdit;
    dbcbAtivo: TDBCheckBox;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmVendedor: TfrmVendedor;

implementation

uses ConstPadrao,  Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmVendedor.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_VENDEDOR;
  DisplayLabels := DL_VENDEDOR;
  aCaption := 'Vendedor';
end;

initialization
  RegisterClass(TfrmVendedor);
finalization
  UnRegisterClass(TfrmVendedor);
end.
