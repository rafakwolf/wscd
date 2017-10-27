unit unConfiguracaoGlobal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, DBCtrls, Mask,
   FMTBcd, System.Actions, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIClasses, uniPanel, uniGUIBaseClasses, uniStatusBar, uniEdit, uniDBEdit,
  uniCheckBox, uniDBCheckBox, uniMemo, uniDBMemo, uniPageControl;

type
  TfrmConfigGlobal = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    pgcConfigGlobal: TUniPageControl;
    tsCrediario: TUniTabSheet;
    tsCliente: TUniTabSheet;
    tsOrcamento: TUniTabSheet;
    tsVenda: TUniTabSheet;
    tsFTP: TUniTabSheet;
    sqldPadraoTAXAJURO: TFMTBCDField;
    sqldPadraoINTERVALO: TIntegerField;
    sqldPadraoPRAZOINICIAL: TIntegerField;
    sqldPadraoPARCELAS: TIntegerField;
    sqldPadraoLIMITECLIENTE: TFMTBCDField;
    sqldPadraoTITULOORCAM: TStringField;
    sqldPadraoCOLUNAORCAMBOBINA: TIntegerField;
    sqldPadraoMSGRODAPEORCAM: TStringField;
    sqldPadraoTITULOVENDA: TStringField;
    sqldPadraoCOLUNAVENDABOBINA: TIntegerField;
    sqldPadraoMSGRODAPEVENDA: TStringField;
    sqldPadraoLINHAPULARBOBINAVENDA: TIntegerField;
    sqldPadraoLINHAPULARBOBINAORCAM: TIntegerField;
    sqldPadraoPORTAIMPVENDA: TStringField;
    sqldPadraoFTP_HOST: TStringField;
    sqldPadraoFTP_USER_NAME: TStringField;
    sqldPadraoFTP_PASSWORD: TStringField;
    sqldPadraoFTP_TIMEOUT: TIntegerField;
    sqldPadraoFTP_PASSIVE: TStringField;
    sqldPadraoFTP_DIR: TStringField;
    sqldPadraoIDADECADASTROCLIENTE: TIntegerField;
    sqldPadraoIDCONFIGGLOBAL: TIntegerField;
    cdsPadraoTAXAJURO: TFMTBCDField;
    cdsPadraoINTERVALO: TIntegerField;
    cdsPadraoPRAZOINICIAL: TIntegerField;
    cdsPadraoPARCELAS: TIntegerField;
    cdsPadraoLIMITECLIENTE: TFMTBCDField;
    cdsPadraoTITULOORCAM: TStringField;
    cdsPadraoCOLUNAORCAMBOBINA: TIntegerField;
    cdsPadraoMSGRODAPEORCAM: TStringField;
    cdsPadraoTITULOVENDA: TStringField;
    cdsPadraoCOLUNAVENDABOBINA: TIntegerField;
    cdsPadraoMSGRODAPEVENDA: TStringField;
    cdsPadraoLINHAPULARBOBINAVENDA: TIntegerField;
    cdsPadraoLINHAPULARBOBINAORCAM: TIntegerField;
    cdsPadraoPORTAIMPVENDA: TStringField;
    cdsPadraoFTP_HOST: TStringField;
    cdsPadraoFTP_USER_NAME: TStringField;
    cdsPadraoFTP_PASSWORD: TStringField;
    cdsPadraoFTP_TIMEOUT: TIntegerField;
    cdsPadraoFTP_PASSIVE: TStringField;
    cdsPadraoFTP_DIR: TStringField;
    cdsPadraoIDADECADASTROCLIENTE: TIntegerField;
    cdsPadraoIDCONFIGGLOBAL: TIntegerField;
    lbMsgOrcamRodape: TUniLabel;
    lbMsgRodapeVenda: TUniLabel;
    dbeJuro: TUniDBEdit;
    dbeIntervalo: TUniDBEdit;
    dbePrazoInicial: TUniDBEdit;
    dbeParcelas: TUniDBEdit;
    dbeLimiteCliente: TUniDBEdit;
    dbeIdadeCliente: TUniDBEdit;
    dbeTituloOrcam: TUniDBEdit;
    dbeColunaBobina: TUniDBEdit;
    dbeLinhaPularOrcam: TUniDBEdit;
    dbeTituloVenda: TUniDBEdit;
    dbeColunaBobinaVenda: TUniDBEdit;
    dbeLinhaPularVenda: TUniDBEdit;
    dbePortaImpVenda: TUniDBEdit;
    dbeHost: TUniDBEdit;
    dbeUserName: TUniDBEdit;
    dbePassWord: TUniDBEdit;
    dbeDiretorio: TUniDBEdit;
    dbeTimeOut: TUniDBEdit;
    dbckbPassive: TUniDBCheckBox;
    dbmmMsgRodape: TUniDBMemo;
    dbmmMsgRodapeVenda: TUniDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure dbeJuroKeyPress(Sender: TObject; var Key: Char);
    procedure cdsPadraoCOLUNAORCAMBOBINAChange(Sender: TField);
    procedure cdsPadraoCOLUNAVENDABOBINAChange(Sender: TField);
  private
  public
  end;

var
  frmConfigGlobal: TfrmConfigGlobal;

implementation

uses Funcoes, ConstPadrao;

{$R *.dfm}

procedure TfrmConfigGlobal.FormCreate(Sender: TObject);
begin
  inherited;
  actInsert.Visible := False;
  actPrint.Visible := False;
  actDelete.Visible := False;
  actSearch.Visible := False;
//  actPrimeiro.Visible := False;
//  actAnterior.Visible := False;
//  actProximo.Visible := False;
//  actUltimo.Visible := False;
//  miRelatorios.Visible := False;
//  miOpcoes.Visible := False;
  ReordenaBotoes([btnAlterar, btnSalvar, btnCancelar, btnSair]);
  pgcConfigGlobal.ActivePageIndex := 0;
end;

procedure TfrmConfigGlobal.cdsPadraoAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  PostMessageAllForms(WM_CONFIG_GLOBAL_ALTERADO);
end;

procedure TfrmConfigGlobal.dbeJuroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmConfigGlobal.cdsPadraoCOLUNAORCAMBOBINAChange(
  Sender: TField);
begin
  inherited;
  if Sender.AsInteger > 40 then
  begin
    MsgAviso('O número de colunas não deve ser maior que 40.');
    Sender.AsInteger := 40;
  end;
end;

procedure TfrmConfigGlobal.cdsPadraoCOLUNAVENDABOBINAChange(
  Sender: TField);
begin
  inherited;
  if Sender.AsInteger > 40 then
  begin
    MsgAviso('O número de colunas não deve ser maior que 40.');
    Sender.AsInteger := 40;
  end;
end;

initialization
  RegisterClass(TfrmConfigGlobal);
finalization
  UnRegisterClass(TfrmConfigGlobal);
end.
