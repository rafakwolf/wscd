inherited frmPrevProdutoGrupo: TfrmPrevProdutoGrupo
  Left = 325
  Top = 117
  Width = 911
  Caption = 'frmPrevProdutoGrupo'
  ClientHeight = 488
  ClientWidth = 911
  inherited rrPadrao: TRLReport
    Height = 794
    Width = 1123
    PageSetup.Orientation = poLandscape
    inherited rbTitulo: TRLBand
      Width = 1047
      inherited lbTitulo: TRLLabel
        Height = 31
        Top = 76
        Width = 1045
      end
      inherited rlmCabecalho: TRLMemo
        Height = 75
        Width = 947
      end
      inherited imgLogo: TRLImage
        Height = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 119
      Width = 1047
      inherited sysData: TRLSystemInfo
        Left = 935
      end
      inherited sysPage: TRLSystemInfo
        Left = 871
      end
    end
    object rlbColunas: TRLBand[2]
      Left = 38
      Height = 17
      Top = 86
      Width = 1047
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodBarra: TRLLabel
        Left = 5
        Height = 16
        Top = 0
        Width = 72
        Caption = 'Cod. Barra'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbProduto: TRLLabel
        Left = 104
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
      object lbFornecedor: TRLLabel
        Left = 507
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
        Transparent = False
      end
      object lbCusto: TRLLabel
        Left = 768
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
      object lbLucro: TRLLabel
        Left = 861
        Height = 16
        Top = 0
        Width = 40
        Caption = 'Lucro'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPreco: TRLLabel
        Left = 936
        Height = 16
        Top = 0
        Width = 41
        Caption = 'Preço'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEstoque: TRLLabel
        Left = 989
        Height = 16
        Top = 0
        Width = 56
        Caption = 'Estoque'
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
      Width = 1047
      BeforePrint = rlbDetalheBeforePrint
      object rldbCodbarra: TRLDBText
        Left = 5
        Height = 16
        Top = 0
        Width = 97
        AutoSize = False
        DataField = 'CODBARRA'
        DataSource = dsPadrao
      end
      object rldbProduto: TRLDBText
        Left = 104
        Height = 16
        Top = 0
        Width = 393
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
      end
      object rldbForn: TRLDBText
        Left = 507
        Height = 16
        Top = 0
        Width = 249
        AutoSize = False
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
      end
      object rldbCusto: TRLDBText
        Left = 801
        Height = 15
        Top = 0
        Width = 49
        Alignment = taRightJustify
        DataField = 'CUSTO'
        DataSource = dsPadrao
      end
      object rldbLucro: TRLDBText
        Left = 853
        Height = 15
        Top = 0
        Width = 48
        Alignment = taRightJustify
        DataField = 'LUCRO'
        DataSource = dsPadrao
      end
      object rldbPreco: TRLDBText
        Left = 927
        Height = 15
        Top = 0
        Width = 50
        Alignment = taRightJustify
        DataField = 'PRECO'
        DataSource = dsPadrao
      end
      object rldbEstoque: TRLDBText
        Left = 977
        Height = 15
        Top = 0
        Width = 68
        Alignment = taRightJustify
        DataField = 'ESTOQUE'
        DataSource = dsPadrao
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    Params = <    
      item
        DataType = ftInteger
        Name = 'CODIGO'
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
    object sqldPadraoDESCRICAO: TStringField[1]
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoFORNECEDOR: TStringField[2]
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCODGRUPO: TIntegerField[3]
      FieldKind = fkData
      FieldName = 'CODGRUPO'
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
      Size = 80
    end
    object sqldPadraoCUSTO: TFMTBCDField[5]
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoLUCRO: TFMTBCDField[6]
      FieldKind = fkData
      FieldName = 'LUCRO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoPRECO: TFMTBCDField[7]
      FieldKind = fkData
      FieldName = 'PRECO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoESTOQUE: TIntegerField[8]
      FieldKind = fkData
      FieldName = 'ESTOQUE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALORESTOQUE: TFloatField[9]
      FieldKind = fkData
      FieldName = 'VALORESTOQUE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
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
    object cdsPadraoDESCRICAO: TStringField[1]
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoFORNECEDOR: TStringField[2]
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCODGRUPO: TIntegerField[3]
      FieldKind = fkData
      FieldName = 'CODGRUPO'
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
      Size = 80
    end
    object cdsPadraoCUSTO: TFMTBCDField[5]
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoLUCRO: TFMTBCDField[6]
      FieldKind = fkData
      FieldName = 'LUCRO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '####0'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoPRECO: TFMTBCDField[7]
      FieldKind = fkData
      FieldName = 'PRECO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoESTOQUE: TIntegerField[8]
      FieldKind = fkData
      FieldName = 'ESTOQUE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '####0'
    end
    object cdsPadraoVALORESTOQUE: TFloatField[9]
      FieldKind = fkData
      FieldName = 'VALORESTOQUE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
