inherited frmRelatorioEtiquetaCliente: TfrmRelatorioEtiquetaCliente
  ClientHeight = 160
  ClientWidth = 401
  Caption = 'frmRelatorioEtiquetaCliente'
  OldCreateOrder = True
  ExplicitWidth = 417
  ExplicitHeight = 199
  PixelsPerInch = 96
  TextHeight = 13
  object rgpFiltro: TRadioGroup [0]
    Left = 8
    Top = 8
    Width = 393
    Height = 41
    Caption = 'Filtros'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Cliente'
      'Cidade'
      'Todos')
    TabOrder = 3
    OnClick = rgpFiltroClick
  end
  inherited pnButtons: TUniContainerPanel
    Top = 126
    Width = 401
    ExplicitTop = 126
    ExplicitWidth = 401
  end
  object dbeCidade: TUniDBEdit [2]
    Left = 16
    Top = 96
    Width = 355
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsCidade
    TabOrder = 2
    Color = clBtnFace
    ReadOnly = True
  end
  object dbeCliente: TUniDBEdit [3]
    Left = 16
    Top = 80
    Width = 355
    Height = 21
    Hint = 'Pesquisar < F2 >'
    ShowHint = True
    DataField = 'NOME'
    DataSource = dsPadrao
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  inherited dsPadrao: TDataSource
    Left = 352
  end
  object dsCidade: TDataSource
    Left = 312
    Top = 32
  end
end
