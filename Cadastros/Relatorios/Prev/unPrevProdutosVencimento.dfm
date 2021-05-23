inherited frmPrevProdutosVencimento: TfrmPrevProdutosVencimento
  Caption = 'frmPrevProdutosVencimento'
  ClientHeight = 482
  ClientWidth = 808
  OldCreateOrder = True
  ExplicitWidth = 824
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Top = 76
        Height = 31
        ExplicitTop = 76
        ExplicitHeight = 31
      end
      inherited rlmCabecalho: TRLMemo
        Height = 75
        ExplicitHeight = 75
      end
      inherited imgLogo: TRLImage
        Height = 75
        ExplicitHeight = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 202
      ExplicitTop = 202
    end
    object rlbColunas: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 17
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodigo: TRLLabel
        Left = 3
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
      object lbProduto: TRLLabel
        Left = 112
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
      object lbDataVenc: TRLLabel
        Left = 552
        Top = 0
        Width = 80
        Height = 16
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbForn: TRLLabel
        Left = 339
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
      object lbCusto: TRLLabel
        Left = 635
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
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 156
      Width = 718
      Height = 16
      BeforePrint = rlbDetalheBeforePrint
      object rldbCodbarra: TRLDBText
        Left = 3
        Top = 0
        Width = 108
        Height = 16
        AutoSize = False
        DataField = 'CODBARRA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbProduto: TRLDBText
        Left = 112
        Top = 0
        Width = 225
        Height = 16
        AutoSize = False
        DataField = 'PRODUTO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbForn: TRLDBText
        Left = 339
        Top = 0
        Width = 209
        Height = 16
        AutoSize = False
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbDataVenc: TRLDBText
        Left = 552
        Top = 0
        Width = 113
        Height = 16
        DataField = 'DATAVENCIMENTO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbCusto: TRLDBText
        Left = 633
        Top = 0
        Width = 84
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRECOCUSTO'
        DataSource = dsPadrao
        Text = ''
      end
    end
    object rlbndSomatorio: TRLBand
      Left = 38
      Top = 172
      Width = 718
      Height = 30
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllbSomaCusto: TRLLabel
        Left = 615
        Top = 8
        Width = 96
        Height = 16
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select * from '#13#10'  STPPRODUTOSVENCIDOS(:DATA, :UNIDADE, :GRUPO, :' +
      'FORN)'
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
    object sqldPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldPadraoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 50
    end
    object sqldPadraoDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
    end
    object sqldPadraoUNIDADE: TStringField
      FieldName = 'UNIDADE'
    end
    object sqldPadraoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 50
    end
    object sqldPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 50
    end
    object sqldPadraoPRECOCUSTO: TFMTBCDField
      FieldName = 'PRECOCUSTO'
      Precision = 15
      Size = 2
    end
  end
  inherited cdsPadrao: TClientDataSet
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
    object cdsPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsPadraoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 50
    end
    object cdsPadraoDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoUNIDADE: TStringField
      FieldName = 'UNIDADE'
    end
    object cdsPadraoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 50
    end
    object cdsPadraoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 50
    end
    object cdsPadraoPRECOCUSTO: TFMTBCDField
      FieldName = 'PRECOCUSTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 149
  end
end
