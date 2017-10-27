inherited frmRelatorioFornecedorCidade: TfrmRelatorioFornecedorCidade
  Caption = 'frmRelatorioFornecedorCidade'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    ExplicitTop = 97
    ExplicitWidth = 385
  end
  object dbeCidade: TUniDBEdit [1]
    Left = 16
    Top = 40
    Width = 331
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  inherited dsPadrao: TDataSource
    Left = 88
  end
end
