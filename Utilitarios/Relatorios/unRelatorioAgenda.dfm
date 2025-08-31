inherited frmRelatorioAgenda: TfrmRelatorioAgenda
  Height = 329
  Width = 578
  Caption = 'frmRelatorioAgenda'
  ClientHeight = 329
  ClientWidth = 578
  OnCreate = FormCreate
  inherited pnButtons: TPanel
    Top = 295
    Width = 578
    ClientWidth = 578
    TabOrder = 3
    inherited btnImprimir: TBitBtn
      OnClick = btnImprimirClick
    end
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object lbTelefone: TLabel[1]
    Left = 8
    Height = 16
    Top = 100
    Width = 52
    Caption = 'Telefone'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbeNome: TDBEdit[2]
    Left = 8
    Height = 21
    Hint = 'Pesquisar < F2 >'
    Top = 68
    Width = 355
    DataField = 'NOME'
    DataSource = dsPadrao
    ReadOnly = True
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edFone: TEdit[3]
    Left = 8
    Height = 21
    Top = 116
    Width = 147
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object rgTipoRelatorio: TRadioGroup[4]
    Left = 8
    Height = 48
    Hint = 'Escolha uma opção'
    Top = 8
    Width = 377
    AutoFill = True
    Caption = ' Buscar por '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 3
    ClientHeight = 21
    ClientWidth = 367
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Nome'
      'Telefone'
      'Todos'
    )
    OnClick = rgTipoRelatorioClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = sqldAgenda
    Left = 320
    Top = 144
  end
  object sqldAgenda: TZQuery[6]
    Params = <>
    Left = 202
    Top = 174
  end
end
