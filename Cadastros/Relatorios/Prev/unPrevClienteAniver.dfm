inherited frmPrevClientesAniver: TfrmPrevClientesAniver
  Left = 310
  Width = 812
  Caption = 'frmPrevClientesAniver'
  ClientWidth = 812
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 26
        Top = 81
      end
      inherited rlmCabecalho: TRLMemo
        Height = 80
      end
      inherited imgLogo: TRLImage
        Height = 80
      end
    end
    inherited rbRodape: TRLBand
      Top = 120
    end
    object rlbColunas: TRLBand[2]
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
      Color = clBtnFace
      ParentColor = False
      Transparent = False
      object lbNome: TRLLabel
        Left = 5
        Height = 16
        Top = 0
        Width = 39
        Caption = 'Nome'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbDataNasc: TRLLabel
        Left = 200
        Height = 16
        Top = 0
        Width = 73
        Caption = 'Data Nasc.'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbEndereco: TRLLabel
        Left = 304
        Height = 16
        Top = 0
        Width = 64
        Caption = 'Endereço'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbCidade: TRLLabel
        Left = 488
        Height = 16
        Top = 0
        Width = 47
        Caption = 'Cidade'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lbFone: TRLLabel
        Left = 624
        Height = 16
        Top = 0
        Width = 34
        Caption = 'Fone'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object rlbDetalhe: TRLBand[3]
      Left = 38
      Height = 18
      Top = 102
      Width = 718
      BeforePrint = rlbDetalheBeforePrint
      object rldbNome: TRLDBText
        Left = 5
        Height = 16
        Top = 1
        Width = 192
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsPadrao
      end
      object rldbDataNasc: TRLDBText
        Left = 200
        Height = 15
        Top = 1
        Width = 73
        DataField = 'DATANASC'
        DataSource = dsPadrao
      end
      object rldbEndereco: TRLDBText
        Left = 304
        Height = 16
        Top = 1
        Width = 183
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsPadrao
      end
      object rldbCidade: TRLDBText
        Left = 488
        Height = 16
        Top = 1
        Width = 134
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsPadrao
      end
      object rldbFone: TRLDBText
        Left = 624
        Height = 16
        Top = 1
        Width = 89
        AutoSize = False
        DataField = 'FONE'
        DataSource = dsPadrao
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    Params = <    
      item
        DataType = ftInteger
        Name = 'PTIPO'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'PDIAINI'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'PDIAFIM'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'PMES'
        ParamType = ptInput
      end    
      item
        DataType = ftInteger
        Name = 'PANO'
        ParamType = ptInput
      end    
      item
        DataType = ftDate
        Name = 'PDATA1'
        ParamType = ptInput
      end    
      item
        DataType = ftDate
        Name = 'PDATA2'
        ParamType = ptInput
      end>
  end
  inherited cdsPadrao: TMemDataset
    object cdsPadraoNOME: TStringField[0]
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoDATANASC: TDateField[1]
      FieldKind = fkData
      FieldName = 'DATANASC'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoENDERECO: TStringField[2]
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoCIDADE: TStringField[3]
      FieldKind = fkData
      FieldName = 'CIDADE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoBAIRRO: TStringField[4]
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoCEP: TStringField[5]
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoFONE: TStringField[6]
      FieldKind = fkData
      FieldName = 'FONE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
end
