inherited frmRelatorioFornecedorData: TfrmRelatorioFornecedorData
  Caption = 'frmRelatorioFornecedorData'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object edDataFim: TUniDBEdit [1]
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
  object edDataIni: TUniDBEdit [2]
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
