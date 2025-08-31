object frmAcesso: TfrmAcesso
  Left = 391
  Height = 220
  Top = 216
  Width = 291
  HelpContext = 1
  BorderStyle = bsDialog
  Caption = 'Acesso'
  ClientHeight = 220
  ClientWidth = 291
  KeyPreview = True
  ShowHint = True
  object btnOK: TBitBtn
    Left = 8
    Height = 32
    Hint = 'Efetuar login'
    Top = 168
    Width = 271
    Default = True
    DefaultCaption = True
    Font.Height = -16
    Kind = bkOK
    ModalResult = 1
    OnClick = btnOkClick
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object edtUsuario: TEdit
    Left = 8
    Height = 21
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
    Height = 21
    Top = 67
    Width = 271
    EchoMode = emPassword
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 1
  end
  object ckbLembrarLogin: TCheckBox
    Left = 96
    Height = 18
    Top = 104
    Width = 77
    Caption = 'Lembrar'
    Font.Height = -13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
end
