inherited frmRelatorioEtiquetaCliente: TfrmRelatorioEtiquetaCliente
  Caption = 'frmRelatorioEtiquetaCliente'
  ClientHeight = 160
  ClientWidth = 401
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
  object dbeCidade: TDBEdit [1]
    Left = 16
    Top = 96
    Width = 355
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'DESCRICAO'
    DataSource = dsCidade
    ReadOnly = True
    TabOrder = 2
  end
  object dbeCliente: TDBEdit [2]
    Left = 16
    Top = 80
    Width = 355
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Color = clBtnFace
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    TabOrder = 1
  end
  inherited pnButtons: TPanel
    Top = 126
    Width = 401
    ExplicitTop = 126
    ExplicitWidth = 401
    inherited btnImprimir: TBitBtn
      Visible = False
    end
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  inherited dsPadrao: TDataSource
    Left = 352
  end
  object dsCidade: TDataSource
    Left = 312
    Top = 32
  end
end
