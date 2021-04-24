inherited frmNotificacoes: TfrmNotificacoes
  Left = 311
  Top = 151
  Width = 450
  BorderStyle = bsDialog
  Caption = 'frmNotificacoes'
  ClientWidth = 450
  object Desmarcar: TSpeedButton[0]
    Left = 176
    Height = 25
    Top = 324
    Width = 146
    Caption = 'Sair'
    Color = clWindow
    Font.CharSet = ANSI_CHARSET
    ShowHint = True
    ParentFont = False
    ParentShowHint = False
  end
  object lbxNotificacoes: TListBox[1]
    Left = 0
    Height = 318
    Top = 0
    Width = 329
    Items.Strings = (
      'teste1'
      'teste2'
      'teste3'
      'teste4'
      'teste5'
    )
    ItemHeight = 23
    ParentShowHint = False
    ScrollWidth = 327
    ShowHint = True
    TabOrder = 0
  end
end
