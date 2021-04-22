unit unTrocaSenhaEstoque;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, memds,
   SqlDb, unTrocaSenhaCaixa, FMTBcd,  uniEdit,
    uniBitBtn;

type
  TfrmSenhaEstoque = class(TfrmSenhaCaixa)
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  frmSenhaEstoque: TfrmSenhaEstoque;

implementation

uses Funcoes, VarGlobal, uutilfncs, crypto;

{$R *.dfm}

procedure TfrmSenhaEstoque.btnOkClick(Sender: TObject);
begin

  cdsConfig.Close;
  cdsConfig.Params.ParamByName('COMP').AsString := GetComputerName;
  cdsConfig.Open;

  if (edAtual.Text <> '') and (edNova.Text <> '') then
  begin
    if cdsConfigSENHAESTOQUE.AsString = EnDecrypt(edAtual.Text) then
    begin
      cdsConfig.Edit;
      cdsConfigSENHAESTOQUE.AsString := Trim(EnDecrypt(edNova.Text));
      cdsConfig.ApplyUpdates(0);
      Configuracao.Atualizar;
      MsgAviso('Senha de estoque alterada!');
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

procedure TfrmSenhaEstoque.FormShow(Sender: TObject);
begin
  inherited;
  edAtual.Clear;
  edNova.Clear;
end;

initialization
  RegisterClass(TfrmSenhaEstoque);
finalization
  UnRegisterClass(TfrmSenhaEstoque);
end.
