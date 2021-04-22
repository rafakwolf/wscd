inherited frmNotificacoes: TfrmNotificacoes
  Left = 222
  Top = 143
  ClientHeight = 357
  ClientWidth = 330
  Caption = 'frmNotificacoes'
  BorderStyle = bsDialog
  Movable = False
  AlignmentControl = uniAlignmentClient
  ExplicitWidth = 336
  ExplicitHeight = 386
  PixelsPerInch = 96
  TextHeight = 13
  object Desmarcar: TSpeedButton
    Left = 233
    Top = 324
    Width = 89
    Height = 25
    Hint = ''
    ShowHint = True
    Caption = '<i class="fa fa-check-circle" aria-hidden="true"></i> Ok'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    ParentColor = False
    Color = clWindow
    TabOrder = 0
  end
  object lbxNotificacoes: TListBox
    Left = 0
    Top = 0
    Width = 329
    Height = 318
    Hint = ''
    ShowHint = True
    Items.Strings = (
      'teste1'
      'teste2'
      'teste3'
      'teste4'
      'teste5')
    TabOrder = 1
  end
end
