inherited frmRelatorioCaixaMensal: TfrmRelatorioCaixaMensal
  Height = 281
  Width = 452
  Caption = 'frmRelatorioCaixaMensal'
  ClientHeight = 281
  ClientWidth = 452
  inherited pnButtons: TPanel
    Top = 247
    Width = 452
    ClientWidth = 452
    TabOrder = 3
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object edtMes: TEdit[1]
    Left = 32
    Height = 33
    Top = 80
    Width = 41
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = edtMesExit
  end
  object edtAno: TEdit[2]
    Left = 80
    Height = 33
    Top = 80
    Width = 65
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnExit = edtAnoExit
  end
  object rgOrd: TRadioGroup[3]
    Left = 8
    Height = 50
    Top = 8
    Width = 361
    AutoFill = True
    Caption = ' Ordenar por '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 2
    ClientHeight = 32
    ClientWidth = 359
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Lançamento'
      'Data'
    )
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited dsPadrao: TDataSource[4]
    Left = 216
    Top = 64
  end
end
