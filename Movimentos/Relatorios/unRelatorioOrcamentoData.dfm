inherited frmRelatorioOrcamentoData: TfrmRelatorioOrcamentoData
  Caption = 'frmRelatorioOrcamentoData'
  ClientHeight = 167
  ClientWidth = 281
  OldCreateOrder = True
  ExplicitWidth = 297
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  object edDataFim: TPLDBEditDateTimePicker [0]
    Left = 16
    Top = 72
    Width = 161
    Height = 21
    Date = 39184.832127199070000000
    Time = 39184.832127199070000000
    TabOrder = 2
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    EditLabel.Left = 16
    EditLabel.Top = 56
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Final'
    EditLabel.FocusControl = edDataFim
    EditLabel.LabelPosition = lpAbove
    Required = False
  end
  object edDataIni: TPLDBEditDateTimePicker [1]
    Left = 16
    Top = 32
    Width = 161
    Height = 21
    Date = 39184.832118854170000000
    Time = 39184.832118854170000000
    TabOrder = 1
    DataField = 'DATAINI'
    DataSource = dsPadrao
    ReadOnly = False
    DefaultEditMask = '!99/99/9999;1;_'
    EditLabel.Left = 16
    EditLabel.Top = 16
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Inicial'
    EditLabel.FocusControl = edDataIni
    EditLabel.LabelPosition = lpAbove
    Required = False
  end
  inherited pnButtons: TPanel
    Top = 133
    Width = 281
    ExplicitTop = 137
    ExplicitWidth = 289
    inherited btnImprimir: TBitBtn
      Left = 2
      ExplicitLeft = 2
    end
    inherited btnVisualizar: TBitBtn
      Left = 92
      OnClick = btnVisualizarClick
      ExplicitLeft = 92
    end
    inherited btnSair: TBitBtn
      Left = 182
      ExplicitLeft = 182
    end
  end
  inherited dsPadrao: TDataSource
    Left = 224
    Top = 16
  end
end
