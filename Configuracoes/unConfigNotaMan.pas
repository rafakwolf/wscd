unit unConfigNotaMan;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, ComCtrls, DB, Sqldb,
   memds, StdCtrls,  UniPageControl,
  DBCtrls,  Buttons, FMTBcd,   
   uniEdit, uniDBEdit,  uniDBCheckBox, uniPanel;

type
  TfrmConfigNotaMan = class(TfrmSimplePadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    dsPadrao: TDataSource;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoCAMPO: TStringField;
    sqldPadraoLAYOUT: TStringField;
    sqldPadraoREFERENCIA: TStringField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoLINHA: TIntegerField;
    sqldPadraoCOLUNA: TIntegerField;
    sqldPadraoIMPRIMIR: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoCAMPO: TStringField;
    cdsPadraoLAYOUT: TStringField;
    cdsPadraoREFERENCIA: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoLINHA: TIntegerField;
    cdsPadraoCOLUNA: TIntegerField;
    cdsPadraoIMPRIMIR: TStringField;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    btnNovo: TBitBtn;
    dbeCampoDescricao: TDBEdit;
    dbeLinha: TDBEdit;
    dbeColuna: TDBEdit;
    dbeLayOut: TDBEdit;
    dbckbImprimir: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsPadraoTIPOSetText(Sender: TField; const Text: String);
    procedure cdsPadraoTIPOChange(Sender: TField);
    procedure cdsPadraoBeforeInsert(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure dbeCampoDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dsPadraoStateChange(Sender: TObject);
  private
    FIdCampo: Integer;
    procedure CarregaCamposReferencia(Tipo: string);
    procedure SetIdCampo(const Value: Integer);
  public
    property IdCampo: Integer read FIdCampo write SetIdCampo;
  end;

var
  frmConfigNotaMan: TfrmConfigNotaMan;

implementation

uses Funcoes,  ConstPadrao, VarGlobal, uDatabaseutils;

{$R *.dfm}

procedure TfrmConfigNotaMan.CarregaCamposReferencia(Tipo: string);
var
  i: Integer;
begin
  //dbcbbRef.Items.Clear;
  if (Tipo = 'C') or (Tipo = 'R') then
  begin
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := GetConnection;
      SQL.Clear; SQL.Text :='SELECT RF.RDB$FIELD_NAME FROM RDB$RELATION_FIELDS RF '+
                     'WHERE RF.RDB$RELATION_NAME = :PTABLE';
      Params.ParamByName('PTABLE').AsString := 'VIEWVENDA';
      Open;
      First;
      while not Eof do
      begin
        //dbcbbRef.Items.Add(Trim(AnsiUpperCase(FieldByName('RDB$FIELD_NAME').AsString)));
        Next;
      end;
    finally
      Free;
    end;
  end
  else if (Tipo = 'T') then
  begin
    //dbcbbRef.Items.Add('Cabe�alho');
    //dbcbbRef.Items.Add('Itens da nota');
    //dbcbbRef.Items.Add('Rodap�');
  end
  else if (Tipo = 'I') then
  begin
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := GetConnection;
      SQL.Clear; SQL.Text :='SELECT RF.RDB$FIELD_NAME FROM RDB$RELATION_FIELDS RF '+
                     'WHERE RF.RDB$RELATION_NAME = :PTABLE';
      Params.ParamByName('PTABLE').AsString := 'VIEWITEMVENDA';
      Open;
      First;
      while not Eof do
      begin
        //dbcbbRef.Items.Add(Trim(AnsiUpperCase(FieldByName('RDB$FIELD_NAME').AsString)));
        Next;
      end;
    finally
      Free;
    end;
  end;

  //i := dbcbbRef.Items.IndexOf(cdsPadraoREFERENCIA.AsString);
  //dbcbbRef.ItemIndex := i;
end;

procedure TfrmConfigNotaMan.FormCreate(Sender: TObject);
begin
  inherited;
  SetDialogForm(Self);
  cdsPadrao.Open;
end;

procedure TfrmConfigNotaMan.cdsPadraoTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsString = 'C' then
    Text := 'Cabe�alho'
  else if Sender.AsString = 'R' then
    Text := 'Rodap�'
  else if Sender.AsString = 'T' then
    Text := 'Texto fixo'
  else
    Text := 'Itens da nota';  
end;

procedure TfrmConfigNotaMan.cdsPadraoTIPOSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  Sender.AsString := Copy(Text, 1, 1);  
end;

procedure TfrmConfigNotaMan.cdsPadraoTIPOChange(Sender: TField);
begin
  inherited;
  CarregaCamposReferencia(Sender.AsString);
end;

procedure TfrmConfigNotaMan.SetIdCampo(const Value: Integer);
begin
  FIdCampo := Value;
  if (FIdCampo <> -1) then
  begin
    cdsPadrao.Close;
    cdsPadrao.Params.ParamByName('PCODIGO').AsInteger := FIdCampo;
    cdsPadrao.Open;
    cdsPadrao.Edit;
    CarregaCamposReferencia(Copy(cdsPadraoTIPO.AsString, 1, 1));
  end
  else
    cdspadrao.Append;   
end;

procedure TfrmConfigNotaMan.cdsPadraoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  with cdsPadrao do
  begin
    if not IsEmpty then
    begin
      Close;
      //SetParamsNoResult(Params);
      Open;
    end;
  end;
end;

procedure TfrmConfigNotaMan.btnNovoClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.Append;
  SetFocusIfCan(dbeCampoDescricao);
end;

procedure TfrmConfigNotaMan.btnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.CancelUpdates;
  Close;
end;

procedure TfrmConfigNotaMan.btnOkClick(Sender: TObject);
begin
  inherited;
  if ModoInsert(cdsPadrao) then
  begin
    if SQLFind('CONFIGNOTA', 'CAMPO', dbeCampoDescricao.Text, GetConnection) then
    begin
      MsgErro('Este campo j� existe,  escolha outro nome.');
      Exit;
    end;
  end;

  if ModoInsertEdit(cdsPadrao) then
  begin
    if ValidaFieldsVazios([cdsPadraoCAMPO, cdsPadraoLAYOUT, cdsPadraoREFERENCIA,
      cdsPadraoTIPO, cdsPadraoLINHA, cdsPadraoCOLUNA], ['Nome do campo', 'LayOut',
      'Refer�ncia', 'Tipo', 'Linha', 'Coluna']) <> '' then
      Exit;
  end;

  cdsPadrao.ApplyUpdates(0);
  PostMessageAllForms(WM_CAMPO_CONFIG_NOTA);
end;

procedure TfrmConfigNotaMan.cdsPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregaCamposReferencia(DataSet.FieldByName('TIPO').AsString);
end;

procedure TfrmConfigNotaMan.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('CONFIGNOTA', cdsPadraoCODIGO, GetConnection);
  cdsPadraoIMPRIMIR.AsString := 'S';
end;

procedure TfrmConfigNotaMan.dbeCampoDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #32 then
    Key := #0;
end;

procedure TfrmConfigNotaMan.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  btnOk.Enabled := dsPadrao.DataSet.State in [dsEdit, dsInsert];
  btnNovo.Enabled := dsPadrao.DataSet.State in [dsBrowse];
end;

end.
