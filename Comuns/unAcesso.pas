unit unAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, SqlExpr,  Vcl.Imaging.pngimage,
  uniGUIForm, uniGUIBaseClasses, uniGUIClasses, uniButton, uniBitBtn, uniEdit,
  uniImage;

type
  TfrmAcesso = class(TUniLoginForm)
    btnCancelar: TUniBitBtn;
    btnOK: TUniBitBtn;
    edtUsuario: TUniEdit;
    edtSenha: TUniEdit;
    imgAcesso: TUniImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    Ok: Boolean;
    Tentativa: Integer;
    class var LogIn: Boolean;
  protected
  public
    function ValidaLogin: Boolean;
    function UsuarioExiste: Boolean;
    class function Execute(LogOff: Boolean): Boolean;
  end;

var
  frmAcesso: TfrmAcesso;

implementation

uses unDmPrincipal, Funcoes, unSetupConnection, VarGlobal,
  udmAcesso, Datasnap.DBClient, uUtilFncs, IniFiles, UniGUIVars;

{$R *.dfm}

function TfrmAcesso.ValidaLogin: Boolean;
var cdsResultado: TClientDataSet;
begin
  Inc(Tentativa);

  if (Tentativa > 3) then
  begin
    Result := False;
    MsgErro('','Esgotado o número de tentativas. ' +
      'Por medida de segurança, o sistema será finalizado.');
    Application.Terminate;
    Exit;
  end;

  if not (AnsiLowerCase(edtUsuario.Text) = 'adm') then
  begin
    with TdmAcesso.Create(self) do
    try
      cdsResultado := ValidaLogin(edtUsuario.Text,edtSenha.Text);
      if not cdsResultado.IsEmpty then
      begin
        Result := True;
        IdUsuario := cdsResultado.FieldByName('IDUSUARIOS').AsInteger;
        Usuario := cdsResultado.FieldByName('LOGIN').AsString;
      end;
    finally
      Free;
    end;
  end
  else
  if SenhaDoDia(edtSenha.Text) then
  begin
    IdUsuario := 0;
    Usuario := 'adm';
    Result := True;
  end
  else
    Result := False;
end;

procedure TfrmAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F6 then
  begin
    frmSetupConnection := TfrmSetupConnection.Create(Application);
    frmSetupConnection.ShowModal;
  end;

  if Key = VK_F1 then
    ChamaHelp(Self, 0,'');

  if Key = VK_ESCAPE then
    btnCancelar.Click;

  if (ActiveControl = edtSenha) and (Key = VK_RETURN) then
    btnOK.Click;
end;

procedure TfrmAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAcesso.FormActivate(Sender: TObject);
begin
  edtUsuario.Visible := True;
  edtSenha.Visible := True;
  btnOK.Visible := True;
  btnCancelar.Visible := True;

  with TIniFile.Create(ExtractFilePath(Application.Exename)+'cfg.ini') do
  try
    if not ReadString('Login', 'NomeUsuario','').IsEmpty then
    begin
      edtUsuario.Text := Readstring('Login', 'NomeUsuario','');
      edtSenha.SetFocus;
    end
    else
      edtUsuario.SetFocus;
  finally
    Free;
  end;

  Repaint;
  ForceForegroundWindow(Handle);
end;

class function TfrmAcesso.Execute(LogOff: Boolean): Boolean;
begin
  LogIn := (not LogOff);
  frmAcesso := TfrmAcesso.Create(Application);
  try
    Result := (frmAcesso.ShowModal = mrOK);
  finally
    if Assigned(frmAcesso) then
      frmAcesso.Free;
  end;
end;

procedure TfrmAcesso.btnOkClick(Sender: TObject);
begin
//  if Trim(edtUsuario.Text).IsEmpty then
//  begin
//    MsgErro('','Informe o usuário.');
//    ModalResult := mrNone;
//    edtUsuario.SetFocus;
//    Exit;
//  end;
//
//  if Trim(edtSenha.Text).IsEmpty then
//  begin
//    MsgErro('','Informe a senha.');
//    ModalResult := mrNone;
//    edtSenha.SetFocus;
//    Exit;
//  end;
//
//  if UsuarioExiste then
//  begin
//    if ValidaLogin then
//    begin
//      with TIniFile.Create(ExtractFilePath(Application.Exename)+'cfg.ini') do
//      try
//        WriteString('Login', 'NomeUsuario', edtUsuario.Text);
//      finally
//        free;
//      end;
//
//      ModalResult := mrOk;
//      Ok := True;
//    end
//    else
//    begin
//      ModalResult := mrNone;
//      MsgErro('','Usuário ou Senha está incorreto.');
//      if ActiveControl is TLabeledEdit then
//        TLabeledEdit(ActiveControl).SelectAll;
//      Abort;
//    end;
//  end
//  else
//    raise Exception.Create('Nenhum usuário cadastrado.');

  ModalResult := mrOk;
end;

procedure TfrmAcesso.FormCreate(Sender: TObject);
begin
  Tentativa := 0;
  Ok := False;
end;

procedure TfrmAcesso.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmAcesso.UsuarioExiste: Boolean;
begin
  with TdmAcesso.Create(self) do
  try
    Result := UsuarioExiste(edtUsuario.Text);
  finally
    Free;
  end;
end;

initialization
  RegisterAppFormClass(TfrmAcesso);

end.

