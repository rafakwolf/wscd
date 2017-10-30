inherited frmDesmarcar: TfrmDesmarcar
  Left = 222
  Top = 143
  ClientHeight = 105
  ClientWidth = 297
  Caption = 'frmDesmarcar'
  BorderStyle = bsSingle
  ExplicitWidth = 303
  ExplicitHeight = 134
  PixelsPerInch = 96
  TextHeight = 13
  object Desmarcar: TUniSpeedButton
    Left = 104
    Top = 72
    Width = 89
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = '&OK'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    ParentColor = False
    Color = clWindow
    TabOrder = 2
    OnClick = DesmarcarClick
  end
  object Cancel: TUniSpeedButton
    Left = 200
    Top = 72
    Width = 89
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = '&Cancelar'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    ParentColor = False
    Color = clWindow
    TabOrder = 3
    OnClick = CancelClick
  end
  object Alterados: TUniCheckBox
    Left = 15
    Top = 13
    Width = 130
    Height = 17
    Hint = ''
    ShowHint = True
    Caption = 'Produtos alterados'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 0
  end
  object Novos: TUniCheckBox
    Left = 15
    Top = 32
    Width = 110
    Height = 17
    Hint = ''
    ShowHint = True
    Caption = 'Produtos novos'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 1
  end
end
