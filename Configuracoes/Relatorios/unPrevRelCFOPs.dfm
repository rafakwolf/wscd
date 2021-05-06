inherited frmPrevRelCFOPs: TfrmPrevRelCFOPs
  Left = 371
  Top = 180
  Caption = 'frmPrevRelCFOPs'
  inherited rrPadrao: TRLReport
    Height = 794
    Width = 1123
    PageSetup.Orientation = poLandscape
    inherited rbTitulo: TRLBand
      Width = 1047
      inherited lbTitulo: TRLLabel
        Height = 31
        Top = 76
        Width = 1045
      end
      inherited rlmCabecalho: TRLMemo
        Height = 75
        Width = 947
      end
      inherited imgLogo: TRLImage
        Height = 75
      end
    end
    inherited rbRodape: TRLBand
      Top = 206
      Width = 1047
      inherited sysData: TRLSystemInfo
        Left = 935
      end
      inherited sysPage: TRLSystemInfo
        Left = 871
      end
    end
    object rlbndCabecColunas: TRLBand[2]
      Left = 38
      Height = 20
      Top = 86
      Width = 1047
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object rllbNumero: TRLLabel
        Left = 8
        Height = 16
        Top = 2
        Width = 35
        Caption = 'CFOP'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbOperacao: TRLLabel
        Left = 120
        Height = 16
        Top = 2
        Width = 66
        Caption = 'Operação'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllbDescricao: TRLLabel
        Left = 552
        Height = 16
        Top = 2
        Width = 67
        Caption = 'Descrição'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbndColunaDados: TRLBand[3]
      Left = 38
      Height = 100
      Top = 106
      Width = 1047
      BeforePrint = rlbndColunaDadosBeforePrint
      object rlbdtNumero: TRLDBText
        Left = 8
        Height = 16
        Top = 2
        Width = 105
        AutoSize = False
        DataField = 'NUMERO'
        DataSource = dsPadrao
      end
      object rldbmOperacao: TRLDBMemo
        Left = 120
        Height = 95
        Top = 2
        Width = 429
        AutoSize = False
        Behavior = [beSiteExpander]
        DataField = 'OPERACAO'
        DataSource = dsPadrao
      end
      object rldbmDescricao: TRLDBMemo
        Left = 552
        Height = 95
        Top = 2
        Width = 489
        AutoSize = False
        Behavior = [beSiteExpander]
        DataField = 'CFNOTA'
        DataSource = dsPadrao
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    object sqldPadraoNUMERO: TStringField[0]
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoOPERACAO: TStringField[1]
      FieldKind = fkData
      FieldName = 'OPERACAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 250
    end
    object sqldPadraoCFNOTA: TStringField[2]
      FieldKind = fkData
      FieldName = 'CFNOTA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1000
    end
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoNUMERO: TStringField[0]
      FieldKind = fkData
      FieldName = 'NUMERO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoOPERACAO: TStringField[1]
      FieldKind = fkData
      FieldName = 'OPERACAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 250
    end
    object cdsPadraoCFNOTA: TStringField[2]
      FieldKind = fkData
      FieldName = 'CFNOTA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1000
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 368
    Top = 16
  end
end
