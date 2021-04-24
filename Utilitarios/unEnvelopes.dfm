inherited frmEnvelopes: TfrmEnvelopes
  Caption = 'frmEnvelopes'
  inherited pnBotoesPadrao: TPanel
    TabOrder = 6
  end
  object dbNome: TDBEdit[2]
    Left = 88
    Height = 33
    Top = 54
    Width = 531
    DataField = 'NOME'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeCidade: TDBEdit[3]
    Left = 88
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 121
    Width = 329
    DataField = 'NOMECIDADE'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbCep: TDBEdit[4]
    Left = 88
    Height = 33
    Top = 187
    Width = 153
    DataField = 'CEP'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbMsg: TDBEdit[5]
    Left = 88
    Height = 33
    Top = 222
    Width = 529
    DataField = 'MENSAGEM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbEndereco: TDBEdit[6]
    Left = 88
    Height = 33
    Top = 87
    Width = 531
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbBairro: TDBEdit[7]
    Left = 88
    Height = 33
    Top = 154
    Width = 321
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  inherited actlNavigateActions: TActionList[8]
    Left = 680
    Top = 80
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource[9]
    DataSet = cdsPadrao
    Left = 688
    Top = 144
  end
  object sqldPadrao: TSQLQuery[10]
    FieldDefs = <>
    Params = <>
    Left = 704
    Top = 208
    object sqldPadraoIDENVELOPE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDENVELOPE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoIDCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCIDADE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object sqldPadraoMENSAGEM: TStringField
      FieldKind = fkData
      FieldName = 'MENSAGEM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 150
    end
    object sqldPadraoNOMECIDADE: TStringField
      FieldKind = fkData
      FieldName = 'NOMECIDADE'
      Index = 7
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object dspPadrao: TTimer[11]
    Left = 616
    Top = 256
  end
  object cdsPadrao: TMemDataset[12]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    Left = 736
    Top = 48
    object cdsPadraoIDENVELOPE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDENVELOPE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoIDCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCIDADE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsPadraoIDCIDADEValidate
    end
    object cdsPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object cdsPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsPadraoMENSAGEM: TStringField
      FieldKind = fkData
      FieldName = 'MENSAGEM'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 150
    end
    object cdsPadraoNOMECIDADE: TStringField
      FieldKind = fkData
      FieldName = 'NOMECIDADE'
      Index = 7
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object sqldCidade: TSQLQuery[13]
    FieldDefs = <>
    Params = <>
    Left = 432
    Top = 112
    object sqldCidadeCODCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldCidadeDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
  end
  object dspCidade: TTimer[14]
    Left = 512
    Top = 112
  end
  object cdsCidade: TMemDataset[15]
    FieldDefs = <>
    Left = 584
    Top = 112
    object cdsCidadeCODCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsCidadeDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
  end
end
