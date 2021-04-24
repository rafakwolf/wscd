inherited frmPrevProdutosVencimento: TfrmPrevProdutosVencimento
  Left = 325
  Top = 139
  Width = 810
  Caption = 'frmPrevProdutosVencimento'
  ClientHeight = 488
  ClientWidth = 810
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 31
        Top = 76
      end
      inherited rlmCabecalho: TRLMemo
        Height = 75
      end
      inherited imgLogo: TRLImage
        Height = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 149
    end
    object rlbColunas: TRLBand[2]
      Left = 38
      Height = 17
      Top = 86
      Width = 718
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodigo: TRLLabel
        Left = 3
        Height = 16
        Top = 0
        Width = 79
        Caption = 'Cod. Barras'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbProduto: TRLLabel
        Left = 112
        Height = 16
        Top = 0
        Width = 56
        Caption = 'Produto'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDataVenc: TRLLabel
        Left = 552
        Height = 16
        Top = 0
        Width = 80
        Caption = 'Vencimento'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbForn: TRLLabel
        Left = 339
        Height = 16
        Top = 0
        Width = 77
        Caption = 'Fornecedor'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCusto: TRLLabel
        Left = 635
        Height = 16
        Top = 0
        Width = 82
        Caption = 'Preço Custo'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbDetalhe: TRLBand[3]
      Left = 38
      Height = 16
      Top = 103
      Width = 718
      BeforePrint = rlbDetalheBeforePrint
      object rldbCodbarra: TRLDBText
        Left = 3
        Height = 16
        Top = 0
        Width = 108
        AutoSize = False
        DataField = 'CODBARRA'
        DataSource = dsPadrao
      end
      object rldbProduto: TRLDBText
        Left = 112
        Height = 16
        Top = 0
        Width = 225
        AutoSize = False
        DataField = 'PRODUTO'
        DataSource = dsPadrao
      end
      object rldbForn: TRLDBText
        Left = 339
        Height = 16
        Top = 0
        Width = 209
        AutoSize = False
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
      end
      object rldbDataVenc: TRLDBText
        Left = 552
        Height = 15
        Top = 0
        Width = 123
        DataField = 'DATAVENCIMENTO'
        DataSource = dsPadrao
      end
      object rldbCusto: TRLDBText
        Left = 622
        Height = 15
        Top = 0
        Width = 95
        Alignment = taRightJustify
        DataField = 'PRECOCUSTO'
        DataSource = dsPadrao
      end
    end
    object rlbndSomatorio: TRLBand[4]
      Left = 38
      Height = 30
      Top = 119
      Width = 718
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllbSomaCusto: TRLLabel
        Left = 615
        Height = 16
        Top = 8
        Width = 96
        Alignment = taRightJustify
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    Params = <    
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'UNIDADE'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'FORN'
        ParamType = ptInput
      end>
    object sqldPadraoCODBARRA: TStringField[0]
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object sqldPadraoPRODUTO: TStringField[1]
      FieldKind = fkData
      FieldName = 'PRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoDATAVENCIMENTO: TDateField[2]
      FieldKind = fkData
      FieldName = 'DATAVENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoUNIDADE: TStringField[3]
      FieldKind = fkData
      FieldName = 'UNIDADE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoGRUPO: TStringField[4]
      FieldKind = fkData
      FieldName = 'GRUPO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoFORNECEDOR: TStringField[5]
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoPRECOCUSTO: TFMTBCDField[6]
      FieldKind = fkData
      FieldName = 'PRECOCUSTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
      Size = 2
    end
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoCODBARRA: TStringField[0]
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object cdsPadraoPRODUTO: TStringField[1]
      FieldKind = fkData
      FieldName = 'PRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoDATAVENCIMENTO: TDateField[2]
      FieldKind = fkData
      FieldName = 'DATAVENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoUNIDADE: TStringField[3]
      FieldKind = fkData
      FieldName = 'UNIDADE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoGRUPO: TStringField[4]
      FieldKind = fkData
      FieldName = 'GRUPO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoFORNECEDOR: TStringField[5]
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoPRECOCUSTO: TFMTBCDField[6]
      FieldKind = fkData
      FieldName = 'PRECOCUSTO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
      Size = 2
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 149
  end
end
