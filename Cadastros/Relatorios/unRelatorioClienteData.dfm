inherited frmRelatorioClienteData: TfrmRelatorioClienteData
  Height = 245
  Width = 429
  Caption = 'frmRelatorioClienteData'
  ClientHeight = 245
  ClientWidth = 429
  inherited pnButtons: TPanel
    Top = 211
    Width = 429
    ClientWidth = 429
  end
  object edDataIni: TDBEdit[1]
    Left = 24
    Height = 33
    Top = 32
    Width = 185
    DataField = 'DATAINI'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edDataFim: TDBEdit[2]
    Left = 24
    Height = 33
    Top = 72
    Width = 185
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  inherited dsPadrao: TDataSource[3]
    DataSet = cdsSelecao
    Left = 176
  end
  object sqldSelecao: TSQLQuery[4]
    FieldDefs = <>
    Params = <>
    Left = 80
    Top = 8
    object sqldSelecaoDATAINI: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAINI'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldSelecaoDATAFIM: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAFIM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspSelecao: TTimer[5]
    Left = 112
    Top = 8
  end
  object cdsSelecao: TMemDataset[6]
    FieldDefs = <>
    Left = 144
    Top = 8
    object cdsSelecaoDATAINI: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAINI'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsSelecaoDATAFIM: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAFIM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
end
