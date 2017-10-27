inherited frmRelatorioProdutoEstMinForn: TfrmRelatorioProdutoEstMinForn
  Caption = 'frmRelatorioProdutoEstMinForn'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object dbeForn: TUniDBEdit [1]
    Left = 16
    Top = 40
    Width = 347
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  inherited dsPadrao: TDataSource
    Left = 16
    Top = 64
  end
end
