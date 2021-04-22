inherited frmRelatorioCompraData: TfrmRelatorioCompraData
  Left = 213
  Top = 173
  ClientHeight = 151
  ClientWidth = 281
  Caption = 'frmRelatorioCompraData'
  OldCreateOrder = True
  ExplicitWidth = 297
  ExplicitHeight = 190
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TContainerPanel
    Top = 117
    Width = 281
    ExplicitTop = 121
    ExplicitWidth = 289
  end
  object edDataIni: TDBEdit [1]
    Left = 24
    Top = 32
    Width = 169
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAINI'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object edDataFim: TDBEdit [2]
    Left = 24
    Top = 72
    Width = 169
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    TabOrder = 2
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsSelecao
    Left = 248
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  CAST(CURRENT_DATE AS TIMESTAMP) DATAINI,'#13#10'  CAST(CURRE' +
      'NT_DATE AS TIMESTAMP) DATAFIM'#13#10'FROM RDB$DATABASE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 152
    Top = 8
    object sqldSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
    end
    object sqldSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
    end
  end
  object dspSelecao: TDataSetProvider
    DataSet = sqldSelecao
    Left = 184
    Top = 8
  end
  object cdsSelecao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 216
    Top = 8
    object cdsSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
    end
    object cdsSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
    end
  end
end
