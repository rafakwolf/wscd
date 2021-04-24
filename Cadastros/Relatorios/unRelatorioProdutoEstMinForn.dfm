inherited frmRelatorioProdutoEstMinForn: TfrmRelatorioProdutoEstMinForn
  Height = 298
  Width = 641
  Caption = 'frmRelatorioProdutoEstMinForn'
  ClientHeight = 298
  ClientWidth = 641
  inherited pnButtons: TPanel
    Top = 264
    Width = 641
    ClientWidth = 641
  end
  object dbeForn: TDBEdit[1]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 40
    Width = 347
    DataField = 'FANTAZIA'
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
    Top = 80
  end
end
