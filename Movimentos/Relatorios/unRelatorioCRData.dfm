inherited frmRelatorioCRData: TfrmRelatorioCRData
  Caption = 'frmRelatorioCRData'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object edDataIni: TDBEdit [0]
    Left = 24
    Top = 32
    Width = 153
    Height = 21
    DataField = 'DATAINI'
    DataSource = dsPadrao
    TabOrder = 1
  end
  object edDataFim: TDBEdit [1]
    Left = 24
    Top = 72
    Width = 153
    Height = 21
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    TabOrder = 2
  end
  inherited pnButtons: TPanel
    ExplicitTop = 130
    ExplicitWidth = 298
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    Left = 232
  end
end
