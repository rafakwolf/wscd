inherited frmRelatorioProdutoGrupo: TfrmRelatorioProdutoGrupo
  ClientHeight = 128
  ClientWidth = 353
  Caption = 'frmRelatorioProdutoGrupo'
  OldCreateOrder = True
  ExplicitWidth = 369
  ExplicitHeight = 167
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TUniContainerPanel
    Top = 94
    Width = 353
    ExplicitTop = 94
    ExplicitWidth = 353
  end
  object dbeGrupo: TUniDBEdit [1]
    Left = 16
    Top = 40
    Width = 307
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
    Left = 136
    Top = 8
  end
end
