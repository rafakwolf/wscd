inherited frmPrevContasClientes: TfrmPrevContasClientes
  Height = 626
  Width = 811
  Caption = 'frmPrevContasClientes'
  ClientHeight = 626
  ClientWidth = 811
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 31
        Top = 76
      end
      inherited rlmCabecalho: TRLMemo
        Height = 75
      end
      inherited imgLogo: TRLImage
        Height = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 167
    end
    object rlbColunas: TRLBand[2]
      Left = 38
      Height = 16
      Top = 102
      Width = 718
      BeforePrint = rlbColunasBeforePrint
      object rldbData: TRLDBText
        Left = 4
        Height = 16
        Top = 0
        Width = 89
        AutoSize = False
        DataField = 'DATA'
        DataSource = dsPadrao
      end
      object rldbvenc: TRLDBText
        Left = 98
        Height = 16
        Top = 0
        Width = 81
        AutoSize = False
        DataField = 'VENCIMENTO'
        DataSource = dsPadrao
      end
      object rldbCapital: TRLDBText
        Left = 288
        Height = 15
        Top = 0
        Width = 56
        Alignment = taRightJustify
        DataField = 'CAPITAL'
        DataSource = dsPadrao
      end
      object rldbTotal: TRLDBText
        Left = 430
        Height = 15
        Top = 0
        Width = 44
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = dsPadrao
      end
    end
    object rlbDetalhe: TRLBand[3]
      Left = 38
      Height = 16
      Top = 86
      Width = 718
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbDatalanc: TRLLabel
        Left = 4
        Height = 16
        Top = 0
        Width = 35
        Caption = 'Data'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbvenc: TRLLabel
        Left = 98
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
      object lbCapital: TRLLabel
        Left = 245
        Height = 16
        Top = 0
        Width = 99
        Caption = 'Valor da conta'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotal: TRLLabel
        Left = 399
        Height = 16
        Top = 0
        Width = 75
        Caption = 'Valor atual'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbSumario: TRLBand[4]
      Left = 38
      Height = 49
      Top = 118
      Width = 718
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllbVencer: TRLLabel
        Left = 650
        Height = 16
        Top = 0
        Width = 63
        Alignment = taRightJustify
        Caption = 'A vencer'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbVenvidas: TRLLabel
        Left = 650
        Height = 16
        Top = 16
        Width = 63
        Alignment = taRightJustify
        Caption = 'Venvidas'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbVencendoHoje: TRLLabel
        Left = 613
        Height = 16
        Top = 32
        Width = 100
        Alignment = taRightJustify
        Caption = 'Vencendo hoje'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited dsPadrao: TDataSource
    Left = 240
    Top = 248
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 72
    Top = 248
  end
  inherited sqldPadrao: TZQuery
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from VIEWRELNPCR'
    )
    Top = 248
    object sqldPadraoCODIGO: TZIntegerField[0]
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDATA: TZDateField[1]
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVENCIMENTO: TZDateField[2]
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCODCLIENTE: TZIntegerField[3]
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCLIENTE: TZRawStringField[4]
      FieldKind = fkData
      FieldName = 'CLIENTE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldPadraoCAPITAL: TZBCDField[5]
      FieldKind = fkData
      FieldName = 'CAPITAL'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldPadraoTOTAL: TZBCDField[6]
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
  end
end
