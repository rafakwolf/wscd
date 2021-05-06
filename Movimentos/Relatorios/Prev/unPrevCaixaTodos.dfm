inherited frmPrevCaixaTodos: TfrmPrevCaixaTodos
  Left = 317
  Top = 81
  Caption = 'frmPrevCaixaTodos'
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Left = 91
        Height = 30
        Top = 58
      end
    end
    inherited rbRodape: TRLBand
      Top = 157
    end
    object rlbSumario: TRLBand[2]
      Left = 38
      Height = 16
      Top = 141
      Width = 718
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object lbDebitos: TRLLabel
        Left = 6
        Height = 16
        Top = 0
        Width = 64
        Font.CharSet = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCreditos: TRLLabel
        Left = 304
        Height = 16
        Top = 0
        Width = 69
        Font.CharSet = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbSaldo: TRLLabel
        Left = 663
        Height = 16
        Top = 0
        Width = 50
        Alignment = taRightJustify
        Font.CharSet = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlgrpCaixa: TRLGroup[3]
      Left = 38
      Height = 55
      Top = 86
      Width = 718
      DataFields = 'CAIXA'
      BeforePrint = rlgrpCaixaBeforePrint
      object rlbColunas: TRLBand
        Left = 0
        Height = 16
        Top = 0
        Width = 718
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        object lbLanc: TRLLabel
          Left = 142
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
          Transparent = False
        end
        object lbDescricao: TRLLabel
          Left = 232
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
          Transparent = False
        end
        object lbDoc: TRLLabel
          Left = 512
          Height = 16
          Top = 0
          Width = 77
          Alignment = taRightJustify
          Caption = 'Documento'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbTipoConta: TRLLabel
          Left = 592
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
          Transparent = False
        end
        object lbValor: TRLLabel
          Left = 678
          Height = 16
          Top = -1
          Width = 38
          Alignment = taRightJustify
          Caption = 'Valor'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel1: TRLLabel
          Left = 8
          Height = 16
          Top = 0
          Width = 79
          Caption = 'Conta caixa'
          Font.CharSet = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object rlbDetalhe: TRLBand
        Left = 0
        Height = 16
        Top = 16
        Width = 718
        BeforePrint = rlbDetalheBeforePrint
        object rldbLanc: TRLDBText
          Left = 142
          Height = 16
          Top = 0
          Width = 88
          AutoSize = False
          DataField = 'DATA'
          DataSource = dsPadrao
        end
        object rldbDescricao: TRLDBText
          Left = 232
          Height = 16
          Top = 0
          Width = 273
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsPadrao
        end
        object rldbDoc: TRLDBText
          Left = 501
          Height = 15
          Top = 0
          Width = 88
          Alignment = taRightJustify
          DataField = 'DOCUMENTO'
          DataSource = dsPadrao
        end
        object rldbConta: TRLDBText
          Left = 592
          Height = 15
          Top = 0
          Width = 35
          DataField = 'TIPO'
          DataSource = dsPadrao
          BeforePrint = rldbContaBeforePrint
        end
        object rldbValor: TRLDBText
          Left = 669
          Height = 15
          Top = 0
          Width = 47
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = dsPadrao
        end
        object rldbCaixa: TRLDBText
          Left = 8
          Height = 16
          Top = 0
          Width = 132
          AutoSize = False
          DataField = 'CAIXA'
          DataSource = dsPadrao
          BeforePrint = rldbCaixaBeforePrint
        end
      end
      object rlbndSomaPorCaixa: TRLBand
        Left = 0
        Height = 22
        Top = 32
        Width = 718
        BandType = btFooter
        object rllbSomaC: TRLLabel
          Left = 649
          Height = 16
          Top = 3
          Width = 67
          Alignment = taRightJustify
          Font.CharSet = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbSomaD: TRLLabel
          Left = 304
          Height = 16
          Top = 3
          Width = 68
          Alignment = taRightJustify
          Font.CharSet = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    object sqldPadraoCAIXA: TStringField[0]
      FieldKind = fkData
      FieldName = 'CAIXA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
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
    object sqldPadraoDESCRICAO: TStringField[2]
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDOCUMENTO: TStringField[3]
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoTIPO: TStringField[4]
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoVALOR: TFMTBCDField[5]
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 5
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
  inherited cdsPadrao: TMemDataset
    object cdsPadraoCAIXA: TStringField[0]
      FieldKind = fkData
      FieldName = 'CAIXA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoDATA: TDateField[1]
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoDESCRICAO: TStringField[2]
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoDOCUMENTO: TStringField[3]
      FieldKind = fkData
      FieldName = 'DOCUMENTO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoTIPO: TStringField[4]
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoVALOR: TFMTBCDField[5]
      FieldKind = fkData
      FieldName = 'VALOR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 400
    Top = 16
  end
end
