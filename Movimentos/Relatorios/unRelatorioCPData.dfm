inherited frmRelatorioCPData: TfrmRelatorioCPData
  Left = 213
  Top = 163
  ClientHeight = 168
  ClientWidth = 281
  Caption = 'frmRelatorioCPData'
  OldCreateOrder = True
  ExplicitWidth = 297
  ExplicitHeight = 207
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 134
    Width = 281
    ExplicitTop = 138
    ExplicitWidth = 289
  end
  object edDataFim: TUniDBEdit [1]
    Left = 24
    Top = 72
    Width = 161
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object edDataIni: TUniDBEdit [2]
    Left = 24
    Top = 32
    Width = 161
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAINI'
    DataSource = dsPadrao
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource
    Left = 232
  end
end
