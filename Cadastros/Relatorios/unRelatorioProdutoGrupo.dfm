inherited frmRelatorioProdutoGrupo: TfrmRelatorioProdutoGrupo
  Caption = 'frmRelatorioProdutoGrupo'
  ClientHeight = 128
  ClientWidth = 353
  OldCreateOrder = True
  ExplicitWidth = 369
  ExplicitHeight = 167
  PixelsPerInch = 96
  TextHeight = 13
  object dbeGrupo: TDBEdit [0]
    Left = 16
    Top = 40
    Width = 307
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    Top = 94
    Width = 353
    ExplicitTop = 94
    ExplicitWidth = 353
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    Left = 136
    Top = 8
  end
end
