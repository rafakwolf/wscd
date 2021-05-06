unit unTrocaSenha;

interface

uses

  Variants, Messages, ExtCtrls,  SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,   DB, 
  SqlDb, FMTBcd, LCLType;

type
  TfrmTrocaSenha = class(TForm)
    sqldUsuarios: TSQLQuery;
    sqldSenhaAtual: TSQLQuery;
    sqldSenhaAtualUSERS: TIntegerField;
    btGrava: TSpeedButton;
    btCancel: TSpeedButton;
    lbSenhaAtu: TLabel;
    lbNovaSenha: TLabel;
    lbConfirma: TLabel;
    edAtual: TEdit;
    edNova: TEdit;
    edConfirma: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btGravaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    function VerificaSenhaAtual(Senha: String): Boolean;
  public
  end;

var
  frmTrocaSenha: TfrmTrocaSenha;

implementation

uses Funcoes, VarGlobal;

{$R *.dfm}

procedure TfrmTrocaSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqldUsuarios.Close;
  sqldSenhaAtual.Close;
  Action := caFree;
end;

procedure TfrmTrocaSenha.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTrocaSenha.FormShow(Sender: TObject);
begin
  edAtual.Clear;
  edNova.Clear;
  edConfirma.Clear;
  edAtual.SetFocus;
end;

procedure TfrmTrocaSenha.btGravaClick(Sender: TObject);
begin
  if (edAtual.Text = '') then
  begin
    MsgAviso('','Digite a senha atual.');
    edAtual.SetFocus;
    Exit;
  end;
  if (edNova.Text = '') then
  begin
    MsgAviso('','Digite a nova senha.');
    edNova.SetFocus;
    Exit;
  end;
  if (edConfirma.Text = '') then
  begin
    MsgAviso('','Digite a senha de confirma��o.');
    edConfirma.SetFocus;
    Exit;
  end;
  if (edConfirma.Text <> edNova.Text) then
  begin
    MsgErro('','Senha de confirma��o n�o confere com a nova senha.');
    edConfirma.SetFocus;
    Exit;
  end;

  if not VerificaSenhaAtual(edAtual.Text) then
  begin
    MsgErro('','A sua senha atual n�o confere, digite novamente.');
    edAtual.SetFocus;
    Exit;
  end;

  try
    with sqldUsuarios do
    begin
      Close;
      Params.ParamByName('SENHA').AsString :=  edNova.Text;
      Params.ParamByName('LOGIN').AsString := Usuario;
      ExecSQL;
      MsgAviso('','Senha alterada com sucesso.');
      self.Close;
    end;
  except
    raise Exception.Create('Erro ao alterar senha.');
  end;
end;

function TfrmTrocaSenha.VerificaSenhaAtual(Senha: String): Boolean;
begin
  with sqldSenhaAtual do
  begin
    Close;
    Params.ParamByName('PLOGIN').AsString := Trim(Usuario);
    Params.ParamByName('PSENHA').AsString := Trim(Senha);
    Open;
    Result := (FieldByName('USERS').AsInteger > 0);
  end;
end;

procedure TfrmTrocaSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Key := Chr(0);
    //PostMessageAllForms(Handle, WM_KEYDOWN, VK_TAB, 1);
  end;
end;

procedure TfrmTrocaSenha.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

initialization
  RegisterClass(TfrmTrocaSenha);
finalization
  UnRegisterClass(TfrmTrocaSenha);
end.
