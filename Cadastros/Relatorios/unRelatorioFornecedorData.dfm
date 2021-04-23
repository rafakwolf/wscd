inherited frmRelatorioFornecedorData: TfrmRelatorioFornecedorData
  ClientHeight = 172
  ClientWidth = 374
  Caption = 'frmRelatorioFornecedorData'
  OldCreateOrder = True
  ExplicitWidth = 390
  ExplicitHeight = 211
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TPanel
    Top = 138
    Width = 374
  end
  object edDataFim: TDBEdit [1]
    Left = 24
    Top = 72
    Width = 153
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object edDataIni: TDBEdit [2]
    Left = 24
    Top = 32
    Width = 153
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DATAINI'
    DataSource = dsPadrao
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource
    Left = 240
    Top = 24
  end
end
