inherited frmRelatorioProdutoEstMinForn: TfrmRelatorioProdutoEstMinForn
  Caption = 'frmRelatorioProdutoEstMinForn'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object dbeForn: TDBEdit [0]
    Left = 16
    Top = 40
    Width = 347
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'FANTAZIA'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    ExplicitTop = 97
    ExplicitWidth = 401
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    Left = 16
    Top = 64
  end
end
