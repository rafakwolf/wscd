inherited frmCadastroCidade: TfrmCadastroCidade
  Left = 200
  Top = 115
  Width = 658
  Caption = 'frmCadastroCidade'
  ClientWidth = 658
  inherited sbStatus: TStatusBar
    Width = 658
  end
  inherited pnBotoesPadrao: TPanel
    Width = 658
    ClientWidth = 658
    TabOrder = 2
  end
  object dbeNomeCidade: TDBEdit[2]
    Left = 21
    Height = 33
    Top = 82
    Width = 313
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodCidade: TDBEdit[3]
    Left = 21
    Height = 33
    Top = 56
    Width = 97
    DataField = 'CODCIDADE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 48
    Top = 124
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsPadrao
    Left = 407
    Top = 124
  end
  object sqldPadrao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 152
    Top = 124
    object sqldPadraoCODCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
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
    Top = 124
  end
  object cdsPadrao: TMemDataset[8]
    FieldDefs = <>
    Left = 328
    Top = 132
    object cdsPadraoCODCIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODCIDADE'
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
