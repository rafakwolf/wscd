inherited frmRelatorioNovoAlterado: TfrmRelatorioNovoAlterado
  Caption = 'frmRelatorioNovoAlterado'
  OldCreateOrder = True
  ExplicitWidth = 470
  ExplicitHeight = 282
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    ExplicitTop = 81
    ExplicitWidth = 305
    inherited btnVisualizar: TUniBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object rgpOpcoes: TRadioGroup [1]
    Left = 8
    Top = 8
    Width = 289
    Height = 65
    Caption = ' Op'#231#245'es '
    ItemIndex = 0
    Items.Strings = (
      'Produtos Novos'
      'Produtos Alterados')
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource
    Left = 264
  end
end
