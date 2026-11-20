inherited frmPrevRelFornData: TfrmPrevRelFornData
  Left = 288
  Top = 103
  Width = 1036
  Caption = 'frmPrevRelFornData'
  ClientHeight = 488
  ClientWidth = 1036
  inherited rrPadrao: TRLReport
    Height = 794
    Width = 1123
    PageSetup.Orientation = poLandscape
    inherited rbTitulo: TRLBand
      Width = 1047
      inherited lbTitulo: TRLLabel
        Width = 1045
        Caption = 'Relatório de Fornecedores'
      end
      inherited rlmCabecalho: TRLMemo
        Width = 947
      end
    end
    inherited rbRodape: TRLBand
      Top = 123
      Width = 1047
      inherited sysData: TRLSystemInfo
        Left = 935
      end
      inherited sysPage: TRLSystemInfo
        Left = 871
      end
    end
    object rbColunas: TRLBand[2]
      Left = 38
      Height = 19
      Top = 86
      Width = 1047
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodigo: TRLLabel
        Left = 8
        Height = 16
        Top = 1
        Width = 47
        Caption = 'Código'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFantazia: TRLLabel
        Left = 80
        Height = 16
        Top = 1
        Width = 58
        Caption = 'Fantazia'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEndereco: TRLLabel
        Left = 680
        Height = 16
        Top = 1
        Width = 64
        Caption = 'Endereço'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCNPJ: TRLLabel
        Left = 544
        Height = 16
        Top = 1
        Width = 34
        Caption = 'CNPJ'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFone: TRLLabel
        Left = 928
        Height = 16
        Top = 1
        Width = 59
        Caption = 'Telefone'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCidade: TRLLabel
        Left = 328
        Height = 16
        Top = 1
        Width = 47
        Caption = 'Cidade'
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
      Height = 18
      Top = 105
      Width = 1047
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rbDetalheBeforePrint
      object dbCodigo: TRLDBText
        Left = 2
        Height = 15
        Top = 1
        Width = 56
        Alignment = taRightJustify
        DataField = 'CODIGO'
        DataSource = dsPadrao
      end
      object dbFantazia: TRLDBText
        Left = 80
        Height = 16
        Top = 1
        Width = 241
        AutoSize = False
        DataField = 'FANTAZIA'
        DataSource = dsPadrao
      end
      object dbCNPJ: TRLDBText
        Left = 544
        Height = 16
        Top = 1
        Width = 133
        AutoSize = False
        DataField = 'CNPJ'
        DataSource = dsPadrao
      end
      object dbFone: TRLDBText
        Left = 928
        Height = 15
        Top = 1
        Width = 73
        DataField = 'TELEFONE'
        DataSource = dsPadrao
      end
      object dbEndereco: TRLDBText
        Left = 680
        Height = 16
        Top = 1
        Width = 241
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsPadrao
      end
      object rldbCidade: TRLDBText
        Left = 328
        Height = 16
        Top = 0
        Width = 209
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsPadrao
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    Params = <    
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptInput
      end    
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
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
    object sqldPadraoDATA: TDateField[1]
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFANTAZIA: TStringField[2]
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCNPJ: TStringField[3]
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoENDERECO: TStringField[4]
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField[5]
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCIDADE: TStringField[6]
      FieldKind = fkData
      FieldName = 'CIDADE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
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
    object cdsPadraoFANTAZIA: TStringField[2]
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCNPJ: TStringField[3]
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoENDERECO: TStringField[4]
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoTELEFONE: TStringField[5]
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoCIDADE: TStringField[6]
      FieldKind = fkData
      FieldName = 'CIDADE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  inherited rlepCalculos: TRLExpressionParser
    Left = 148
  end
end
