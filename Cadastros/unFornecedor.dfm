inherited frmFornecedor: TfrmFornecedor
  Left = 139
  Height = 480
  Top = 147
  Width = 796
  Caption = 'frmFornecedor'
  ClientHeight = 480
  ClientWidth = 796
  inherited sbStatus: TStatusBar
    Top = 462
    Width = 796
  end
  inherited pnBotoesPadrao: TPanel
    Width = 796
    ClientWidth = 796
    TabOrder = 16
  end
  object btnContas: TBitBtn[2]
    Left = 576
    Height = 25
    Top = 360
    Width = 81
    Caption = '&Contas'
    OnClick = btnContasClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object dbdDataCadastro: TDBEdit[3]
    Left = 280
    Height = 33
    Top = 196
    Width = 129
    DataField = 'DATACAD'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object dbeCidade: TDBEdit[4]
    Left = 320
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 152
    Width = 299
    DataField = 'NOMECIDADE'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dbeTelefoneVendedor: TDBEdit[5]
    Left = 544
    Height = 33
    Top = 264
    Width = 153
    DataField = 'TELEFONEVENDEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object dbeEmailVendedor: TDBEdit[6]
    Left = 8
    Height = 33
    Top = 301
    Width = 361
    DataField = 'EMAILVENDEDOR'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object dbeNomeVendedor: TDBEdit[7]
    Left = 8
    Height = 33
    Top = 264
    Width = 529
    DataField = 'VENDEDOR'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object dbeFax: TDBEdit[8]
    Left = 144
    Height = 33
    Top = 196
    Width = 129
    DataField = 'FAX'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeTelefone: TDBEdit[9]
    Left = 8
    Height = 33
    Top = 196
    Width = 129
    DataField = 'TELEFONE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object dbeInscEstadual: TDBEdit[10]
    Left = 176
    Height = 33
    Top = 108
    Width = 129
    DataField = 'IE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeCnpj: TDBEdit[11]
    Left = 8
    Height = 33
    Top = 108
    Width = 161
    DataField = 'CNPJ'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeCep: TDBEdit[12]
    Left = 216
    Height = 33
    Top = 152
    Width = 97
    DataField = 'CEP'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dbeBairro: TDBEdit[13]
    Left = 8
    Height = 33
    Top = 152
    Width = 201
    DataField = 'BAIRRO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbeEstado: TDBEdit[14]
    Left = 648
    Height = 33
    Top = 152
    Width = 49
    DataField = 'UF'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object dbeEndereco: TDBEdit[15]
    Left = 312
    Height = 33
    Top = 108
    Width = 385
    DataField = 'ENDERECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeNomeRzSocial: TDBEdit[16]
    Left = 8
    Height = 33
    Top = 64
    Width = 305
    DataField = 'RAZAOSOCIAL'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeNomeFantazia: TDBEdit[17]
    Left = 320
    Height = 33
    Top = 64
    Width = 377
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeEmail: TDBEdit[18]
    Left = 416
    Height = 33
    Top = 196
    Width = 281
    DataField = 'EMAIL'
    DataSource = dsPadrao
    CharCase = ecLowerCase
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object bvlLinha: TPanel[19]
    Left = 8
    Height = 2
    Top = 232
    Width = 689
    Caption = 'bvlLinha'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
  end
  object dbmObs: TDBMemo[20]
    Left = 8
    Height = 47
    Top = 338
    Width = 449
    DataField = 'OBS'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
  end
  inherited actlNavigateActions: TActionList[21]
    Left = 560
    Top = 212
    inherited actPrint: TAction
      Hint = 'Listagem de fornecedores'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[22]
    DataSet = cdsPadrao
    Left = 604
    Top = 6
  end
  object sqldPadrao: TSQLQuery[23]
    FieldDefs = <>
    Params = <>
    Left = 508
    Top = 6
    object sqldPadraoCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoDATACAD: TDateField
      FieldKind = fkData
      FieldName = 'DATACAD'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoRAZAOSOCIAL: TStringField
      FieldKind = fkData
      FieldName = 'RAZAOSOCIAL'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CIDADE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoNOMECIDADE: TStringField
      FieldKind = fkData
      FieldName = 'NOMECIDADE'
      Index = 6
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoIE: TStringField
      FieldKind = fkData
      FieldName = 'IE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object sqldPadraoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoEMAIL: TStringField
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoUF: TStringField
      FieldKind = fkData
      FieldName = 'UF'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 2
    end
    object sqldPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object sqldPadraoVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'VENDEDOR'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoTELEFONEVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONEVENDEDOR'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoEMAILVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'EMAILVENDEDOR'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoTIPO: TStringField
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
  end
  object dspPadrao: TTimer[24]
    Left = 540
    Top = 6
  end
  object cdsPadrao: TMemDataset[25]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    Left = 572
    Top = 6
    object cdsPadraoCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoFANTAZIA: TStringField
      DisplayLabel = 'Fantasia'
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoRAZAOSOCIAL: TStringField
      DisplayLabel = 'Razão Social'
      FieldKind = fkData
      FieldName = 'RAZAOSOCIAL'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 80
    end
    object cdsPadraoDATACAD: TDateField
      FieldKind = fkData
      FieldName = 'DATACAD'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoENDERECO: TStringField
      FieldKind = fkData
      FieldName = 'ENDERECO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldKind = fkData
      FieldName = 'CIDADE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      OnValidate = cdsPadraoCIDADEValidate
    end
    object cdsPadraoNOMECIDADE: TStringField
      FieldKind = fkData
      FieldName = 'NOMECIDADE'
      Index = 6
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoBAIRRO: TStringField
      FieldKind = fkData
      FieldName = 'BAIRRO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      OnSetText = cdsPadraoCNPJSetText
    end
    object cdsPadraoIE: TStringField
      FieldKind = fkData
      FieldName = 'IE'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoCEP: TStringField
      FieldKind = fkData
      FieldName = 'CEP'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
    object cdsPadraoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoEMAIL: TStringField
      FieldKind = fkData
      FieldName = 'EMAIL'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoUF: TStringField
      FieldKind = fkData
      FieldName = 'UF'
      Index = 14
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 2
    end
    object cdsPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 15
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
    object cdsPadraoVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'VENDEDOR'
      Index = 16
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 80
    end
    object cdsPadraoTELEFONEVENDEDOR: TStringField
      DisplayLabel = 'TELEFONE DO VENDEDOR'
      FieldKind = fkData
      FieldName = 'TELEFONEVENDEDOR'
      Index = 17
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoEMAILVENDEDOR: TStringField
      FieldKind = fkData
      FieldName = 'EMAILVENDEDOR'
      Index = 18
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoTIPO: TStringField
      FieldKind = fkData
      FieldName = 'TIPO'
      Index = 19
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnGetText = cdsPadraoTIPOGetText
      OnSetText = cdsPadraoTIPOSetText
      Size = 1
    end
  end
  object sqldCidade: TSQLQuery[26]
    FieldDefs = <>
    Params = <>
    Left = 324
    Top = 244
  end
  object dspCidade: TTimer[27]
    Left = 404
    Top = 244
  end
  object cdsCidade: TMemDataset[28]
    FieldDefs = <>
    Left = 476
    Top = 244
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
      Size = 50
    end
  end
end
