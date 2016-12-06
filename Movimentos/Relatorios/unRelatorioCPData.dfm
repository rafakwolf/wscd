inherited frmRelatorioCPData: TfrmRelatorioCPData
  Left = 213
  Top = 163
  Caption = 'frmRelatorioCPData'
  ClientHeight = 168
  ClientWidth = 281
  OldCreateOrder = True
  ExplicitWidth = 297
  ExplicitHeight = 206
  PixelsPerInch = 96
  TextHeight = 13
  object edDataFim: TPLDBEditDateTimePicker [0]
    Left = 24
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
    EditLabel.Left = 24
    EditLabel.Top = 56
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Final'
    EditLabel.FocusControl = edDataFim
    EditLabel.LabelPosition = lpAbove
    Required = False
  end
  object edDataIni: TPLDBEditDateTimePicker [1]
    Left = 24
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
    EditLabel.Left = 24
    EditLabel.Top = 16
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Inicial'
    EditLabel.FocusControl = edDataIni
    EditLabel.LabelPosition = lpAbove
    Required = False
  end
  inherited pnButtons: TPanel
    Top = 134
    Width = 281
    ExplicitTop = 138
    ExplicitWidth = 289
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = DmPesquisar.cdsPesqData
    Left = 232
  end
end
