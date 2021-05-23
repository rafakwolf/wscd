unit unLancCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DB, ComCtrls,
    DBClient, Provider, SqlExpr, FMTBcd, VarGlobal;

type
  TfrmLancCaixa = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnNovo: TBitBtn;
    sqldCaixas: TSQLDataSet;
    dspCaixas: TDataSetProvider;
    cdsCaixas: TClientDataSet;
    cdsCaixasCODIGO: TIntegerField;
    cdsCaixasNOME: TStringField;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    dsPadrao: TDataSource;
    sqldPadraoCODCAIXA: TIntegerField;
    sqldPadraoCODCAIXAS: TIntegerField;
    sqldPadraoNOME: TStringField;
    sqldPadraoDATA: TDateField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoEXCLUIR: TStringField;
    cdsPadraoCODCAIXA: TIntegerField;
    cdsPadraoCODCAIXAS: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoDATA: TDateField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoEXCLUIR: TStringField;
    pgcCaixa: TPageControl;
    tsCadastro: TTabSheet;
    lbDesc: TLabel;
    lbDoc: TLabel;
    rdgConta: TDBRadioGroup;
    dbDesc: TDBEdit;
    dbDoc: TDBEdit;
    dbeCaixa: TDBEdit;
    dbeData: TDBEdit;
    dbeValor: TDBEdit;
    sqldCaixasCODIGO: TIntegerField;
    sqldCaixasNOME: TStringField;
    sqldCaixasINATIVO: TStringField;
    cdsCaixasINATIVO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    cdsPadraoVALOR: TFMTBCDField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbDocExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeCaixaClickButton(Sender: TObject);
    procedure dbeValorKeyPress(Sender: TObject; var Key: Char);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure cdsPadraoAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsPadraoBeforeInsert(DataSet: TDataSet);
    procedure cdsPadraoCODCAIXASValidate(Sender: TField);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgContaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsPadraoCODCAIXASChange(Sender: TField);
    procedure dspPadraoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
  private
    FIdCaixa: Integer;
    function CamposNulos: Boolean;
    procedure SetIdCaixa(const Value: Integer);
  public
    property IdCaixa: Integer read FIdCaixa write SetIdCaixa default 0;
  end;

var
  frmLancCaixa: TfrmLancCaixa;

implementation

uses unCaixa, Funcoes, unModeloConsulta, ConstPadrao;

{$R *.dfm}

procedure TfrmLancCaixa.btnOkClick(Sender: TObject);
begin
  if CamposNulos then
  begin
    MsgCuidado('','Preencha todos os campos');
    Exit;
  end
  else
    cdsPadrao.ApplyUpdates(0);
end;

procedure TfrmLancCaixa.btnCancelClick(Sender: TObject);
begin
  cdsPadrao.CancelUpdates;
  Close;
end;
 
procedure TfrmLancCaixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if cdsPadrao.State in [dsInsert, dsEdit] then
    cdsPadrao.CancelUpdates;

  cdsPadrao.Close;  
end;

procedure TfrmLancCaixa.dbDocExit(Sender: TObject);
begin
  if cdsPadrao.State in [dsInsert] then
  begin
    //if SQLFind('CAIXA', 'DOCUMENTO', dbDoc.Text, GetConnection) then
    //begin
    //  MsgCuidado('Numero de documento já existe');
    //  SetFocusIfCan(dbDoc);
    //  Exit;
    //end;
  end;  
end;

function TfrmLancCaixa.CamposNulos: Boolean;
begin
  Result := False;
  if (rdgConta.ItemIndex = -1) or
     (ClearMask(dbeData.Text) = '') or
     (dbDesc.Text = '') or
     (dbDoc.Text = '') or
     (dbeValor.Text = '') then
  begin
    Result := True;
  end;
end;

