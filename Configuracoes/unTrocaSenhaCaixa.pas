unit unTrocaSenhaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DBClient, Provider, DB,
  SqlExpr, FMTBcd;

type
  TfrmSenhaCaixa = class(TForm)
    edAtual: TLabeledEdit;
    edNova: TLabeledEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    sqldConfig: TSQLDataSet;
    dspConfig: TDataSetProvider;
    cdsConfig: TClientDataSet;
    sqldConfigSENHAESTOQUE: TStringField;
    sqldConfigSENHACAIXA: TStringField;
    cdsConfigSENHAESTOQUE: TStringField;
    cdsConfigSENHACAIXA: TStringField;
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

uses Funcoes, VarGlobal, FuncoesWin;

{$R *.dfm}

procedure TfrmSenhaCaixa.FormShow(Sender: TObject);
begin
  edAtual.Clear;
  edNova.Clear;
end;

procedure TfrmSenhaCaixa.btnOkClick(Sender: TObject);
begin
  cdsConfig.Close;
  cdsConfig.Params.ParamByName('COMP').AsString := SysComputerName;
  cdsConfig.Open;

  if (edAtual.Text <> '') and (edNova.Text <> '') then
  begin
    if Decript(cdsConfigSENHACAIXA.AsString) = edAtual.Text then
    begin
      cdsConfig.Edit;
      cdsConfigSENHACAIXA.AsString := Trim(Encript(edNova.Text));
      cdsConfig.ApplyUpdates(0);
      Configuracao.Atualizar;
      MsgAviso('Senha de caixa alterada!');
      ModalResult := mrOk;
    end
    else
    begin
      MsgErro('Senha atual não confere, digite novamente.');
      edAtual.Clear;
      edNova.Clear;
      edAtual.SelectAll;
    end;
  end
  else
  begin
    MsgCuidado('Para alterar as senhas, você deve digita-las.');
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
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
  end;
end;

initialization
  RegisterClass(TfrmSenhaCaixa);
finalization
  UnRegisterClass(TfrmSenhaCaixa);
end.
