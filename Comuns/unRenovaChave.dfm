inherited frmRenovaChave: TfrmRenovaChave
  Left = 232
  Top = 159
  BorderStyle = bsSingle
  Caption = 'frmRenovaChave'
  ClientHeight = 201
  ClientWidth = 289
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitWidth = 295
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  object lbTitulo: TLabel
    Left = 16
    Top = 17
    Width = 168
    Height = 16
    Caption = 'Chave atual v'#225'lida at'#233':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object meDataAtual: TMaskEdit
    Left = 189
    Top = 15
    Width = 84
    Height = 22
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = '99/99/9999'
  end
  object grpRenovacao: TGroupBox
    Left = 16
    Top = 42
    Width = 257
    Height = 113
    TabOrder = 0
    object mmoInfo: TMemo
      Left = 5
      Top = 8
      Width = 246
      Height = 47
      Alignment = taCenter
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = False
      Lines.Strings = (
        'Informe no campo abaixo a nova Chave '
        'de Libera'#231#227'o, para renovar liera'#231#227'o de '
        'uso do sistema. ')
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object edChave: TLabeledEdit
      Left = 64
      Top = 80
      Width = 129
      Height = 22
      EditLabel.Width = 126
      EditLabel.Height = 14
      EditLabel.Caption = 'Chave de libera'#231#227'o'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Verdana'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object btnRenovar: TBitBtn
    Left = 174
    Top = 164
    Width = 99
    Height = 25
    Caption = '&Confirmar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnRenovarClick
  end
  object tmrInfo: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrInfoTimer
    Left = 72
    Top = 154
  end
end
