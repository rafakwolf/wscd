inherited frmRelatorioFornecedorData: TfrmRelatorioFornecedorData
  Caption = 'frmRelatorioFornecedorData'
  inherited pnButtons: TPanel
    Top = 138
    Width = 374
    ClientWidth = 374
  end
  object edDataFim: TDBEdit[1]
    Left = 24
    Height = 21
    Top = 72
    Width = 153
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object edDataIni: TDBEdit[2]
    Left = 24
    Height = 21
    Top = 32
    Width = 153
    DataField = 'DATAINI'
    DataSource = dsPadrao
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource[3]
    Left = 240
    Top = 24
  end
end
