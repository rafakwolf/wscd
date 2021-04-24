inherited frmRelatorioProdutosEstoque: TfrmRelatorioProdutosEstoque
  Caption = 'frmRelatorioProdutosEstoque'
  ClientHeight = 517
  ClientWidth = 885
  OldCreateOrder = True
  ExplicitTop = -41
  ExplicitWidth = 901
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    Left = 8
    Width = 1123
    Height = 794
    PageSetup.Orientation = poLandscape
    ExplicitLeft = 8
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited rbTitulo: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      inherited lbTitulo: TRLLabel
        Width = 1045
        ExplicitWidth = 1045
      end
      inherited rlmCabecalho: TRLMemo
        Width = 933
        Height = 74
        ExplicitWidth = 933
        ExplicitHeight = 74
      end
    end
    inherited rbRodape: TRLBand
      Top = 171
      Width = 1047
      ExplicitTop = 171
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
      Top = 139
      Width = 1047
      Height = 16
      BandType = btColumnHeader
      object lbCodBarra: TRLLabel
        Left = 8
        Top = 0
        Width = 79
        Height = 16
        Caption = 'Cod. Barras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbProdutoNome: TRLLabel
        Left = 152
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
        Left = 488
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
      end
      object lbEstoque: TRLLabel
        Left = 960
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
        Transparent = False
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 155
      Width = 1047
      Height = 16
      object rldbCodbarras: TRLDBText
        Left = 8
        Top = 0
        Width = 75
        Height = 16
        DataField = 'COD_BARRA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbProdutoNome: TRLDBText
        Left = 152
        Top = 0
        Width = 103
        Height = 16
        DataField = 'PRO_DESCRICAO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbFornecedor: TRLDBText
        Left = 488
        Top = 0
        Width = 83
        Height = 16
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbEstoque: TRLDBText
        Left = 960
        Top = 0
        Width = 91
        Height = 16
        DataField = 'PRO_ESTOQUE'
        DataSource = dsPadrao
        Text = ''
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    CommandText = 
      'select '#13#10'  COD_BARRA,'#13#10'  PRO_DESCRICAO,'#13#10'  PRO_ESTOQUE,'#13#10'  QTDE_' +
      'MINIMA,'#13#10'  CODFORNECEDOR,'#13#10'  FORNECEDOR '#13#10'from VIEWPRODUTOSMINIM' +
      'OS'#13#10'where CODFORNECEDOR = :COD'
    Params = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptInput
      end>
  end
  inherited cdsPadrao: TMemDataset
    Params = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptInput
      end>
    object cdsPadraoCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      FixedChar = True
      Size = 13
    end
    object cdsPadraoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 50
    end
    object cdsPadraoPRO_ESTOQUE: TFloatField
      FieldName = 'PRO_ESTOQUE'
    end
    object cdsPadraoQTDE_MINIMA: TFloatField
      FieldName = 'QTDE_MINIMA'
    end
    object cdsPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object cdsPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 40
    end
  end
end
