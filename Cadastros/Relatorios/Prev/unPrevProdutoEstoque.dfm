inherited frmPrevProdutoEstoque: TfrmPrevProdutoEstoque
  Left = 2
  Top = 3
  Caption = 'frmPrevProdutoEstoque'
  ClientHeight = 530
  ClientWidth = 924
  OldCreateOrder = True
  ExplicitWidth = 940
  ExplicitHeight = 568
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
      Top = 168
      Width = 1047
      ExplicitTop = 168
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
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
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
        Left = 987
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
      Top = 152
      Width = 1047
      Height = 16
      BeforePrint = rlbDetalheBeforePrint
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
        Width = 329
        Height = 16
        AutoSize = False
        DataField = 'PRO_DESCRICAO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbFornecedor: TRLDBText
        Left = 488
        Top = 0
        Width = 457
        Height = 16
        AutoSize = False
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbEstoque: TRLDBText
        Left = 952
        Top = 0
        Width = 91
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRO_ESTOQUE'
        DataSource = dsPadrao
        Text = ''
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
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
    object sqldPadraoCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 13
    end
    object sqldPadraoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 80
    end
    object sqldPadraoPRO_ESTOQUE: TIntegerField
      FieldName = 'PRO_ESTOQUE'
    end
    object sqldPadraoQTDE_MINIMA: TIntegerField
      FieldName = 'QTDE_MINIMA'
    end
    object sqldPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object sqldPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
  end
  inherited cdsPadrao: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptInput
      end>
    object cdsPadraoCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 13
    end
    object cdsPadraoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 80
    end
    object cdsPadraoPRO_ESTOQUE: TIntegerField
      FieldName = 'PRO_ESTOQUE'
    end
    object cdsPadraoQTDE_MINIMA: TIntegerField
      FieldName = 'QTDE_MINIMA'
    end
    object cdsPadraoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object cdsPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 80
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 149
  end
end