procedure TfrmLancCaixa.btnNovoClick(Sender: TObject);
begin
  case rdgConta.ItemIndex of
    0:
    begin
      if cdsPadrao.State in [dsBrowse] then
      begin
        cdsPadrao.Insert;
        cdsPadraoTIPO.AsString := 'C';
        cdsPadraoEXCLUIR.AsString := 'N';
        SetFocusIfCan(dbDesc);
      end;
    end;
    1:
    begin
      if cdsPadrao.State in [dsBrowse] then
      begin
        cdsPadrao.Insert;
        cdsPadraoTIPO.AsString := 'D';
        cdsPadraoEXCLUIR.AsString := 'N';
        SetFocusIfCan(dbDesc);
      end;
    end;
  end;
end;

procedure TfrmLancCaixa.FormCreate(Sender: TObject);
begin
  cdsPadrao.Open;
  CentralizaForm(Self);
end;

procedure TfrmLancCaixa.dbeCaixaClickButton(Sender: TObject);
begin
  if TfrmModeloConsulta.Execute('Caixas', cdsCaixas, FN_CAIXAS, FN_CAIXAS) then
    cdsPadraoCODCAIXAS.AsInteger := cdsCaixasCODIGO.AsInteger;
end;

procedure TfrmLancCaixa.dbeValorKeyPress(Sender: TObject; var Key: Char);
begin
  //ControlarTeclas(Key);
end;

procedure TfrmLancCaixa.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  //Incrementa('CAIXA', cdsPadraoCODCAIXA, GetConnection);
  cdsPadraoDATA.AsDateTime := Date;
  cdsPadraoEXCLUIR.AsString := 'N';
end;

procedure TfrmLancCaixa.cdsPadraoAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  PostMessageAllForms(WM_CAIXA_INSERIDO, frmCaixa);
end;

procedure TfrmLancCaixa.SetIdCaixa(const Value: Integer);
begin
  FIdCaixa := Value;
  if (Value > 0) then
  begin
    with cdsPadrao do
    begin
      CancelUpdates;
      Close;
      Params.ParamByName('CODCAIXA').AsInteger := Value;
      Open;
      Edit;
    end;
  end
  else
    cdsPadrao.Append;
end;

procedure TfrmLancCaixa.cdsPadraoBeforeInsert(DataSet: TDataSet);
begin
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

procedure TfrmLancCaixa.cdsPadraoCODCAIXASValidate(Sender: TField);
var
  NomeCaixa: string;
begin
  inherited;
  //NomeCaixa := GetFieldByID(GetConnection, 'CAIXAS', 'NOME', 'CODIGO',
  //  Sender.AsInteger);
  if NomeCaixa <> '' then
    cdsPadraoNOME.AsString := NomeCaixa;
end;

procedure TfrmLancCaixa.dsPadraoStateChange(Sender: TObject);
begin
  btnOk.Enabled := dsPadrao.DataSet.State in [dsEdit, dsInsert];
  btnNovo.Enabled := dsPadrao.DataSet.State in [dsBrowse];
end;

procedure TfrmLancCaixa.FormShow(Sender: TObject);
begin
  SetFocusIfCan(dbDesc);
end;

procedure TfrmLancCaixa.rdgContaEnter(Sender: TObject);
begin
  if cdsPadrao.State in [dsInsert] then
    cdsPadraoTIPO.AsString := 'C';
end;

procedure TfrmLancCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (ActiveControl is TCustomMemo) or
    ((ActiveControl is TCustomCombo) and (TCustomCombo(ActiveControl).DroppedDown)) then
    Exit;

  if Key = #13 then
  begin
    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
  end;
end;

procedure TfrmLancCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLancCaixa.cdsPadraoCODCAIXASChange(Sender: TField);
begin
  if cdsCaixas.Locate('CODIGO', Sender.AsInteger, []) then
  begin
    if cdsCaixasINATIVO.AsString = 'S' then
    begin
      MsgAviso('','Este caixa está configurado como inativo, não pode ser utilizado.');
      cdsPadraoCODCAIXAS.Clear;
      cdsPadraoNOME.Clear;
      Exit;
    end;
  end;
end;

procedure TfrmLancCaixa.dspPadraoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'CAIXA';
end;

initialization
  RegisterClass(TfrmLancCaixa);
finalization
  UnRegisterClass(TfrmLancCaixa);
end.
