inherited frmRelatorioOrcamentoData: TfrmRelatorioOrcamentoData
  Width = 306
  Caption = 'frmRelatorioOrcamentoData'
  ClientWidth = 306
  inherited pnButtons: TPanel
    Width = 306
    ClientWidth = 306
  end
  object edDataFim: TDBEdit[1]
    Left = 16
    Height = 33
    Top = 72
    Width = 161
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object edDataIni: TDBEdit[2]
    Left = 16
    Height = 33
    Top = 32
    Width = 161
    DataField = 'DATAINI'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource[3]
    Left = 224
  end
end
