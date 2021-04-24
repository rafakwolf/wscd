inherited frmPrevPromocao: TfrmPrevPromocao
  Top = 15
  Caption = 'frmPrevPromocao'
  ClientHeight = 521
  ClientWidth = 834
  OldCreateOrder = True
  ExplicitWidth = 850
  ExplicitHeight = 559
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
      Top = 189
      ExplicitTop = 189
    end
    object rlbndCabecalho: TRLBand
      Left = 38
      Top = 136
      Width = 718
      Height = 18
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rllbProduto: TRLLabel
        Left = 2
        Top = 1
        Width = 48
        Height = 16
        Caption = 'Produto'
      end
      object rllbPrecoNormal: TRLLabel
        Left = 312
        Top = 1
        Width = 80
        Height = 16
        Caption = 'Pre'#231'o normal'
      end
      object rllbDesconto: TRLLabel
        Left = 400
        Top = 1
        Width = 82
        Height = 16
        Caption = 'Desconto (%)'
      end
      object rllbprecoPromocao: TRLLabel
        Left = 496
        Top = 1
        Width = 61
        Height = 16
        Caption = 'Promo'#231#227'o'
      end
      object rllbInicio: TRLLabel
        Left = 576
        Top = 1
        Width = 34
        Height = 16
        Caption = 'In'#237'cio'
      end
      object rllbFim: TRLLabel
        Left = 648
        Top = 1
        Width = 25
        Height = 16
        Caption = 'Fim'
      end
    end
    object rlbndDetalhes: TRLBand
      Left = 38
      Top = 154
      Width = 718
      Height = 16
      BeforePrint = rlbndDetalhesBeforePrint
      object rldbtProduto: TRLDBText
        Left = 2
        Top = 0
        Width = 303
        Height = 16
        AutoSize = False
        DataField = 'ABREVIACAO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtPrecoNorm: TRLDBText
        Left = 349
        Top = 0
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'VENDA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtDescto: TRLDBText
        Left = 413
        Top = 0
        Width = 69
        Height = 16
        Alignment = taRightJustify
        DataField = 'DESCONTO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtPrecoProm: TRLDBText
        Left = 514
        Top = 0
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRECO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtInicio: TRLDBText
        Left = 576
        Top = 0
        Width = 41
        Height = 16
        DataField = 'INICIO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtFim: TRLDBText
        Left = 648
        Top = 0
        Width = 25
        Height = 16
        DataField = 'FIM'
        DataSource = dsPadrao
        Text = ''
      end
    end
    object rlbndSumario: TRLBand
      Left = 38
      Top = 170
      Width = 718
      Height = 19
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllbSoma: TRLLabel
        Left = 656
        Top = 2
        Width = 59
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
  inherited sqldPadrao: TSQLQuery
    CommandText = 
      'select '#13#10'  p.CODIGO, '#13#10'  p.PRODUTO, '#13#10'  pro.ABREVIACAO,'#13#10'  pro.V' +
      'ENDA,'#13#10'  p.DESCONTO,'#13#10'  p.PRECO, '#13#10'  p.INICIO, '#13#10'  p.FIM '#13#10'from ' +
      'PROMOCAO p'#13#10'left join PRODUTOS pro on (pro.IDPRODUTO = p.PRODUTO' +
      ')'
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqldPadraoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object sqldPadraoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object sqldPadraoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
    object sqldPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
    object sqldPadraoINICIO: TDateField
      FieldName = 'INICIO'
    end
    object sqldPadraoFIM: TDateField
      FieldName = 'FIM'
    end
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPadraoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdsPadraoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object cdsPadraoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoINICIO: TDateField
      FieldName = 'INICIO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoFIM: TDateField
      FieldName = 'FIM'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 147
  end
end
