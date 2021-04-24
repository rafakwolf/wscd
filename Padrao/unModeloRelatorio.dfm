object frmModeloRelatorio: TfrmModeloRelatorio
  Left = 369
  Height = 488
  Top = 156
  Width = 820
  Caption = 'frmModeloRelatorio'
  ClientHeight = 488
  ClientWidth = 820
  Font.CharSet = ANSI_CHARSET
  OnCreate = FormCreate
  LCLVersion = '2.0.12.0'
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
        Left = 633
        Height = 15
        Top = 6
        Width = 70
        Alignment = taRightJustify
        Text = 'Data:'
      end
      object sysPage: TRLSystemInfo
        Left = 568
        Height = 15
        Top = 28
        Width = 135
        Alignment = taRightJustify
        Info = itPageNumber
        Text = 'Página: '
      end
    end
  end
  object sqldPadrao: TSQLQuery
    FieldDefs = <>
    Params = <>
    Left = 16
    Top = 8
  end
  object dspPadrao: TTimer
    Left = 88
    Top = 8
  end
  object cdsPadrao: TMemDataset
    FieldDefs = <>
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
