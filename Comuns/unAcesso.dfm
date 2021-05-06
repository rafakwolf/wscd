object frmAcesso: TfrmAcesso
  Left = 391
  Height = 221
  Top = 216
  Width = 299
  HelpContext = 1
  BorderStyle = bsNone
  Caption = 'Acesso'
  ClientHeight = 221
  ClientWidth = 299
  KeyPreview = True
  ShowHint = True
  LCLVersion = '2.0.12.0'
  object btnOK: TBitBtn
    Left = 8
    Height = 32
    Hint = 'Efetuar login'
    Top = 117
    Width = 271
    Caption = 'Entrar'
    Font.Height = -16
    OnClick = btnOkClick
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edtUsuario: TEdit
    Left = 8
    Height = 33
    Hint = 'Usuário'
    Top = 21
    Width = 271
    MaxLength = 10
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 8
    Height = 33
    Top = 67
    Width = 271
    EchoMode = emPassword
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 2
  end
  object ckbLembrarLogin: TCheckBox
    Left = 112
    Height = 23
    Top = 173
    Width = 75
    Caption = 'Lembrar'
    Font.Height = -13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
end
