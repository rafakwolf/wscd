inherited frmRenovaChave: TfrmRenovaChave
  Left = 232
  Top = 159
  ClientHeight = 201
  ClientWidth = 289
  Caption = 'frmRenovaChave'
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = True
  ExplicitWidth = 295
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  object grpRenovacao: TUniGroupBox
    Left = 16
    Top = 42
    Width = 257
    Height = 113
    Hint = ''
    ShowHint = True
    Caption = ''
    TabOrder = 0
    object edChave: TUniEdit
      Left = 64
      Top = 80
      Width = 129
      Hint = ''
      ShowHint = True
      Text = ''
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Verdana'
      TabOrder = 0
    end
    object mmoInfo: TUniMemo
      Left = 5
      Top = 8
      Width = 246
      Height = 47
      Hint = ''
      ShowHint = True
      Lines.Strings = (
        'Informe no campo abaixo a nova Chave '
        'de Libera'#231#227'o, para renovar liera'#231#227'o de '
        'uso do sistema. ')
      ReadOnly = True
      Color = clBtnFace
      TabOrder = 1
    end
  end
  object lbTitulo: TUniLabel
    Left = 16
    Top = 17
    Width = 134
    Height = 13
    Hint = ''
    ShowHint = True
    Caption = 'Chave atual v'#225'lida at'#233':'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 3
  end
  object btnRenovar: TUniBitBtn
    Left = 174
    Top = 164
    Width = 99
    Height = 25
    Hint = ''
    ShowHint = True
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
    Caption = '&Confirmar'
    TabOrder = 1
    OnClick = btnRenovarClick
  end
  object meDataAtual: TUniEdit
    Left = 189
    Top = 15
    Width = 84
    Hint = ''
    ShowHint = True
    Text = '99/99/9999'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Verdana'
    TabOrder = 2
    ReadOnly = True
  end
  object tmrInfo: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrInfoTimer
    Left = 72
    Top = 154
  end
end
