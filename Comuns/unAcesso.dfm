object frmAcesso: TfrmAcesso
  Left = 234
  Top = 126
  HelpContext = 1
  ClientHeight = 221
  ClientWidth = 299
  Caption = 'Acesso'
  BorderStyle = bsNone
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  Movable = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TUniBitBtn
    Left = 8
    Top = 117
    Width = 271
    Height = 32
    Hint = 'Efetuar login'
    ShowHint = True
    Caption = 'Login'
    ParentFont = False
    Font.Height = -16
    TabOrder = 1
    OnClick = btnOkClick
  end
  object edtUsuario: TUniEdit
    Left = 8
    Top = 21
    Width = 271
    Height = 33
    Hint = 'Usu'#225'rio'
    ShowHint = True
    MaxLength = 10
    Text = ''
    TabOrder = 0
  end
  object edtSenha: TUniEdit
    Left = 8
    Top = 67
    Width = 271
    Height = 35
    Hint = ''
    ShowHint = True
    PasswordChar = '*'
    Text = ''
    TabOrder = 2
  end
  object ckbLembrarLogin: TUniCheckBox
    Left = 112
    Top = 173
    Width = 73
    Height = 17
    Hint = ''
    ShowHint = True
    Caption = 'Lembrar'
    ParentFont = False
    Font.Height = -13
    TabOrder = 3
  end
end
