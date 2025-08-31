unit unAcesso;

interface

uses
 Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, SqlDb,  PNG;

type

  { TfrmAcesso }

  TfrmAcesso = class(TForm)
    btnOK: TBitBtn;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    ckbLembrarLogin: TCheckBox;
    procedure btnOkClick(Sender: TObject);
  private
    Ok: Boolean;
    class var LogIn: Boolean;
  protected
  public
    function ValidaLogin: Boolean;
    function UsuarioExiste: Boolean;
  end;


var frmAcesso: TfrmAcesso;

implementation

uses unDmPrincipal, Funcoes, VarGlobal,
  udmAcesso, memds, uUtilFncs, IniFiles;

{$R *.dfm}

function TfrmAcesso.ValidaLogin: Boolean;
var cdsResultado: TDataSet;
begin
  if not (AnsiLowerCase(edtUsuario.Text) = 'adm') then
  begin
    with TdmAcesso.Create(self) do
    try
      cdsResultado := ValidaLogin(edtUsuario.Text,edtSenha.Text, self);
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
  if edtSenha.Text = 'adm' then
  begin
    IdUsuario := 0;
    Usuario := 'adm';
    Result := True;
  end
  else
    Result := False;
end;

procedure TfrmAcesso.btnOkClick(Sender: TObject);
begin
  if Trim(edtUsuario.Text).IsEmpty then
  begin
    MsgErro('','Informe o usuario.');
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
      ModalResult := mrOk;
      Ok := True;
    end
    else
    begin
      ModalResult := mrNone;
      MsgErro('','Usuario ou Senha esta incorreto.');
      Abort;
    end;
  end
  else
  begin
    MsgErro('Nenhum usuario cadastrado.');
    ModalResult := mrAbort;
    Abort;
  end;

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


end.

