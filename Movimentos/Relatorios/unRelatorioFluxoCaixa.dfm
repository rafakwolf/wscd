inherited frmRelatorioFluxoCaixa: TfrmRelatorioFluxoCaixa
  Caption = 'frmRelatorioFluxoCaixa'
  ClientHeight = 208
  ClientWidth = 385
  OldCreateOrder = True
  ExplicitWidth = 401
  ExplicitHeight = 246
  PixelsPerInch = 96
  TextHeight = 13
  object dbDataI: TPLDBEditDateTimePicker [0]
    Left = 80
    Top = 112
    Width = 137
    Height = 21
    Date = 39161.846077002320000000
    Time = 39161.846077002320000000
    TabOrder = 2
    DataField = 'DATAINI'
    DataSource = dsPadrao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    AutoApplyEditMask = True
    EditLabel.Left = 12
    EditLabel.Top = 116
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'Data Inicial'
    EditLabel.FocusControl = dbDataI
    Required = False
  end
  object rgOrdem: TRadioGroup [1]
    Left = 8
    Top = 56
    Width = 377
    Height = 41
    Caption = ' Ordem '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Lan'#231'amento'
      'Data')
    TabOrder = 1
  end
  object rgRelatorio: TRadioGroup [2]
    Left = 8
    Top = 8
    Width = 377
    Height = 41
    Caption = ' Sele'#231#227'o '
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Entradas'
      'Sa'#237'das'
      'Todos')
    TabOrder = 0
  end
  object dbDataF: TPLDBEditDateTimePicker [3]
    Left = 80
    Top = 136
    Width = 137
    Height = 21
    Date = 39161.845980451390000000
    Time = 39161.845980451390000000
    TabOrder = 3
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    AutoApplyEditMask = True
    EditLabel.Left = 20
    EditLabel.Top = 140
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Alignment = taRightJustify
    EditLabel.Caption = 'Data Final'
    EditLabel.FocusControl = dbDataF
    Required = False
  end
  inherited pnButtons: TPanel
    Top = 174
    Width = 385
    TabOrder = 4
    ExplicitTop = 178
    ExplicitWidth = 393
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsSelecao
    Left = 352
    Top = 136
  end
  object sqldSelecao: TSQLDataSet
    CommandText = 
      'select'#13#10'  cast(null as timestamp) as dataini,'#13#10'  cast(null as ti' +
      'mestamp) as datafim'#13#10'from rdb$database'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrincipal.Conexao
    Left = 256
    Top = 136
    object sqldSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
    end
    object sqldSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
    end
  end
  object dspSelecao: TDataSetProvider
    DataSet = sqldSelecao
    Left = 288
    Top = 136
  end
  object cdsSelecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecao'
    Left = 320
    Top = 136
    object cdsSelecaoDATAINI: TSQLTimeStampField
      FieldName = 'DATAINI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsSelecaoDATAFIM: TSQLTimeStampField
      FieldName = 'DATAFIM'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
end
