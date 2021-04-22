object frmRelatorioListaPrecos: TfrmRelatorioListaPrecos
  Left = 2
  Top = 1
  ClientHeight = 530
  ClientWidth = 782
  Caption = 'frmRelatorioListaPrecos'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  object rpLista: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = dsPadrao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PreviewOptions.ShowModal = True
    BeforePrint = rpListaBeforePrint
    object bandCabecalho: TRLBand
      Left = 19
      Top = 19
      Width = 756
      Height = 67
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbTitulo: TRLLabel
        Left = 3
        Top = 24
        Width = 750
        Height = 23
        Alignment = taCenter
        AutoSize = False
        Caption = 'Lista Geral de Pre'#231'os'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object bandDetalhe: TRLDetailGrid
      Left = 19
      Top = 86
      Width = 756
      Height = 18
      Color = 15790320
      ParentColor = False
      Transparent = False
      BeforePrint = bandDetalheBeforePrint
      object dbtDescricao: TRLDBText
        Left = 12
        Top = 1
        Width = 80
        Height = 16
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object dbtPreco: TRLDBText
        Left = 648
        Top = 1
        Width = 48
        Height = 16
        Alignment = taRightJustify
        DataField = 'VENDA'
        DataSource = dsPadrao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
    object bandRodape: TRLBand
      Left = 19
      Top = 104
      Width = 756
      Height = 24
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object dbData: TRLSystemInfo
        Left = 6
        Top = 3
        Width = 39
        Height = 16
        Text = ''
      end
      object dbpage: TRLSystemInfo
        Left = 320
        Top = 2
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
      end
    end
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 'select '#13#10'  DESCRICAO, '#13#10'  VENDA '#13#10'from PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 80
    Top = 8
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object sqldPadraoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    Options = [poAllowCommandText]
    Left = 112
    Top = 8
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 144
    Top = 8
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object cdsPadraoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      currency = True
      Precision = 15
    end
  end
  object dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 176
    Top = 8
  end
end
