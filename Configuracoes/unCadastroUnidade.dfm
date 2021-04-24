inherited frmCadastroUnidade: TfrmCadastroUnidade
  Height = 278
  Width = 664
  Caption = 'frmCadastroUnidade'
  ClientHeight = 278
  ClientWidth = 664
  inherited sbStatus: TStatusBar
    Top = 260
    Width = 664
  end
  inherited pnBotoesPadrao: TPanel
    Width = 664
    ClientWidth = 664
    TabOrder = 2
  end
  object dbeNomeUnidade: TDBEdit[2]
    Left = 70
    Height = 33
    Top = 82
    Width = 297
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodUnidade: TDBEdit[3]
    Left = 70
    Height = 33
    Top = 56
    Width = 105
    DataField = 'CODUNIDADE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 48
    Top = 68
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsPadrao
    Left = 423
    Top = 52
  end
  object sqldPadrao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 176
    Top = 44
    object sqldPadraoCODUNIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODUNIDADE'
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
    end
  end
  object dspPadrao: TTimer[7]
    Left = 264
    Top = 44
  end
  object cdsPadrao: TMemDataset[8]
    FieldDefs = <>
    Left = 344
    Top = 44
    object cdsPadraoCODUNIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODUNIDADE'
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
    end
  end
end
