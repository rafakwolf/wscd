inherited frmRelatorioFluxoCaixa: TfrmRelatorioFluxoCaixa
  Height = 281
  Width = 493
  Caption = 'frmRelatorioFluxoCaixa'
  ClientHeight = 281
  ClientWidth = 493
  inherited pnButtons: TPanel
    Top = 247
    Width = 493
    ClientWidth = 493
    TabOrder = 4
  end
  object dbDataI: TDBEdit[1]
    Left = 80
    Height = 33
    Top = 112
    Width = 137
    DataField = 'DATAINI'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbDataF: TDBEdit[2]
    Left = 80
    Height = 33
    Top = 160
    Width = 137
    DataField = 'DATAFIM'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object rgOrdem: TRadioGroup[3]
    Left = 8
    Height = 41
    Top = 56
    Width = 377
    AutoFill = True
    Caption = ' Ordem '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 2
    ClientHeight = 23
    ClientWidth = 375
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Lançamento'
      'Data'
    )
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object rgRelatorio: TRadioGroup[4]
    Left = 8
    Height = 41
    Top = 8
    Width = 377
    AutoFill = True
    Caption = ' Seleção '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 3
    ClientHeight = 23
    ClientWidth = 375
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Entradas'
      'Saídas'
      'Todos'
    )
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsSelecao
    Left = 352
    Top = 136
  end
  object sqldSelecao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 256
    Top = 136
    object sqldSelecaoDATAINI: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAINI'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldSelecaoDATAFIM: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAFIM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspSelecao: TTimer[7]
    Left = 288
    Top = 136
  end
  object cdsSelecao: TMemDataset[8]
    FieldDefs = <>
    Left = 320
    Top = 136
    object cdsSelecaoDATAINI: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAINI'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsSelecaoDATAFIM: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAFIM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
end
