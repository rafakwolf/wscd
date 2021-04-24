inherited frmRelatorioCPData: TfrmRelatorioCPData
  Left = 213
  Top = 163
  Width = 380
  Caption = 'frmRelatorioCPData'
  ClientWidth = 380
  inherited pnButtons: TPanel
    Width = 380
    ClientWidth = 380
  end
  object edDataFim: TDBEdit[1]
    Left = 24
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
    Left = 24
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
    Left = 232
  end
end
