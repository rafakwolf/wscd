inherited frmBanco: TfrmBanco
  Height = 282
  Width = 640
  Caption = 'frmBanco'
  ClientHeight = 282
  ClientWidth = 640
  inherited sbStatus: TStatusBar
    Top = 264
    Width = 640
  end
  inherited pnBotoesPadrao: TPanel
    Width = 640
    ClientWidth = 640
    TabOrder = 2
  end
  object dbeCodCompensacao: TDBEdit[2]
    Left = 96
    Height = 33
    Hint = 'Código de compensação'
    Top = 54
    Width = 105
    DataField = 'IDBANCO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbeBanco: TDBEdit[3]
    Left = 96
    Height = 33
    Hint = 'Nome do banco'
    Top = 80
    Width = 321
    DataField = 'BANCO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 32
    Top = 76
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsPadrao
    Left = 311
  end
  object sqldPadrao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 112
    Top = 84
    object sqldPadraoIDBANCO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDBANCO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoBANCO: TStringField
      FieldKind = fkData
      FieldName = 'BANCO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object dspPadrao: TTimer[7]
    Left = 184
    Top = 84
  end
  object cdsPadrao: TMemDataset[8]
    FieldDefs = <>
    Left = 256
    Top = 84
    object cdsPadraoIDBANCO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDBANCO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
      DisplayFormat = '000'
    end
    object cdsPadraoBANCO: TStringField
      FieldKind = fkData
      FieldName = 'BANCO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
end
