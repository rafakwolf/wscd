inherited frmPrevRelCRAtrasadas: TfrmPrevRelCRAtrasadas
  Top = 84
  Caption = 'frmPrevRelCRAtrasadas'
  ClientHeight = 469
  ClientWidth = 808
  OldCreateOrder = True
  ExplicitWidth = 824
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Top = 81
        Height = 26
        Caption = 'Contas a Receber Atrasadas por Cliente'
        ExplicitTop = 81
        ExplicitHeight = 26
      end
      inherited rlmCabecalho: TRLMemo
        Height = 80
        ExplicitHeight = 80
      end
      inherited imgLogo: TRLImage
        Height = 80
        ExplicitHeight = 80
      end
    end
    inherited rbRodape: TRLBand
      Top = 190
      ExplicitTop = 190
    end
    object rbColunas: TRLBand
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
      Borders.Width = 2
      object lbVencimento: TRLLabel
        Left = 8
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
      object lbCliente: TRLLabel
        Left = 104
        Top = 0
        Width = 48
        Height = 16
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCapital: TRLLabel
        Left = 424
        Top = 0
        Width = 48
        Height = 16
        Caption = 'Capital'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbAtraso: TRLLabel
        Left = 536
        Top = 0
        Width = 49
        Height = 16
        Caption = 'Atraso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotal: TRLLabel
        Left = 672
        Top = 0
        Width = 36
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rbDetalhe: TRLBand
      Left = 38
      Top = 154
      Width = 718
      Height = 17
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rbDetalheBeforePrint
      object dbVencimento: TRLDBText
        Left = 8
        Top = 0
        Width = 81
        Height = 16
        DataField = 'VENCIMENTO'
        DataSource = dsPadrao
        Text = ''
      end
      object dbCliente: TRLDBText
        Left = 104
        Top = 0
        Width = 289
        Height = 16
        AutoSize = False
        DataField = 'CLIENTE'
        DataSource = dsPadrao
        Text = ''
      end
      object dbCapital: TRLDBText
        Left = 419
        Top = 0
        Width = 53
        Height = 16
        Alignment = taRightJustify
        DataField = 'CAPITAL'
        DataSource = dsPadrao
        Text = ''
      end
      object dbAtraso: TRLDBText
        Left = 504
        Top = 0
        Width = 81
        Height = 16
        Alignment = taRightJustify
        DataField = 'DIASATRASO'
        DataSource = dsPadrao
        Text = ''
      end
      object dbTotal: TRLDBText
        Left = 665
        Top = 0
        Width = 43
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL'
        DataSource = dsPadrao
        Text = ''
      end
    end
    object rbSumario: TRLBand
      Left = 38
      Top = 171
      Width = 718
      Height = 19
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.Width = 2
      object rllbTotal: TRLLabel
        Left = 650
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
  end
  inherited sqldPadrao: TSQLDataSet
    CommandText = 
      'select * from VIEWRELCRATRASADOS'#13#10'where CODCLIENTE = :PCLIENTE'#13#10 +
      'order by VENCIMENTO'
    Params = <
      item
        DataType = ftString
        Name = 'PCLIENTE'
        ParamType = ptInput
      end>
    object sqldPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
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
    object sqldPadraoDIASATRASO: TIntegerField
      FieldName = 'DIASATRASO'
    end
    object sqldPadraoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  inherited cdsPadrao: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'PCLIENTE'
        ParamType = ptInput
      end>
    object cdsPadraoCODIGO: TIntegerField
      FieldName = 'CODIGO'
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
    object cdsPadraoDIASATRASO: TIntegerField
      FieldName = 'DIASATRASO'
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
