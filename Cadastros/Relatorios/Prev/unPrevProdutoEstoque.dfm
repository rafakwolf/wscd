inherited frmPrevProdutoEstoque: TfrmPrevProdutoEstoque
  Left = 271
  Top = 85
  Width = 915
  Caption = 'frmPrevProdutoEstoque'
  ClientHeight = 488
  ClientWidth = 915
  inherited rrPadrao: TRLReport
    Left = 8
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
      Top = 118
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
      Height = 16
      Top = 86
      Width = 1047
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodBarra: TRLLabel
        Left = 8
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
      object lbProdutoNome: TRLLabel
        Left = 152
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
        Left = 488
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
      object lbEstoque: TRLLabel
        Left = 987
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
        Transparent = False
      end
    end
    object rlbDetalhe: TRLBand[3]
      Left = 38
      Height = 16
      Top = 102
      Width = 1047
      BeforePrint = rlbDetalheBeforePrint
      object rldbCodbarras: TRLDBText
        Left = 8
        Height = 15
        Top = 0
        Width = 83
        DataField = 'COD_BARRA'
        DataSource = dsPadrao
      end
      object rldbProdutoNome: TRLDBText
        Left = 152
        Height = 16
        Top = 0
        Width = 329
        AutoSize = False
        DataField = 'PRO_DESCRICAO'
        DataSource = dsPadrao
      end
      object rldbFornecedor: TRLDBText
        Left = 488
        Height = 16
        Top = 0
        Width = 457
        AutoSize = False
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
      end
      object rldbEstoque: TRLDBText
        Left = 940
        Height = 15
        Top = 0
        Width = 103
        Alignment = taRightJustify
        DataField = 'PRO_ESTOQUE'
        DataSource = dsPadrao
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    Params = <    
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptInput
      end>
    object sqldPadraoCOD_BARRA: TStringField[0]
      FieldKind = fkData
      FieldName = 'COD_BARRA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object sqldPadraoPRO_DESCRICAO: TStringField[1]
      FieldKind = fkData
      FieldName = 'PRO_DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoPRO_ESTOQUE: TIntegerField[2]
      FieldKind = fkData
      FieldName = 'PRO_ESTOQUE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoQTDE_MINIMA: TIntegerField[3]
      FieldKind = fkData
      FieldName = 'QTDE_MINIMA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCODFORNECEDOR: TIntegerField[4]
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFORNECEDOR: TStringField[5]
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoCOD_BARRA: TStringField[0]
      FieldKind = fkData
      FieldName = 'COD_BARRA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object cdsPadraoPRO_DESCRICAO: TStringField[1]
      FieldKind = fkData
      FieldName = 'PRO_DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoPRO_ESTOQUE: TIntegerField[2]
      FieldKind = fkData
      FieldName = 'PRO_ESTOQUE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoQTDE_MINIMA: TIntegerField[3]
      FieldKind = fkData
      FieldName = 'QTDE_MINIMA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoCODFORNECEDOR: TIntegerField[4]
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoFORNECEDOR: TStringField[5]
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 149
  end
end
