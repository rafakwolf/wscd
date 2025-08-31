object frmModeloRelatorio: TfrmModeloRelatorio
  Left = 369
  Height = 598
  Top = 156
  Width = 869
  Caption = 'frmModeloRelatorio'
  ClientHeight = 598
  ClientWidth = 869
  Font.CharSet = ANSI_CHARSET
  OnCreate = FormCreate
  WindowState = wsMaximized
  object rrPadrao: TRLReport
    Left = 0
    Height = 1123
    Top = 0
    Width = 794
    DataSource = dsPadrao
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    BeforePrint = rrPadraoBeforePrint
    object rbTitulo: TRLBand
      Left = 38
      Height = 48
      Top = 38
      Width = 718
      BandType = btTitle
      object lbTitulo: TRLLabel
        Left = 3
        Height = 16
        Top = 77
        Width = 706
        Alignment = taCenter
        AutoSize = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlmCabecalho: TRLMemo
        Left = 88
        Height = 15
        Top = 3
        Width = 624
        Behavior = [beSiteExpander]
      end
      object imgLogo: TRLImage
        Left = 7
        Height = 68
        Top = 3
        Width = 73
      end
    end
    object rbRodape: TRLBand
      Left = 38
      Height = 59
      Top = 86
      Width = 718
      BandType = btFooter
      object sysData: TRLSystemInfo
        Left = 632
        Height = 15
        Top = 6
        Width = 71
        Alignment = taRightJustify
        Text = 'Data:'
      end
      object sysPage: TRLSystemInfo
        Left = 566
        Height = 15
        Top = 28
        Width = 137
        Alignment = taRightJustify
        Info = itPageNumber
        Text = 'Página: '
      end
    end
  end
  object dsPadrao: TDataSource
    DataSet = sqldPadrao
    Left = 312
    Top = 192
  end
  object rlepCalculos: TRLExpressionParser
    Left = 376
    Top = 8
  end
  object sqldPadrao: TZQuery
    Params = <>
    Left = 152
    Top = 184
  end
end
