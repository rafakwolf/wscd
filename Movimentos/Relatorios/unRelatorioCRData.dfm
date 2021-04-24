inherited frmRelatorioCRData: TfrmRelatorioCRData
  Width = 350
  Caption = 'frmRelatorioCRData'
  ClientWidth = 350
  inherited pnButtons: TPanel
    Width = 350
    ClientWidth = 350
  end
  object edDataIni: TDBEdit[1]
    Left = 24
    Height = 33
    Top = 32
    Width = 153
    DataField = 'DATAINI'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edDataFim: TDBEdit[2]
    Left = 24
    Height = 33
    Top = 72
    Width = 153
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  inherited dsPadrao: TDataSource[3]
    Left = 232
  end
end
