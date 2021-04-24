inherited frmPrevComissaoVenda: TfrmPrevComissaoVenda
  Left = 352
  Top = 57
  Width = 812
  Caption = 'frmPrevComissaoVenda'
  ClientWidth = 812
  inherited rrPadrao: TRLReport
    inherited rbRodape: TRLBand
      Top = 198
    end
    object rlbCabecalhoColuna: TRLBand[2]
      Left = 38
      Height = 55
      Top = 86
      Width = 718
      BandType = btTitle
      Color = clSilver
      ParentColor = False
      Transparent = False
      object rlblVendedor: TRLLabel
        Left = 8
        Height = 16
        Top = 8
        Width = 72
        Caption = 'Vendedor:'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlblPeriodo: TRLLabel
        Left = 8
        Height = 16
        Top = 32
        Width = 58
        Caption = 'Período:'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlblDataVendedor: TRLLabel
        Left = 88
        Height = 15
        Top = 8
        Width = 102
        Transparent = False
      end
      object rlblDataPeriodo: TRLLabel
        Left = 72
        Height = 15
        Top = 32
        Width = 92
        Transparent = False
      end
    end
    object rlbDetalhe: TRLBand[3]
      Left = 38
      Height = 19
      Top = 159
      Width = 718
      BeforePrint = rlbDetalheBeforePrint
      object rldbtProduto: TRLDBText
        Left = 8
        Height = 16
        Top = 1
        Width = 449
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
      end
      object rldbtQtde: TRLDBText
        Left = 492
        Height = 15
        Top = 1
        Width = 31
        Alignment = taRightJustify
        DataField = 'QTD'
        DataSource = dsPadrao
      end
      object rldbtTotal: TRLDBText
        Left = 559
        Height = 15
        Top = 1
        Width = 45
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = dsPadrao
      end
      object rldbtComissao: TRLDBText
        Left = 637
        Height = 15
        Top = 1
        Width = 75
        Alignment = taRightJustify
        DataField = 'COMISSAO'
        DataSource = dsPadrao
      end
    end
    object rlbSumario: TRLBand[4]
      Left = 38
      Height = 20
      Top = 178
      Width = 718
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rlblTotalFinal: TRLLabel
        Left = 654
        Height = 16
        Top = 2
        Width = 58
        Alignment = taRightJustify
        Caption = '<Total>'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbColuna: TRLBand[5]
      Left = 38
      Height = 18
      Top = 141
      Width = 718
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rlblProduto: TRLLabel
        Left = 8
        Height = 16
        Top = 1
        Width = 56
        Caption = 'Produto'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblQtde: TRLLabel
        Left = 488
        Height = 16
        Top = 1
        Width = 35
        Caption = 'Qtde'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblTotal: TRLLabel
        Left = 568
        Height = 16
        Top = 1
        Width = 36
        Caption = 'Total'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblComissao: TRLLabel
        Left = 648
        Height = 16
        Top = 1
        Width = 64
        Caption = 'Comissão'
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
    object sqldPadraoCODPRODUTO: TIntegerField[0]
      FieldKind = fkData
      FieldName = 'CODPRODUTO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCRICAO: TStringField[1]
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 150
    end
    object sqldPadraoQTD: TIntegerField[2]
      FieldKind = fkData
      FieldName = 'QTD'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoTOTAL: TFMTBCDField[3]
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 3
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
    object sqldPadraoCOMISSAO: TFMTBCDField[4]
      FieldKind = fkData
      FieldName = 'COMISSAO'
      Index = 4
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
    object cdsPadraoCODPRODUTO: TIntegerField[0]
      FieldKind = fkData
      FieldName = 'CODPRODUTO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoDESCRICAO: TStringField[1]
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 150
    end
    object cdsPadraoQTD: TIntegerField[2]
      FieldKind = fkData
      FieldName = 'QTD'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoTOTAL: TFMTBCDField[3]
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
      Size = 2
    end
    object cdsPadraoCOMISSAO: TFMTBCDField[4]
      FieldKind = fkData
      FieldName = 'COMISSAO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
      Size = 2
    end
  end
end
