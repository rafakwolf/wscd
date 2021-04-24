inherited frmRelatorioEtiquetaCliente: TfrmRelatorioEtiquetaCliente
  Height = 288
  Width = 554
  Caption = 'frmRelatorioEtiquetaCliente'
  ClientHeight = 288
  ClientWidth = 554
  inherited pnButtons: TPanel
    Top = 254
    Width = 554
    ClientWidth = 554
  end
  object dbeCidade: TDBEdit[1]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 96
    Width = 355
    DataField = 'DESCRICAO'
    DataSource = dsCidade
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeCliente: TDBEdit[2]
    Left = 16
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 55
    Width = 355
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object rgpFiltro: TRadioGroup[3]
    Left = 8
    Height = 41
    Top = 8
    Width = 393
    AutoFill = True
    Caption = 'Filtros'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 3
    ClientHeight = 23
    ClientWidth = 391
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Cliente'
      'Cidade'
      'Todos'
    )
    OnClick = rgpFiltroClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  inherited dsPadrao: TDataSource[4]
    Left = 352
  end
  object dsCidade: TDataSource[5]
    Left = 312
    Top = 32
  end
end
