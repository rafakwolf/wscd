inherited frmPrevListagemClientes: TfrmPrevListagemClientes
  Width = 813
  Caption = 'frmPrevListagemClientes'
  ClientWidth = 813
  inherited rrPadrao: TRLReport
    inherited rbTitulo: TRLBand
      inherited lbTitulo: TRLLabel
        Height = 32
        Top = 75
        Caption = 'Listagem de Clientes'
      end
      inherited rlmCabecalho: TRLMemo
        Height = 74
      end
      inherited imgLogo: TRLImage
        Height = 74
      end
    end
    inherited rbRodape: TRLBand
      Top = 122
    end
    object rbColuna: TRLBand[2]
      Left = 38
      Height = 19
      Top = 86
      Width = 718
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lbCodigo: TRLLabel
        Left = 3
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
      object lbNome: TRLLabel
        Left = 64
        Height = 16
        Top = 1
        Width = 39
        Caption = 'Nome'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCPJ_CNPJ: TRLLabel
        Left = 352
        Height = 16
        Top = 1
        Width = 62
        Caption = 'CPJ-CNPJ'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDataNasc: TRLLabel
        Left = 488
        Height = 16
        Top = 1
        Width = 101
        Caption = 'Dt. Nascimento'
        Font.CharSet = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFone: TRLLabel
        Left = 608
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
    end
    object rbDetalhe: TRLBand[3]
      Left = 38
      Height = 17
      Top = 105
      Width = 718
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rbDetalheBeforePrint
      object dbCodigo: TRLDBText
        Left = 3
        Height = 15
        Top = 0
        Width = 56
        DataField = 'CODIGO'
        DataSource = dsPadrao
      end
      object dbNome: TRLDBText
        Left = 64
        Height = 16
        Top = 0
        Width = 285
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsPadrao
      end
      object dbCPJ_CNPJ: TRLDBText
        Left = 352
        Height = 15
        Top = 0
        Width = 71
        DataField = 'CPF_CNPJ'
        DataSource = dsPadrao
      end
      object dbDataNasc: TRLDBText
        Left = 488
        Height = 15
        Top = 0
        Width = 124
        DataField = 'DATANASCIMENTO'
        DataSource = dsPadrao
      end
      object dbFone: TRLDBText
        Left = 608
        Height = 15
        Top = 0
        Width = 73
        DataField = 'TELEFONE'
        DataSource = dsPadrao
      end
    end
  end
  inherited sqldPadrao: TSQLQuery
    object sqldPadraoCODIGO: TIntegerField[0]
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNOME: TStringField[1]
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoENDERECO: TStringField[2]
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCPF_CNPJ: TStringField[3]
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoRG_IE: TStringField[4]
      FieldKind = fkData
      FieldName = 'RG_IE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDATANASCIMENTO: TDateField[5]
      FieldKind = fkData
      FieldName = 'DATANASCIMENTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCODCIDADE: TIntegerField[6]
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCIDADE: TStringField[7]
      FieldKind = fkData
      FieldName = 'CIDADE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoTELEFONE: TStringField[8]
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoTIPO: TStringField[9]
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
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
    object cdsPadraoNOME: TStringField[1]
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoENDERECO: TStringField[2]
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCPF_CNPJ: TStringField[3]
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoRG_IE: TStringField[4]
      FieldKind = fkData
      FieldName = 'RG_IE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoDATANASCIMENTO: TDateField[5]
      FieldKind = fkData
      FieldName = 'DATANASCIMENTO'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoCODCIDADE: TIntegerField[6]
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoCIDADE: TStringField[7]
      FieldKind = fkData
      FieldName = 'CIDADE'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoTELEFONE: TStringField[8]
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoTIPO: TStringField[9]
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
end
