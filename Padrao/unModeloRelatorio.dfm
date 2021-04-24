object frmModeloRelatorio: TfrmModeloRelatorio
  Left = 0
  Top = 73
  ClientHeight = 488
  ClientWidth = 820
  Caption = 'frmModeloRelatorio'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rrPadrao: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsPadrao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = rrPadraoBeforePrint
    object rbTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 101
      BandType = btTitle
      object lbTitulo: TRLLabel
        Left = 3
        Top = 77
        Width = 706
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlmCabecalho: TRLMemo
        Left = 88
        Top = 3
        Width = 624
        Height = 68
        Behavior = [beSiteExpander]
      end
      object imgLogo: TRLImage
        Left = 7
        Top = 3
        Width = 73
        Height = 68
      end
    end
    object rbRodape: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 59
      BandType = btFooter
      object sysData: TRLSystemInfo
        Left = 633
        Top = 6
        Width = 70
        Height = 16
        Alignment = taRightJustify
        Text = 'Data:'
      end
      object sysPage: TRLSystemInfo
        Left = 568
        Top = 28
        Width = 135
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = 'P'#225'gina: '
      end
    end
  end
  object sqldPadrao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 16
    Top = 8
  end
  object dspPadrao: TTimer
    DataSet = sqldPadrao
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 88
    Top = 8
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 168
    Top = 16
  end
  object dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 256
    Top = 16
  end
  object rlepCalculos: TRLExpressionParser
    Left = 376
    Top = 8
  end
end
