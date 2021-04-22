object frmPrevEtiquetaProduto: TfrmPrevEtiquetaProduto
  Left = 2
  Top = 1
  ClientHeight = 530
  ClientWidth = 782
  Caption = 'frmPrevEtiquetaProduto'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rpEtiqueta: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsEtq
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ForceMinBands = True
    PreviewOptions.ShowModal = True
    RealBounds.Height = 800.000000000000000000
    ShowProgress = False
    OnDataRecord = rpEtiquetaDataRecord
    object Detail: TRLDetailGrid
      Left = 38
      Top = 38
      Width = 718
      Height = 97
      AutoExpand = False
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      ColCount = 3
      object dbtBarcode: TRLDBBarcode
        Left = 10
        Top = 37
        Width = 73
        Height = 34
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        DataField = 'CODBARRA'
        DataSource = dsEtq
      end
      object dbtPreco: TRLDBText
        Left = 10
        Top = 77
        Width = 42
        Height = 15
        DataField = 'PRECO'
        DataSource = dsEtq
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object dbDescricao: TRLDBMemo
        Left = 1
        Top = 1
        Width = 230
        Height = 16
        Align = faLeftTop
        Behavior = [beSiteExpander]
        DataField = 'DESCRICAO'
        DataSource = dsEtq
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        BeforePrint = dbDescricaoBeforePrint
      end
    end
  end
  object dspEtq: TDataSetProvider
    DataSet = sqldEtq
    Options = [poAllowCommandText]
    Left = 48
    Top = 8
  end
  object cdsEtq: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEtq'
    Left = 80
    Top = 8
    object cdsEtqCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsEtqDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsEtqPRECO: TFMTBCDField
      FieldName = 'PRECO'
      currency = True
      Precision = 15
    end
  end
  object dsEtq: TDataSource
    DataSet = cdsEtq
    Left = 112
    Top = 8
  end
  object sqldEtq: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODBARRA, '#13#10'  DESCRICAO, '#13#10'  PRECO '#13#10'from ETIQUETAPRO' +
      'D'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 16
    Top = 8
    object sqldEtqCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldEtqDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldEtqPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
  end
end
