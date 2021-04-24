inherited frmRelatorioCRAtraso: TfrmRelatorioCRAtraso
  Left = 238
  Top = 199
  Width = 496
  Caption = 'frmRelatorioCRAtraso'
  ClientWidth = 496
  inherited pnButtons: TPanel
    Width = 496
    ClientWidth = 496
  end
  object dbeCliente: TDBEdit[1]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 40
    Width = 355
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource[2]
    DataSet = cdsCliente
    Left = 200
  end
  object sqldCliente: TSQLQuery[3]
    FieldDefs = <>
    Params = <>
    Left = 104
    Top = 8
    object sqldClienteCODCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldClienteNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldClienteTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldClienteRG_IE: TStringField
      FieldKind = fkData
      FieldName = 'RG_IE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldClienteCPF_CNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldClienteDATA_NASC: TDateField
      FieldKind = fkData
      FieldName = 'DATA_NASC'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldClienteLIMITE: TFMTBCDField
      FieldKind = fkData
      FieldName = 'LIMITE'
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
    object sqldClienteDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object dspCliente: TTimer[4]
    Left = 136
    Top = 8
  end
  object cdsCliente: TMemDataset[5]
    FieldDefs = <>
    Left = 168
    Top = 8
    object cdsClienteCODCLIENTE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCLIENTE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsClienteNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsClienteTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsClienteRG_IE: TStringField
      FieldKind = fkData
      FieldName = 'RG_IE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsClienteCPF_CNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CPF_CNPJ'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsClienteDATA_NASC: TDateField
      FieldKind = fkData
      FieldName = 'DATA_NASC'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsClienteLIMITE: TFMTBCDField
      FieldKind = fkData
      FieldName = 'LIMITE'
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
    object cdsClienteDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
end
