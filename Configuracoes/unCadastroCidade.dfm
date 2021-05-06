inherited frmCadastroCidade: TfrmCadastroCidade
  Left = 268
  Top = 147
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
    Top = 94
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
    Left = 56
    Top = 168
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsPadrao
    Left = 415
    Top = 168
  end
  object sqldPadrao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 160
    Top = 168
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
    Left = 256
    Top = 168
  end
  object cdsPadrao: TMemDataset[8]
    FieldDefs = <>
    Left = 336
    Top = 176
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
