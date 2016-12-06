unit unTrocaSenhaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBClient,
  Provider, SqlExpr, unTrocaSenhaCaixa, FMTBcd;

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

uses Funcoes, VarGlobal, funcoeswin;

{$R *.dfm}

procedure TfrmSenhaEstoque.btnOkClick(Sender: TObject);
begin

  cdsConfig.Close;
  cdsConfig.Params.ParamByName('COMP').AsString := SysComputerName;
  cdsConfig.Open;

  if (edAtual.Text <> '') and (edNova.Text <> '') then
  begin
    if cdsConfigSENHAESTOQUE.AsString = Encript(edAtual.Text) then
    begin
      cdsConfig.Edit;
      cdsConfigSENHAESTOQUE.AsString := Trim(Encript(edNova.Text));
      cdsConfig.ApplyUpdates(0);
      Configuracao.Atualizar;
      MsgAviso('Senha de estoque alterada!');
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
