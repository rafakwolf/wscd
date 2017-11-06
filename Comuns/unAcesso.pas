unit unAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, SqlExpr,  Vcl.Imaging.pngimage,
  uniGUIForm, uniGUIBaseClasses, uniGUIClasses, uniButton, uniBitBtn, uniEdit,
  uniImage, uniCheckBox;

type
  TfrmAcesso = class(TUniLoginForm)
    btnOK: TUniBitBtn;
    edtUsuario: TUniEdit;
    edtSenha: TUniEdit;
    ckbLembrarLogin: TUniCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private
    Ok: Boolean;
    class var LogIn: Boolean;
  protected
  public
    function ValidaLogin: Boolean;
    function UsuarioExiste: Boolean;
  end;


function frmAcesso: TfrmAcesso;

implementation

uses unDmPrincipal, Funcoes, VarGlobal,
  udmAcesso, Datasnap.DBClient, uUtilFncs, IniFiles, UniGUIVars, MainModule;

{$R *.dfm}

function frmAcesso: TfrmAcesso;
begin
  Result := TfrmAcesso(UniMainModule.GetFormInstance(TfrmAcesso));
end;

function TfrmAcesso.ValidaLogin: Boolean;
var cdsResultado: TClientDataSet;
begin
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
  if (ActiveControl = edtSenha) and (Key = VK_RETURN) then
    btnOK.Click;
end;

procedure TfrmAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAcesso.btnOkClick(Sender: TObject);
begin
  if Trim(edtUsuario.Text).IsEmpty then
  begin
    MsgErro('','Informe o usuário.');
    ModalResult := mrNone;
    edtUsuario.SetFocus;
    Exit;
  end;

  if Trim(edtSenha.Text).IsEmpty then
  begin
    MsgErro('','Informe a senha.');
    ModalResult := mrNone;
    edtSenha.SetFocus;
    Exit;
  end;

  if UsuarioExiste then
  begin
    if ValidaLogin then
    begin
        if ckbLembrarLogin.Checked then
          UniApplication.Cookies.SetCookie('_erp_login', edtUsuario.Text);

      ModalResult := mrOk;
      Ok := True;
    end
    else
    begin
      ModalResult := mrNone;
      MsgErro('','Usuário ou Senha está incorreto.');
      Abort;
    end;
  end
  else
    raise Exception.Create('Nenhum usuário cadastrado.');

  ModalResult := mrOk;
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

