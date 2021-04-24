inherited frmRelatorioFornecedorCidade: TfrmRelatorioFornecedorCidade
  Height = 276
  Width = 556
  Caption = 'frmRelatorioFornecedorCidade'
  ClientHeight = 276
  ClientWidth = 556
  inherited pnButtons: TPanel
    Top = 242
    Width = 556
    ClientWidth = 556
  end
  object dbeCidade: TDBEdit[1]
    Left = 48
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 56
    Width = 331
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource[2]
    Left = 88
    Top = 8
  end
end
