inherited frmPrevProdutoGrupo: TfrmPrevProdutoGrupo
  Top = 71
  Caption = 'frmPrevProdutoGrupo'
  ClientHeight = 479
  ClientWidth = 935
  OldCreateOrder = True
  ExplicitWidth = 951
  ExplicitHeight = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    Width = 1123
    Height = 794
    PageSetup.Orientation = poLandscape
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited rbTitulo: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      inherited lbTitulo: TRLLabel
        Top = 76
        Width = 1045
        Height = 31
        ExplicitTop = 76
        ExplicitWidth = 1045
        ExplicitHeight = 31
      end
      inherited rlmCabecalho: TRLMemo
        Width = 947
        Height = 75
        ExplicitWidth = 947
        ExplicitHeight = 75
      end
      inherited imgLogo: TRLImage
        Height = 75
        ExplicitHeight = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 169
      Width = 1047
      ExplicitTop = 169
      ExplicitWidth = 1047
      inherited sysData: TRLSystemInfo
        Left = 935
        ExplicitLeft = 935
      end
      inherited sysPage: TRLSystemInfo
        Left = 871
        ExplicitLeft = 871
      end
    end
    object rlbColunas: TRLBand
      Left = 38
      Top = 136
      Width = 1047
      Height = 17
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodBarra: TRLLabel
        Left = 5
        Top = 0
        Width = 72
        Height = 16
        Caption = 'Cod. Barra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbProduto: TRLLabel
        Left = 104
        Top = 0
        Width = 56
        Height = 16
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFornecedor: TRLLabel
        Left = 507
        Top = 0
        Width = 77
        Height = 16
        Caption = 'Fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbCusto: TRLLabel
        Left = 768
        Top = 0
        Width = 82
        Height = 16
        Caption = 'Pre'#231'o Custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbLucro: TRLLabel
        Left = 861
        Top = 0
        Width = 40
        Height = 16
        Caption = 'Lucro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPreco: TRLLabel
        Left = 936
        Top = 0
        Width = 41
        Height = 16
        Caption = 'Pre'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEstoque: TRLLabel
        Left = 989
        Top = 0
        Width = 56
        Height = 16
        Caption = 'Estoque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 153
      Width = 1047
      Height = 16
      BeforePrint = rlbDetalheBeforePrint
      object rldbCodbarra: TRLDBText
        Left = 5
        Top = 0
        Width = 97
        Height = 16
        AutoSize = False
        DataField = 'CODBARRA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbProduto: TRLDBText
        Left = 104
        Top = 0
        Width = 393
        Height = 16
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbForn: TRLDBText
        Left = 507
        Top = 0
        Width = 249
        Height = 16
        AutoSize = False
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbCusto: TRLDBText
        Left = 805
        Top = 0
        Width = 45
        Height = 16
        Alignment = taRightJustify
        DataField = 'CUSTO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbLucro: TRLDBText
        Left = 858
        Top = 0
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'LUCRO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbPreco: TRLDBText
        Left = 934
        Top = 0
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRECO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbEstoque: TRLDBText
        Left = 985
        Top = 0
        Width = 60
        Height = 16
        Alignment = taRightJustify
        DataField = 'ESTOQUE'
        DataSource = dsPadrao
        Text = ''
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODBARRA,'#13#10'  DESCRICAO,'#13#10'  FORNECEDOR,'#13#10'  CODGRUPO,'#13#10 +
      '  GRUPO,'#13#10'  CUSTO,'#13#10'  LUCRO,'#13#10'  PRECO,'#13#10'  ESTOQUE,'#13#10'  VALORESTOQ' +
      'UE'#13#10'from VIEWRELPRODUTOS'#13#10'where CODGRUPO = :CODIGO'#13#10'order by DES' +
      'CRICAO'
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object sqldPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
    object sqldPadraoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object sqldPadraoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 80
    end
    object sqldPadraoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
    end
    object sqldPadraoLUCRO: TFMTBCDField
      FieldName = 'LUCRO'
      Precision = 15
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
    object sqldPadraoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
    end
    object sqldPadraoVALORESTOQUE: TFloatField
      FieldName = 'VALORESTOQUE'
    end
  end
  inherited cdsPadrao: TMemDataset
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object cdsPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
    object cdsPadraoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object cdsPadraoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 80
    end
    object cdsPadraoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoLUCRO: TFMTBCDField
      FieldName = 'LUCRO'
      DisplayFormat = '####0'
      Precision = 15
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      DisplayFormat = '####0'
    end
    object cdsPadraoVALORESTOQUE: TFloatField
      FieldName = 'VALORESTOQUE'
      DisplayFormat = '#,##0.00'
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
