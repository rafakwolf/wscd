inherited frmRelatorioClienteData: TfrmRelatorioClienteData
  Caption = 'frmRelatorioClienteData'
  ClientHeight = 146
  ClientWidth = 281
  OldCreateOrder = True
  ExplicitWidth = 297
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  object edDataIni: TPLDBEditDateTimePicker [0]
    Left = 24
    Top = 32
    Width = 185
    Height = 21
    Date = 39184.819537106480000000
    Time = 39184.819537106480000000
    TabOrder = 1
    DataField = 'DATAINI'
    DataSource = dsPadrao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    AutoApplyEditMask = True
    EditLabel.Left = 24
    EditLabel.Top = 16
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Inicial'
    EditLabel.FocusControl = edDataIni
    EditLabel.LabelPosition = lpAbove
    Required = False
  end
  object edDataFim: TPLDBEditDateTimePicker [1]
    Left = 24
    Top = 72
    Width = 185
    Height = 21
    Date = 39184.819547766200000000
    Time = 39184.819547766200000000
    TabOrder = 2
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    AutoApplyEditMask = True
    EditLabel.Left = 24
    EditLabel.Top = 56
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Final'
    EditLabel.FocusControl = edDataFim
    EditLabel.LabelPosition = lpAbove
    Required = False
  end
  inherited pnButtons: TPanel
    Top = 112
    Width = 281
    ExplicitTop = 116
    ExplicitWidth = 289
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsSelecao
    Left = 176
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  CAST(CURRENT_DATE AS TIMESTAMP)DATAINI,'#13#10'  CAST(CURREN' +
      'T_DATE AS TIMESTAMP)DATAFIM'#13#10'FROM RDB$DATABASE'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 80
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
    Left = 112
    Top = 8
  end
  object cdsSelecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 144
    Top = 8
    object cdsSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
    end
    object cdsSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
    end
  end
end
