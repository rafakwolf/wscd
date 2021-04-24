inherited frmAgenda: TfrmAgenda
  Height = 452
  Width = 799
  Caption = 'frmAgenda'
  ClientHeight = 452
  ClientWidth = 799
  inherited sbStatus: TStatusBar
    Top = 434
    Width = 799
  end
  inherited pnBotoesPadrao: TPanel
    Width = 799
    ClientWidth = 799
    TabOrder = 3
  end
  object dbeNome: TDBEdit[2]
    Left = 56
    Height = 33
    Top = 56
    Width = 329
    DataField = 'NOME'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeFax: TDBEdit[3]
    Left = 56
    Height = 33
    Top = 234
    Width = 161
    DataField = 'FAX'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object grpTelefone: TGroupBox[4]
    Left = 56
    Height = 146
    Top = 88
    Width = 201
    Caption = ' Telefones '
    ClientHeight = 128
    ClientWidth = 199
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object dbeFone1: TDBEdit
      Left = 8
      Height = 33
      Top = 18
      Width = 183
      DataField = 'TELEFONE'
      DataSource = dsPadrao
      CharCase = ecNormal
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object dbeFone2: TDBEdit
      Left = 8
      Height = 33
      Top = 51
      Width = 183
      DataField = 'TELEFONE2'
      DataSource = dsPadrao
      CharCase = ecNormal
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object dbeFone3: TDBEdit
      Left = 8
      Height = 33
      Top = 85
      Width = 183
      DataField = 'TELEFONE3'
      DataSource = dsPadrao
      CharCase = ecNormal
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object dbmObs: TDBMemo[5]
    Left = 56
    Height = 89
    Top = 274
    Width = 345
    DataField = 'OBS'
    DataSource = dsPadrao
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  inherited actlNavigateActions: TActionList[6]
    Left = 328
    Top = 100
    inherited actPrint: TAction
      Hint = 'Listagem de telefones'
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[7]
    DataSet = cdsPadrao
    Left = 487
    Top = 172
  end
  object sqldPadrao: TSQLQuery[8]
    FieldDefs = <>
    Params = <>
    Left = 296
    Top = 164
    object sqldPadraoIDAGENDA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDAGENDA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
      Required = True
    end
    object sqldPadraoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoTELEFONE2: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE2'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoTELEFONE3: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE3'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
  end
  object dspPadrao: TTimer[9]
    Left = 360
    Top = 172
  end
  object cdsPadrao: TMemDataset[10]
    FieldDefs = <>
    Left = 432
    Top = 164
    object cdsPadraoIDAGENDA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDAGENDA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
      Required = True
    end
    object cdsPadraoTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoTELEFONE2: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE2'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoTELEFONE3: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE3'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
  end
end
