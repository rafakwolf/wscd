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
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnOkClick
  end
  object edtUsuario: TEdit
    Left = 8
    Height = 21
    Hint = 'Usuário'
    Top = 29
    Width = 271
    MaxLength = 10
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 8
    Height = 21
    Top = 75
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
    Top = 128
    Width = 77
    Caption = 'Lembrar'
    Font.Height = -13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object Label1: TLabel
    Left = 10
    Height = 16
    Top = 8
    Width = 46
    Caption = 'Usuário'
  end
  object Label2: TLabel
    Left = 8
    Height = 16
    Top = 56
    Width = 38
    Caption = 'Senha'
  end
end
