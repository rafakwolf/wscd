inherited frmRelatorioCompraData: TfrmRelatorioCompraData
  Left = 213
  Height = 289
  Top = 173
  Width = 422
  Caption = 'frmRelatorioCompraData'
  ClientHeight = 289
  ClientWidth = 422
  inherited pnButtons: TPanel
    Top = 255
    Width = 422
    ClientWidth = 422
  end
  object edDataIni: TDBEdit[1]
    Left = 24
    Height = 33
    Top = 32
    Width = 169
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
    Width = 169
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
    Left = 248
  end
  object sqldSelecao: TSQLQuery[4]
    FieldDefs = <>
    Params = <>
    Left = 152
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
    Left = 184
    Top = 8
  end
  object cdsSelecao: TMemDataset[6]
    FieldDefs = <>
    Left = 216
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
