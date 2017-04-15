inherited frmRelatorioFornecedorData: TfrmRelatorioFornecedorData
  Caption = 'frmRelatorioFornecedorData'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object edDataFim: TDBEdit [0]
    Left = 24
    Top = 72
    Width = 153
    Height = 21
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object edDataIni: TDBEdit [1]
    Left = 24
    Top = 32
    Width = 153
    Height = 21
    DataField = 'DATAINI'
    DataSource = dsPadrao
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    ExplicitTop = 137
    ExplicitWidth = 313
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = DmPesquisar.cdsPesqData
    Left = 240
    Top = 24
  end
end
