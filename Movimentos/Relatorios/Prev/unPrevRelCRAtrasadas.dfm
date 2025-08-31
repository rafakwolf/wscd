inherited frmPrevRelCRAtrasadas: TfrmPrevRelCRAtrasadas
  Top = 84
  Caption = 'frmPrevRelCRAtrasadas'
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 26
        Top = 81
        Caption = 'Contas a Receber Atrasadas por Cliente'
      end
      inherited rlmCabecalho: TRLMemo
        Height = 80
      end
      inherited imgLogo: TRLImage
        Height = 80
      end
    end
    inherited rbRodape: TRLBand
      Top = 140
    end
    object rbColunas: TRLBand[2]
      Left = 38
      Height = 18
      Top = 86
      Width = 718
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Width = 2
      object lbVencimento: TRLLabel
        Left = 8
        Height = 16
        Top = 0
        Width = 80
        Caption = 'Vencimento'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCliente: TRLLabel
        Left = 104
        Height = 16
        Top = 0
        Width = 48
        Caption = 'Cliente'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCapital: TRLLabel
        Left = 424
        Height = 16
        Top = 0
        Width = 48
        Caption = 'Capital'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbAtraso: TRLLabel
        Left = 536
        Height = 16
        Top = 0
        Width = 49
        Caption = 'Atraso'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotal: TRLLabel
        Left = 672
        Height = 16
        Top = 0
        Width = 36
        Alignment = taRightJustify
        Caption = 'Total'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rbDetalhe: TRLBand[3]
      Left = 38
      Height = 17
      Top = 104
      Width = 718
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rbDetalheBeforePrint
      object dbVencimento: TRLDBText
        Left = 8
        Height = 15
        Top = 0
        Width = 90
        DataField = 'VENCIMENTO'
        DataSource = dsPadrao
      end
      object memdse: TRLDBText
        Left = 104
        Height = 16
        Top = 0
        Width = 289
        AutoSize = False
        DataField = 'CLIENTE'
        DataSource = dsPadrao
      end
      object dbCapital: TRLDBText
        Left = 416
        Height = 15
        Top = 0
        Width = 56
        Alignment = taRightJustify
        DataField = 'CAPITAL'
        DataSource = dsPadrao
      end
      object dbAtraso: TRLDBText
        Left = 499
        Height = 15
        Top = 0
        Width = 86
        Alignment = taRightJustify
        DataField = 'DIASATRASO'
        DataSource = dsPadrao
      end
      object dbTotal: TRLDBText
        Left = 664
        Height = 15
        Top = 0
        Width = 44
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = dsPadrao
      end
    end
    object rbSumario: TRLBand[4]
      Left = 38
      Height = 19
      Top = 121
      Width = 718
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.Width = 2
      object rllbTotal: TRLLabel
        Left = 650
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
  end
  inherited sqldPadrao: TSQLQuery
    Params = <    
      item
        DataType = ftString
        Name = 'PCLIENTE'
        ParamType = ptInput
      end>
    object sqldPadraoCODIGO: TIntegerField[0]
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVENCIMENTO: TDateField[1]
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCODCLIENTE: TIntegerField[2]
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCLIENTE: TStringField[3]
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCAPITAL: TFMTBCDField[4]
      FieldKind = fkData
      FieldName = 'CAPITAL'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoDIASATRASO: TIntegerField[5]
      FieldKind = fkData
      FieldName = 'DIASATRASO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoTOTAL: TFloatField[6]
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
