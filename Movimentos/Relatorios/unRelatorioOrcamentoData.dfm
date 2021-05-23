inherited frmRelatorioOrcamentoData: TfrmRelatorioOrcamentoData
  Caption = 'frmRelatorioOrcamentoData'
  ClientHeight = 167
  ClientWidth = 281
  OldCreateOrder = True
  ExplicitWidth = 297
  ExplicitHeight = 206
  PixelsPerInch = 96
  TextHeight = 13
  object edDataFim: TDBEdit [0]
    Left = 16
    Top = 72
    Width = 161
    Height = 21
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    TabOrder = 2
  end
  object edDataIni: TDBEdit [1]
    Left = 16
    Top = 32
    Width = 161
    Height = 21
    DataField = 'DATAINI'
    DataSource = dsPadrao
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    Top = 133
    Width = 281
    ExplicitTop = 137
    ExplicitWidth = 289
    inherited btnImprimir: TBitBtn
      Left = 2
      ExplicitLeft = 2
    end
    inherited btnVisualizar: TBitBtn
      Left = 92
      OnClick = btnVisualizarClick
      ExplicitLeft = 92
    end
    inherited btnSair: TBitBtn
      Left = 182
      ExplicitLeft = 182
    end
  end
  inherited dsPadrao: TDataSource
    Left = 224
    Top = 16
  end
end
