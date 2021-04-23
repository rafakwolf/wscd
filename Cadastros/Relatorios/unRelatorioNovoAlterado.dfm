inherited frmRelatorioNovoAlterado: TfrmRelatorioNovoAlterado
  ClientHeight = 141
  Caption = 'frmRelatorioNovoAlterado'
  OldCreateOrder = True
  ExplicitHeight = 180
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TPanel
    Top = 107
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object rgpOpcoes: TRadioGroup [1]
    Left = 8
    Top = 8
    Width = 289
    Height = 65
    Hint = ''
    ShowHint = True
    Items.Strings = (
      'Produtos Novos'
      'Produtos Alterados')
    ItemIndex = 0
    Caption = ' Op'#231#245'es '
    TabOrder = 1
    TabStop = False
  end
  inherited dsPadrao: TDataSource
    Left = 264
  end
end
