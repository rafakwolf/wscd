inherited frmRelatorioProdutoGrupo: TfrmRelatorioProdutoGrupo
  Width = 477
  Caption = 'frmRelatorioProdutoGrupo'
  ClientWidth = 477
  inherited pnButtons: TPanel
    Width = 477
    ClientWidth = 477
  end
  object dbeGrupo: TDBEdit[1]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 40
    Width = 307
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
    Left = 136
    Top = 8
  end
end
