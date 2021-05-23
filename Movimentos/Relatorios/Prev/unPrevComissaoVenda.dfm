inherited frmPrevComissaoVenda: TfrmPrevComissaoVenda
  Top = 21
  Caption = 'frmPrevComissaoVenda'
  ClientHeight = 516
  ClientWidth = 817
  OldCreateOrder = True
  ExplicitWidth = 833
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbRodape: TRLBand
      Top = 248
      ExplicitTop = 248
    end
    object rlbCabecalhoColuna: TRLBand
      Left = 38
      Top = 136
      Width = 718
      Height = 55
      BandType = btTitle
      Color = clSilver
      ParentColor = False
      Transparent = False
      object rlblVendedor: TRLLabel
        Left = 8
        Top = 8
        Width = 72
        Height = 16
        Caption = 'Vendedor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlblPeriodo: TRLLabel
        Left = 8
        Top = 32
        Width = 58
        Height = 16
        Caption = 'Per'#237'odo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlblDataVendedor: TRLLabel
        Left = 88
        Top = 8
        Width = 103
        Height = 16
        Transparent = False
      end
      object rlblDataPeriodo: TRLLabel
        Left = 72
        Top = 32
        Width = 91
        Height = 16
        Transparent = False
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 209
      Width = 718
      Height = 19
      BeforePrint = rlbDetalheBeforePrint
      object rldbtProduto: TRLDBText
        Left = 8
        Top = 1
        Width = 449
        Height = 16
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtQtde: TRLDBText
        Left = 494
        Top = 1
        Width = 29
        Height = 16
        Alignment = taRightJustify
        DataField = 'QTD'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtTotal: TRLDBText
        Left = 561
        Top = 1
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbtComissao: TRLDBText
        Left = 644
        Top = 1
        Width = 68
        Height = 16
        Alignment = taRightJustify
        DataField = 'COMISSAO'
        DataSource = dsPadrao
        Text = ''
      end
    end
    object rlbSumario: TRLBand
      Left = 38
      Top = 228
      Width = 718
      Height = 20
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rlblTotalFinal: TRLLabel
        Left = 654
        Top = 2
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = '<Total>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbColuna: TRLBand
      Left = 38
      Top = 191
      Width = 718
      Height = 18
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlblProduto: TRLLabel
        Left = 8
        Top = 1
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
      object rlblQtde: TRLLabel
        Left = 488
        Top = 1
        Width = 35
        Height = 16
        Caption = 'Qtde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblTotal: TRLLabel
        Left = 568
        Top = 1
        Width = 36
        Height = 16
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblComissao: TRLLabel
        Left = 648
        Top = 1
        Width = 64
        Height = 16
        Caption = 'Comiss'#227'o'
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
    CommandText = 'select * from'#13#10'STPVENDACOMISSAO(:IDVEND, :DATAINI, :DATAFIM)'
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVEND'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    object sqldPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object sqldPadraoQTD: TIntegerField
      FieldName = 'QTD'
    end
    object sqldPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object sqldPadraoCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 15
      Size = 2
    end
  end
  inherited cdsPadrao: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVEND'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    object cdsPadraoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdsPadraoQTD: TIntegerField
      FieldName = 'QTD'
    end
    object cdsPadraoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsPadraoCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
  end
end
