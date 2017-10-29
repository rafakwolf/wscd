inherited frmRelatorioFornecedorCidade: TfrmRelatorioFornecedorCidade
  ClientHeight = 178
  Caption = 'frmRelatorioFornecedorCidade'
  OldCreateOrder = True
  ExplicitHeight = 217
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 144
    ExplicitTop = 144
  end
  object dbeCidade: TUniDBEdit [1]
    Left = 48
    Top = 56
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
    Top = 8
  end
end
