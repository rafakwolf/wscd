inherited frmCalendario: TfrmCalendario
  Left = 325
  Top = 189
  ClientHeight = 438
  ClientWidth = 490
  Caption = 'Calend'#225'rio'
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = True
  OnKeyPress = FormKeyPress
  BorderIcons = [biSystemMenu]
  Font.Name = 'MS Sans Serif'
  ExplicitWidth = 496
  ExplicitHeight = 467
  PixelsPerInch = 96
  TextHeight = 13
  object PanelDias: TUniContainerPanel
    Left = 0
    Top = 54
    Width = 490
    Height = 219
    Hint = ''
    ShowHint = True
    ParentColor = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    TabStop = False
    object VCalend: TUniCalendar
      Left = 0
      Top = 0
      Width = 490
      Height = 219
      Hint = ''
      ShowHint = True
      Date = 43035.000000000000000000
      FirstDayOfWeek = dowMonday
      TabStop = False
      TabOrder = 0
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      OnClick = VCalendClick
      ExplicitHeight = 161
    end
  end
  object PanelMes: TUniContainerPanel
    Left = 0
    Top = 28
    Width = 490
    Height = 26
    Hint = ''
    ShowHint = True
    ParentColor = False
    Color = 14548735
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    TabStop = False
    OnClick = VCalendClick
    ExplicitWidth = 375
    object GetAno: TUniSpinEdit
      Left = 157
      Top = 2
      Width = 53
      Height = 22
      Hint = 'Define ano'
      ShowHint = True
      ParentShowHint = False
      Value = 1
      MaxValue = 9000
      MinValue = 1
      TabOrder = 0
      Color = 14548735
      OnChange = GetAnoChange
      OnKeyPress = FormKeyPress
    end
  end
  object PanelExtra: TUniContainerPanel
    Left = 0
    Top = 321
    Width = 490
    Height = 117
    Hint = ''
    ShowHint = True
    ParentColor = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    TabStop = False
    ExplicitTop = 208
    ExplicitWidth = 375
    object LbTitulo: TUniLabel
      Left = 4
      Top = 4
      Width = 48
      Height = 13
      Hint = ''
      ShowHint = True
      Alignment = taCenter
      AutoSize = False
      Caption = 'Titulo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'MS Sans Serif'
      TabOrder = 8
    end
    object LbDias: TUniLabel
      Left = 4
      Top = 27
      Width = 45
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'Qtd. Dias'
      TabOrder = 9
    end
    object LbPeriodo: TUniLabel
      Left = 4
      Top = 28
      Width = 36
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'Per'#237'odo'
      TabOrder = 10
    end
    object LbTDias: TUniLabel
      Left = 4
      Top = 51
      Width = 20
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'Dias'
      TabOrder = 11
    end
    object LbTMeses: TUniLabel
      Left = 4
      Top = 73
      Width = 30
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'Meses'
      TabOrder = 12
    end
    object LbTAnos: TUniLabel
      Left = 4
      Top = 95
      Width = 32
      Height = 13
      Hint = ''
      ShowHint = True
      Caption = 'Ano(s)'
      TabOrder = 13
    end
    object BtnOk: TUniBitBtn
      Left = 133
      Top = 88
      Width = 75
      Height = 25
      Hint = ''
      ShowHint = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
        9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
        9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
        65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
        00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
        00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = '&Ok'
      TabOrder = 6
      OnClick = VCalendClick
    end
    object Dt_i: TUniEdit
      Left = 54
      Top = 24
      Width = 57
      Height = 21
      Hint = ''
      ShowHint = True
      MaxLength = 8
      Text = '  /  /  '
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'MS Sans Serif'
      TabOrder = 1
    end
    object Dt_f: TUniEdit
      Left = 118
      Top = 24
      Width = 57
      Height = 21
      Hint = ''
      ShowHint = True
      MaxLength = 8
      Text = '  /  /  '
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'MS Sans Serif'
      TabOrder = 2
      OnExit = Dt_fExit
    end
    object EdDias: TUniEdit
      Left = 54
      Top = 24
      Width = 43
      Height = 21
      Hint = ''
      ShowHint = True
      MaxLength = 5
      Text = ''
      TabOrder = 0
      OnExit = EdDiasExit
    end
    object EdR_Dias: TUniEdit
      Left = 54
      Top = 47
      Width = 58
      Height = 21
      Hint = ''
      ShowHint = True
      Text = ''
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'MS Sans Serif'
      TabOrder = 3
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
    end
    object EdR_Meses: TUniEdit
      Left = 54
      Top = 69
      Width = 58
      Height = 21
      Hint = ''
      ShowHint = True
      Text = ''
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'MS Sans Serif'
      TabOrder = 4
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
    end
    object EdR_Anos: TUniEdit
      Left = 54
      Top = 91
      Width = 58
      Height = 21
      Hint = ''
      ShowHint = True
      Text = ''
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'MS Sans Serif'
      TabOrder = 5
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
    end
  end
  object PnBotoes: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 28
    Hint = ''
    ShowHint = True
    ParentColor = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    TabStop = False
    ExplicitWidth = 375
    object Futura: TUniSpeedButton
      Left = 3
      Top = 2
      Width = 65
      Height = 22
      Hint = 'Data futura'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      Caption = '&Futura'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'MS Sans Serif'
      ParentColor = False
      Color = clWindow
      TabOrder = 0
      OnClick = FuturaClick
    end
    object Calculo: TUniSpeedButton
      Left = 73
      Top = 2
      Width = 65
      Height = 22
      Hint = 'C'#225'lculo entre datas'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      Caption = '&C'#225'lculo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'MS Sans Serif'
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      OnClick = CalculoClick
    end
    object btnHoje: TUniSpeedButton
      Left = 143
      Top = 2
      Width = 65
      Height = 22
      Hint = ''
      ShowHint = True
      Caption = '&Hoje'
      ParentColor = False
      Color = clWindow
      TabOrder = 2
      OnClick = btnHojeClick
    end
  end
end
