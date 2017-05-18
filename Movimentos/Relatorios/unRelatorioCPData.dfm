inherited frmRelatorioCPData: TfrmRelatorioCPData
  Left = 213
  Top = 163
  Caption = 'frmRelatorioCPData'
  ClientHeight = 168
  ClientWidth = 281
  OldCreateOrder = True
  ExplicitWidth = 297
  ExplicitHeight = 207
  PixelsPerInch = 96
  TextHeight = 13
  object edDataFim: TDBEdit [0]
    Left = 24
    Top = 72
    Width = 161
    Height = 21
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object edDataIni: TDBEdit [1]
    Left = 24
    Top = 32
    Width = 161
    Height = 21
    DataField = 'DATAINI'
    DataSource = dsPadrao
    TabOrder = 1
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
    Left = 232
  end
end
