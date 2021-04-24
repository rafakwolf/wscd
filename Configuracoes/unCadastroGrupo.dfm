inherited frmCadastroGrupo: TfrmCadastroGrupo
  Height = 285
  Width = 664
  Caption = 'frmCadastroGrupo'
  ClientHeight = 285
  ClientWidth = 664
  inherited sbStatus: TStatusBar
    Top = 267
    Width = 664
  end
  inherited pnBotoesPadrao: TPanel
    Width = 664
    ClientWidth = 664
    TabOrder = 2
  end
  object dbeNomeGrupo: TDBEdit[2]
    Left = 62
    Height = 33
    Top = 82
    Width = 305
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodGrupo: TDBEdit[3]
    Left = 62
    Height = 33
    Top = 56
    Width = 105
    DataField = 'CODGRUPO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 392
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsPadrao
    Left = 407
    Top = 100
  end
  object sqldPadrao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 176
    Top = 84
    object sqldPadraoCODGRUPO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODGRUPO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object dspPadrao: TTimer[7]
    Left = 248
    Top = 84
  end
  object cdsPadrao: TMemDataset[8]
    FieldDefs = <>
    Left = 304
    Top = 44
    object cdsPadraoCODGRUPO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODGRUPO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
end
