unit unOrdenarDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, Buttons, CheckLst, DBClient,
  Datasnap.Provider, DB, SqlExpr,  FMTBcd, System.Math, uniGUIBaseClasses,
  uniGUIClasses, uniButton, uniBitBtn, uniCheckBox;

type
  TfrmOrdenarDados = class(TfrmSimplePadrao)
    clbCampos: TCheckListBox;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    btnOK: TUniBitBtn;
    btnCancelar: TUniBitBtn;
    ckbCamposOrdenar: TUniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCamposOrdenarClick(Sender: TObject);
    procedure OrdenaListaDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure OrdenaListaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    FSQL, FTableName: string;
    procedure SetFieldInOrderBy(pFieldName: string);
    procedure CarregaCampos;
    function ContaChecados: Integer;
  public
    class function Execute(pSQLPadrao: string; var vSQLRetorno: string): Boolean;
  end;

var
  frmOrdenarDados: TfrmOrdenarDados;

implementation

uses Funcoes;

{$R *.dfm}

procedure TfrmOrdenarDados.CarregaCampos;
var
  i: Integer;
begin
  for i := 0 to cdsPadrao.FieldCount-1 do
  begin
    if not (cdsPadrao.Fields[i].DataType in [ftBlob, ftMemo, ftFixedChar, ftBoolean]) then
      if cdsPadrao.Fields[i].FieldKind = fkData then
        clbCampos.Items.Add(FirstUpper(cdsPadrao.Fields[i].DisplayLabel));
  end;
end;

class function TfrmOrdenarDados.Execute(pSQLPadrao: string;
  var vSQLRetorno: string): Boolean;
var
  i: Integer;
  Order: Boolean;
begin
  frmOrdenarDados := TfrmOrdenarDados.Create(Application);
  with frmOrdenarDados do
  try
    FSQL       := pSQLPadrao;
    FTableName := GetTableNameFromSQLText(FSQL);

    Order := Pos('order', LowerCase(FSQL)) > 0;

    cdsPadrao.Close;
    cdsPadrao.CommandText := 'select * from '+FTableName;
    cdsPadrao.Open;

    CarregaCampos;

    Result := ShowModal = mrOk;

    for i := 0 to clbCampos.Count-1 do
    begin
      if clbCampos.Checked[i] and (i <= IfThen(Order, 2, 3)) then
        SetFieldInOrderBy(AnsiUpperCase(clbCampos.Items[i]));
    end;
    
    vSQLRetorno := FSQL;
  finally
    FreeAndNil(frmOrdenarDados);
  end;
end;

procedure TfrmOrdenarDados.SetFieldInOrderBy(pFieldName: string);
var
  SQLOrder: string;
  PosOrder: Integer;
begin
  SQLOrder := '';
  PosOrder := 0;
  
  PosOrder := Pos('ORDER', AnsiUpperCase(FSQL));

  if PosOrder > 0 then
    SQLOrder := AnsiUpperCase(Copy(FSQL, PosOrder, Length(FSQL)));

  if PosOrder = 0 then
    FSQL := FSQL + ' ORDER BY ';

  if  (SQLOrder <> '') and (Pos(AnsiUpperCase(pFieldName), SQLOrder) > 0) then
    Exit;

  if PosOrder > 0 then
    FSQL := FSQL + ',';

  FSQL := FSQL + ' ' + FTableName+'.'+pFieldName;
end;

procedure TfrmOrdenarDados.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
end;

procedure TfrmOrdenarDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cdsPadrao.Active then
    cdsPadrao.Close;
  inherited;
end;

procedure TfrmOrdenarDados.ckbCamposOrdenarClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i := 0 to clbCampos.Count-1 do
    clbCampos.Checked[i] := ckbCamposOrdenar.Checked;
end;

procedure TfrmOrdenarDados.OrdenaListaDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  i, orig, dest: Integer;
  ObjTemp: TObject;
  StrTemp: String;
  CheckTemp: Boolean;
  List: TCheckListBox;
begin
  List := TCheckListBox(Sender);
  orig := List.ItemIndex;
  dest := List.ItemAtPos(Point(x,y), False);
  if dest = List.Count then
    dest := List.Count - 1;
  ObjTemp := List.Items.Objects[orig];
  StrTemp := List.Items[orig];
  CheckTemp := List.Checked[orig];
  if orig < dest then
    for i := orig to dest - 1 do
    begin
      List.Items.Objects[i] := List.Items.Objects[i+1];
      List.Items[i] := List.Items[i+1];
      List.Checked[i] := List.Checked[i+1];
    end
  else
    for i := orig downto dest + 1 do
    begin
      List.Items.Objects[i] := List.Items.Objects[i-1];
      List.Items[i] := List.Items[i-1];
      List.Checked[i] := List.Checked[i-1];
    end;
  List.Items.Objects[dest] := ObjTemp;
  List.Items[dest] := StrTemp;
  List.Checked[dest] := CheckTemp;
end;

procedure TfrmOrdenarDados.OrdenaListaDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = Sender);
end;

function TfrmOrdenarDados.ContaChecados: Integer;
var
  i, Count: Integer;
begin
  Count := 0;
  for i := 0 to clbCampos.Count-1 do
    if clbCampos.Checked[i] then
      Inc(Count);
  Result := Count;    
end;

end.
