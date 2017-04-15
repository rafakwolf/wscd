inherited frmRelatorioFornecedorCidade: TfrmRelatorioFornecedorCidade
  Caption = 'frmRelatorioFornecedorCidade'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object dbeCidade: TDBEdit [0]
    Left = 16
    Top = 40
    Width = 331
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    ExplicitTop = 97
    ExplicitWidth = 385
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    Left = 88
  end
end
