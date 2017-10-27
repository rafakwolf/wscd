inherited frmRelatorioOrcamentoData: TfrmRelatorioOrcamentoData
  ClientHeight = 167
  ClientWidth = 281
  Caption = 'frmRelatorioOrcamentoData'
  OldCreateOrder = True
  ExplicitWidth = 297
  ExplicitHeight = 206
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 133
    Width = 281
    ExplicitTop = 133
    ExplicitWidth = 281
  end
  object edDataFim: TUniDBEdit [1]
    Left = 16
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
    Left = 16
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
    Left = 224
  end
end
