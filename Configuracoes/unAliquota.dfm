inherited frmAliquota: TfrmAliquota
  Width = 620
  Caption = 'frmAliquota'
  ClientWidth = 620
  inherited sbStatus: TStatusBar
    Width = 620
  end
  inherited pnBotoesPadrao: TPanel
    Width = 620
    ClientWidth = 620
    TabOrder = 2
  end
  object dbeAliquota: TDBEdit[2]
    Left = 80
    Height = 33
    Top = 82
    Width = 273
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbeCodAliquota: TDBEdit[3]
    Left = 80
    Height = 33
    Top = 56
    Width = 121
    DataField = 'CODALIQUOTA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 40
    Top = 100
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsPadrao
    Left = 327
    Top = 108
  end
  object sqldPadrao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 136
    Top = 100
  end
  object dspPadrao: TTimer[7]
    Left = 208
    Top = 108
  end
  object cdsPadrao: TMemDataset[8]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    Left = 264
    Top = 116
    object cdsPadraoCODALIQUOTA: TIntegerField
      FieldKind = fkData
      FieldName = 'CODALIQUOTA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
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
