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
    Height = 21
    Top = 32
    Width = 185
    DataField = 'DATAINI'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edDataFim: TDBEdit[2]
    Left = 24
    Height = 21
    Top = 72
    Width = 185
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  inherited dsPadrao: TDataSource[3]
    DataSet = sqldSelecao
    Left = 176
    Top = 128
  end
  object sqldSelecao: TZQuery[4]
    Connection = DmPrincipal.ZConnection1
    Params = <>
    Left = 80
    Top = 120
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
end
