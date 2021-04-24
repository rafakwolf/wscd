inherited frmPrevRelCaixa: TfrmPrevRelCaixa
  Width = 851
  Caption = 'frmPrevRelCaixa'
  ClientWidth = 851
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 30
        Caption = 'Caixa por Tipo de Conta'
      end
      inherited rlmCabecalho: TRLMemo
        Height = 76
      end
      inherited imgLogo: TRLImage
        Height = 76
      end
    end
    inherited rbRodape: TRLBand
      Top = 145
    end
    object rbColunas: TRLBand[2]
      Left = 38
      Height = 17
      Top = 86
      Width = 718
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbData: TRLLabel
        Left = 16
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
      object lbDescricao: TRLLabel
        Left = 102
        Height = 16
        Top = 0
        Width = 67
        Caption = 'Descrição'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDocumento: TRLLabel
        Left = 412
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
      object lbTipo: TRLLabel
        Left = 562
        Height = 16
        Top = 0
        Width = 42
        Caption = 'Conta'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbValor: TRLLabel
        Left = 675
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
    object rbDetalhe: TRLBand[3]
      Left = 38
      Height = 19
      Top = 103
      Width = 718
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = rbDetalheBeforePrint
      object dbData: TRLDBText
        Left = 16
        Height = 15
        Top = 1
        Width = 36
        DataField = 'DATA'
        DataSource = dsPadrao
      end
      object dbDescricao: TRLDBText
        Left = 102
        Height = 16
        Top = 1
        Width = 307
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsPadrao
      end
      object dbDocumento: TRLDBText
        Left = 403
        Height = 15
        Top = 1
        Width = 88
        Alignment = taRightJustify
        DataField = 'DOCUMENTO'
        DataSource = dsPadrao
      end
      object dbTipo: TRLDBText
        Left = 562
        Height = 15
        Top = 1
        Width = 35
        DataField = 'TIPO'
        DataSource = dsPadrao
        BeforePrint = dbTipoBeforePrint
      end
      object dbValor: TRLDBText
        Left = 666
        Height = 15
        Top = 1
        Width = 47
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = dsPadrao
        DisplayMask = '#,##0.00'
      end
    end
    object rbSumario: TRLBand[4]
      Left = 38
      Height = 23
      Top = 122
      Width = 718
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.Width = 2
      object rllbTotalC: TRLLabel
        Left = 265
        Height = 16
        Top = 5
        Width = 64
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbTotalD: TRLLabel
        Left = 8
        Height = 16
        Top = 5
        Width = 65
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlbSaldo: TRLLabel
        Left = 536
        Height = 16
        Top = 5
        Width = 56
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
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end    
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end    
      item
        DataType = ftFixedChar
        Name = 'PTIPOCONTA'
        ParamType = ptInput
      end    
      item
        DataType = ftFixedChar
        Name = 'PORDEM'
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
    object sqldPadraoTOTAL: TFMTBCDField[1]
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 1
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
    object sqldPadraoDATA: TDateField[2]
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCRICAO: TStringField[3]
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoDOCUMENTO: TStringField[4]
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoTIPO: TStringField[5]
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
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
      Size = 2
    end
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoCODIGO: TIntegerField[0]
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoTOTAL: TFMTBCDField[1]
      FieldKind = fkData
      FieldName = 'TOTAL'
      Index = 1
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
    object cdsPadraoDATA: TDateField[2]
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoDESCRICAO: TStringField[3]
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoDOCUMENTO: TStringField[4]
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoTIPO: TStringField[5]
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoVALOR: TFMTBCDField[6]
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 6
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
  inherited rlepCalculos: TRLExpressionParser
    Expression = 'sum(VALOR)'
    Left = 148
  end
end
