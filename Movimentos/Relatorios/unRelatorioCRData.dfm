inherited frmRelatorioCRData: TfrmRelatorioCRData
  Caption = 'frmRelatorioCRData'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TContainerPanel
    ExplicitTop = 130
    ExplicitWidth = 298
  end
  object edDataIni: TDBEdit [1]
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
  object edDataFim: TDBEdit [2]
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
  inherited dsPadrao: TDataSource
    Left = 232
  end
end
