unit unTrocaSenhaCaixa;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, memds,  DB,
  SqlDb, FMTBcd;

type
  TfrmSenhaCaixa = class(TForm)
    sqldConfig: TSQLQuery;
    dspConfig: TComponent;
    cdsConfig: TMemDataSet;
    sqldConfigSENHAESTOQUE: TStringField;
    sqldConfigSENHACAIXA: TStringField;
    cdsConfigSENHAESTOQUE: TStringField;
    cdsConfigSENHACAIXA: TStringField;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    edAtual: TEdit;
    edNova: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  frmSenhaCaixa: TfrmSenhaCaixa;

implementation

uses Funcoes, VarGlobal, uUtilFncs, crypto;

{$R *.dfm}

procedure TfrmSenhaCaixa.FormShow(Sender: TObject);
begin
  edAtual.Clear;
  edNova.Clear;
end;

procedure TfrmSenhaCaixa.btnOkClick(Sender: TObject);
begin
  cdsConfig.Close;
  sqldConfig.Params.ParamByName('COMP').AsString := GetComputerName;
  cdsConfig.Open;

  if (edAtual.Text <> '') and (edNova.Text <> '') then
  begin
    if EnDecrypt(cdsConfigSENHACAIXA.AsString) = edAtual.Text then
    begin
      cdsConfig.Edit;
      cdsConfigSENHACAIXA.AsString := Trim(EnDecrypt(edNova.Text));
      //cdsConfig.ApplyUpdates(0);
      Configuracao.Atualizar;
      MsgAviso('Senha de caixa alterada!');
      ModalResult := mrOk;
    end
    else
    begin
      MsgErro('Senha atual n�o confere, digite novamente.');
      edAtual.Clear;
      edNova.Clear;
      edAtual.SelectAll;
    end;
  end
  else
  begin
    MsgCuidado('Para alterar as senhas, voc� deve digita-las.');
    edAtual.Clear;
    edNova.Clear;
    edAtual.SelectAll;
  end;
end;

procedure TfrmSenhaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsConfig.Close;
  Action := caFree;
end;

procedure TfrmSenhaCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Key := Chr(0);
    //PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
  end;
end;

initialization
  RegisterClass(TfrmSenhaCaixa);
finalization
  UnRegisterClass(TfrmSenhaCaixa);
end.
