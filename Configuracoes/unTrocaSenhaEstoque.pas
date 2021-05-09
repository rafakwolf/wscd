unit unTrocaSenhaEstoque;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,   DB, memds,
   SqlDb, unTrocaSenhaCaixa, FMTBcd;

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
  zquery1.Open;
  zquery1.Filtered:=false;
  ZQuery1.Filter:='NOMECOMPUTADOR = '+QuotedStr(GetComputerName);
  zquery1.Filtered:=true;

  if (edAtual.Text <> '') and (edNova.Text <> '') then
  begin
    if zquery1.FieldByName('SENHAESTOQUE').AsString = EnDecrypt(edAtual.Text) then
    begin
      zquery1.Edit;
      zquery1.FieldByName('SENHAESTOQUE').AsString := Trim(EnDecrypt(edNova.Text));
      zquery1.ApplyUpdates;
      Configuracao.Atualizar;
      MsgAviso('Senha de estoque alterada!');
      ModalResult := mrOk;
    end
    else
    begin
      MsgErro('Senha atual nao confere, digite novamente.');
      edAtual.Clear;
      edNova.Clear;
      edAtual.SelectAll;
    end;
  end
  else
  begin
    MsgCuidado('Para alterar as senhas, voce deve digita-las.');
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
