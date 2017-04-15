inherited frmPrevContasClientes: TfrmPrevContasClientes
  Caption = 'frmPrevContasClientes'
  ClientHeight = 463
  ClientWidth = 800
  OldCreateOrder = True
  ExplicitWidth = 816
  ExplicitHeight = 502
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
      Top = 220
      ExplicitTop = 220
    end
    object rlbColunas: TRLBand
      Left = 38
      Top = 155
      Width = 718
      Height = 16
      BeforePrint = rlbColunasBeforePrint
      object rldbData: TRLDBText
        Left = 4
        Top = 0
        Width = 89
        Height = 16
        AutoSize = False
        DataField = 'DATA'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbvenc: TRLDBText
        Left = 98
        Top = 0
        Width = 81
        Height = 16
        AutoSize = False
        DataField = 'VENCIMENTO'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbCapital: TRLDBText
        Left = 291
        Top = 0
        Width = 53
        Height = 16
        Alignment = taRightJustify
        DataField = 'CAPITAL'
        DataSource = dsPadrao
        Text = ''
      end
      object rldbTotal: TRLDBText
        Left = 431
        Top = 0
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = dsPadrao
        Text = ''
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbDatalanc: TRLLabel
        Left = 4
        Top = 0
        Width = 35
        Height = 16
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbvenc: TRLLabel
        Left = 98
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
      object lbCapital: TRLLabel
        Left = 245
        Top = 0
        Width = 99
        Height = 16
        Caption = 'Valor da conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotal: TRLLabel
        Left = 399
        Top = 0
        Width = 75
        Height = 16
        Caption = 'Valor atual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbSumario: TRLBand
      Left = 38
      Top = 171
      Width = 718
      Height = 49
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllbVencer: TRLLabel
        Left = 650
        Top = 0
        Width = 63
        Height = 16
        Alignment = taRightJustify
        Caption = 'A vencer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbVenvidas: TRLLabel
        Left = 650
        Top = 16
        Width = 63
        Height = 16
        Alignment = taRightJustify
        Caption = 'Venvidas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbVencendoHoje: TRLLabel
        Left = 613
        Top = 32
        Width = 100
        Height = 16
        Alignment = taRightJustify
        Caption = 'Vencendo hoje'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 'select * from VIEWRELNPCR'#13#10'order by VENCIMENTO'
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sqldPadraoDATA: TDateField
      FieldName = 'DATA'
    end
    object sqldPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object sqldPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sqldPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object sqldPadraoCAPITAL: TFMTBCDField
      FieldName = 'CAPITAL'
      Precision = 15
    end
    object sqldPadraoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  inherited cdsPadrao: TClientDataSet
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsPadraoDATA: TDateField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsPadraoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
    object cdsPadraoCAPITAL: TFMTBCDField
      FieldName = 'CAPITAL'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
    object cdsPadraoTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
