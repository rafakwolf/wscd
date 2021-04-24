object frmRelatorioListaPrecos: TfrmRelatorioListaPrecos
  Left = 285
  Height = 573
  Top = 88
  Width = 830
  Caption = 'frmRelatorioListaPrecos'
  ClientHeight = 573
  ClientWidth = 830
  Font.Name = 'MS Sans Serif'
  OnClose = FormClose
  LCLVersion = '2.0.12.0'
  object rpLista: TRLReport
    Left = 0
    Height = 1123
    Top = 0
    Width = 794
    DataSource = dsPadrao
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Margins.LeftMargin = 5
    Margins.TopMargin = 5
    Margins.RightMargin = 5
    Margins.BottomMargin = 5
    PreviewOptions.ShowModal = True
    BeforePrint = rpListaBeforePrint
    object bandCabecalho: TRLBand
      Left = 19
      Height = 67
      Top = 19
      Width = 756
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbTitulo: TRLLabel
        Left = 3
        Height = 23
        Top = 24
        Width = 750
        Alignment = taCenter
        AutoSize = False
        Caption = 'Lista Geral de Preços'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        ParentFont = False
      end
    end
    object bandDetalhe: TRLDetailGrid
      Left = 19
      Height = 18
      Top = 86
      Width = 756
      Color = 15790320
      ParentColor = False
      Transparent = False
      BeforePrint = bandDetalheBeforePrint
      object dbtDescricao: TRLDBText
        Left = 12
        Height = 16
        Top = 1
        Width = 80
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        ParentFont = False
        Transparent = False
      end
      object dbtPreco: TRLDBText
        Left = 648
        Height = 16
        Top = 1
        Width = 48
        Alignment = taRightJustify
        DataField = 'VENDA'
        DataSource = dsPadrao
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        ParentFont = False
        Transparent = False
      end
    end
    object bandRodape: TRLBand
      Left = 19
      Height = 24
      Top = 104
      Width = 756
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object dbData: TRLSystemInfo
        Left = 6
        Height = 15
        Top = 3
        Width = 39
      end
      object dbpage: TRLSystemInfo
        Left = 320
        Height = 15
        Top = 2
        Width = 87
        Info = itPageNumber
      end
    end
  end
  object sqldPadrao: TSQLQuery
    FieldDefs = <>
    Params = <>
    Left = 80
    Top = 8
    object sqldPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 50
    end
    object sqldPadraoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dspPadrao: TTimer
    Left = 112
    Top = 8
  end
  object cdsPadrao: TMemDataset
    FieldDefs = <>
    Left = 144
    Top = 8
    object cdsPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 50
    end
    object cdsPadraoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = True
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 176
    Top = 8
  end
end
