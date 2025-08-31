inherited frmPrevContasPagar: TfrmPrevContasPagar
  Caption = 'frmPrevContasPagar'
  inherited rrPadrao: TRLReport
    inherited rbRodape: TRLBand
      Top = 137
    end
    object rlbTitulo: TRLBand[2]
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
      object lbData: TRLLabel
        Left = 8
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
        Left = 112
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
      object lbFornecedor: TRLLabel
        Left = 232
        Height = 16
        Top = 0
        Width = 77
        Caption = 'Fornecedor'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDocumento: TRLLabel
        Left = 528
        Height = 16
        Top = 0
        Width = 77
        Caption = 'Documento'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbvalor: TRLLabel
        Left = 664
        Height = 16
        Top = 0
        Width = 38
        Caption = 'Valor'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbDetalhe: TRLBand[3]
      Left = 38
      Height = 16
      Top = 102
      Width = 718
      BeforePrint = rlbDetalheBeforePrint
      object rldbData: TRLDBText
        Left = 8
        Height = 15
        Top = 0
        Width = 36
        DataField = 'DATA'
        DataSource = dsPadrao
      end
      object rldbvenc: TRLDBText
        Left = 112
        Height = 15
        Top = 0
        Width = 90
        DataField = 'VENCIMENTO'
        DataSource = dsPadrao
      end
      object rldbForn: TRLDBText
        Left = 232
        Height = 15
        Top = 0
        Width = 96
        DataField = 'FORNECEDOR'
        DataSource = dsPadrao
      end
      object rldbDoc: TRLDBText
        Left = 516
        Height = 15
        Top = 0
        Width = 89
        Alignment = taRightJustify
        DataField = 'DOCUMENTO'
        DataSource = dsPadrao
      end
      object rldbValor: TRLDBText
        Left = 655
        Height = 15
        Top = 0
        Width = 47
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = dsPadrao
      end
    end
    object rlbSumario: TRLBand[4]
      Left = 38
      Height = 19
      Top = 118
      Width = 718
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rllbTotal: TRLLabel
        Left = 644
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
  inherited rlepCalculos: TRLExpressionParser
    Left = 160
    Top = 192
  end
  inherited sqldPadrao: TZQuery
    Params = <    
      item
        DataType = ftInteger
        Name = 'PFORNECEDOR'
        ParamType = ptInput
        SQLType = stInteger
      end>
    Left = 160
    Top = 264
    ParamData = <    
      item
        DataType = ftInteger
        Name = 'PFORNECEDOR'
        ParamType = ptInput
        SQLType = stInteger
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
    object sqldPadraoDATA: TDateField[1]
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVENCIMENTO: TDateField[2]
      FieldKind = fkData
      FieldName = 'VENCIMENTO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCODFORN: TIntegerField[3]
      FieldKind = fkData
      FieldName = 'CODFORN'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFORNECEDOR: TStringField[4]
      FieldKind = fkData
      FieldName = 'FORNECEDOR'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDOCUMENTO: TStringField[5]
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoVALOR: TFMTBCDField[6]
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
end
