inherited frmRelatorioProdutoEstMinForn: TfrmRelatorioProdutoEstMinForn
  ClientHeight = 170
  Caption = 'frmRelatorioProdutoEstMinForn'
  OldCreateOrder = True
  ExplicitHeight = 209
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 136
  end
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
    Left = 136
    Top = 80
  end
end
