inherited frmConfiguraDuplicata: TfrmConfiguraDuplicata
  Left = 307
  Height = 472
  Top = 123
  Width = 581
  Caption = 'frmConfiguraDuplicata'
  ClientHeight = 472
  ClientWidth = 581
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 454
    Width = 581
  end
  inherited pnBotoesPadrao: TPanel
    Width = 581
    ClientWidth = 581
  end
  object dbeFontSize: TDBEdit[2]
    Left = 392
    Height = 33
    Top = 356
    Width = 57
    DataField = 'FONTE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbgrdCampos: TDBGrid[3]
    Left = 8
    Height = 289
    Top = 40
    Width = 449
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    ParentFont = False
    ShowHint = True
    TabOrder = 3
    OnKeyDown = dbgrdCamposKeyDown
  end
  inherited actlNavigateActions: TActionList[4]
    Left = 72
    Top = 172
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsPadrao
    Left = 311
    Top = 104
  end
  object sqldPadrao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 72
    Top = 80
    object sqldPadraoCAMPO: TStringField
      FieldKind = fkData
      FieldName = 'CAMPO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 50
    end
    object sqldPadraoVERTICAL: TIntegerField
      FieldKind = fkData
      FieldName = 'VERTICAL'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoHORIZONTAL: TIntegerField
      FieldKind = fkData
      FieldName = 'HORIZONTAL'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFONTE: TIntegerField
      FieldKind = fkData
      FieldName = 'FONTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoTIPOFONTE: TStringField
      FieldKind = fkData
      FieldName = 'TIPOFONTE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object sqldPadraoESTILOFONTE: TStringField
      FieldKind = fkData
      FieldName = 'ESTILOFONTE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoIDCONFIGDUPLICATA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCONFIGDUPLICATA'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoNOMECAMPO: TStringField
      FieldKind = fkData
      FieldName = 'NOMECAMPO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object dspPadrao: TTimer[7]
    Left = 152
    Top = 96
  end
  object cdsPadrao: TMemDataset[8]
    FieldDefs = <>
    BeforeInsert = cdsPadraoBeforeInsert
    Left = 224
    Top = 104
    object cdsPadraoCAMPO: TStringField
      FieldKind = fkData
      FieldName = 'CAMPO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = True
      Required = False
      Size = 50
    end
    object cdsPadraoVERTICAL: TIntegerField
      FieldKind = fkData
      FieldName = 'VERTICAL'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoHORIZONTAL: TIntegerField
      FieldKind = fkData
      FieldName = 'HORIZONTAL'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoFONTE: TIntegerField
      FieldKind = fkData
      FieldName = 'FONTE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoTIPOFONTE: TStringField
      FieldKind = fkData
      FieldName = 'TIPOFONTE'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
    object cdsPadraoESTILOFONTE: TStringField
      FieldKind = fkData
      FieldName = 'ESTILOFONTE'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoIDCONFIGDUPLICATA: TIntegerField
      FieldKind = fkData
      FieldName = 'IDCONFIGDUPLICATA'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoNOMECAMPO: TStringField
      FieldKind = fkData
      FieldName = 'NOMECAMPO'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
end
