inherited frmRelatorioProdutosEstoque: TfrmRelatorioProdutosEstoque
  Left = 265
  Top = 110
  Width = 1000
  Caption = 'frmRelatorioProdutosEstoque'
  ClientHeight = 488
  ClientWidth = 1000
  inherited rrPadrao: TRLReport
    Left = 8
    Height = 794
    Width = 1123
    PageSetup.Orientation = poLandscape
    inherited rbTitulo: TRLBand
      Width = 1047
      inherited lbTitulo: TRLLabel
        Width = 1045
      end
      inherited rlmCabecalho: TRLMemo
        Height = 74
        Width = 933
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
        Left = 960
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
        Height = 15
        Top = 0
        Width = 116
        DataField = 'PRO_DESCRICAO'
        DataSource = dsPadrao
      end
      object rldbFornecedor: TRLDBText
        Left = 488
        Height = 15
        Top = 0
        Width = 95
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
      end
      object rldbEstoque: TRLDBText
        Left = 960
        Height = 15
        Top = 0
        Width = 103
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
      Size = 50
    end
    object cdsPadraoPRO_ESTOQUE: TFloatField[2]
      FieldKind = fkData
      FieldName = 'PRO_ESTOQUE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoQTDE_MINIMA: TFloatField[3]
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
      Size = 40
    end
  end
end
