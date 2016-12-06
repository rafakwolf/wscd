inherited frmRelatorioNovoAlterado: TfrmRelatorioNovoAlterado
  Width = 313
  Height = 149
  Caption = 'frmRelatorioNovoAlterado'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TPanel
    Top = 81
    Width = 305
    inherited btnVisualizar: TBitBtn
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
    Top = 16
  end
end
