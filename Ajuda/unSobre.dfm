object frmSobre: TfrmSobre
  Left = 377
  Height = 236
  Top = 203
  Width = 475
  Caption = 'Sobre'
  ClientHeight = 236
  ClientWidth = 475
  Font.CharSet = ANSI_CHARSET
  Font.Name = 'Verdana'
  KeyPreview = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ShowHint = True
  LCLVersion = '2.0.12.0'
  object btnOK: TButton
    Left = 312
    Height = 25
    Hint = 'Fechar'
    Top = 19
    Width = 57
    Caption = '&OK'
    OnClick = btnOKClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object lblVersao: TLabel
    Left = 8
    Height = 15
    Top = 43
    Width = 60
    Caption = 'lblVersao'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lblEmpresa: TLabel
    Left = 8
    Height = 15
    Top = 8
    Width = 73
    Caption = 'lblEmpresa'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lblCNPJ: TLabel
    Left = 8
    Height = 15
    Top = 24
    Width = 47
    Caption = 'lblCNPJ'
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object mmoOS: TMemo
    Left = 0
    Height = 100
    Top = 136
    Width = 475
    Align = alBottom
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
  end
end
