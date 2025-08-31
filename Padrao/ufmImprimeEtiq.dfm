inherited frmImprimeEtiq: TfrmImprimeEtiq
  Left = 216
  Height = 266
  Top = 155
  Width = 528
  Caption = 'Impressão de etiquetas'
  ClientHeight = 266
  ClientWidth = 528
  inherited pnButtons: TPanel
    Top = 232
    Width = 528
    ClientWidth = 528
    inherited btnVisualizar: TBitBtn
      OnClick = btnVisualizarClick
    end
  end
  object lbModeloEtq: TLabel[1]
    Left = 16
    Height = 16
    Top = 24
    Width = 121
    Alignment = taRightJustify
    Caption = 'Modelo de Etiqueta:'
  end
  object lbLinhaIni: TLabel[2]
    Left = 39
    Height = 16
    Top = 53
    Width = 90
    Alignment = taRightJustify
    Caption = 'Iniciar na linha:'
  end
  object lbColIni: TLabel[3]
    Left = 29
    Height = 16
    Top = 79
    Width = 102
    Alignment = taRightJustify
    Caption = 'Iniciar na coluna:'
  end
  object cbListaEtiq: TComboBox[4]
    Left = 152
    Height = 20
    Top = 20
    Width = 272
    ItemHeight = 26
    Style = csDropDownList
    TabOrder = 1
  end
  object seColunaIni: TSpinEdit[5]
    Left = 136
    Height = 20
    Top = 79
    Width = 45
    OnExit = seColunaIniExit
    TabOrder = 2
    Value = 1
  end
  object seLinhaIni: TSpinEdit[6]
    Left = 136
    Height = 20
    Top = 53
    Width = 45
    OnExit = seLinhaIniExit
    TabOrder = 3
    Value = 1
  end
  object rgTraversal: TRadioGroup[7]
    Left = 190
    Height = 63
    Top = 48
    Width = 214
    AutoFill = True
    Caption = 'Imprimir etiquetas na ordem'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 36
    ClientWidth = 204
    ItemIndex = 0
    Items.Strings = (
      'Horizontal'
      'Vertical'
    )
    TabOrder = 4
  end
  inherited dsPadrao: TDataSource[8]
    DataSet = sqldEtiqueta
    Left = 376
    Top = 144
  end
  object sqldEtiqueta: TZQuery[9]
    Connection = DmPrincipal.ZConnection1
    SQL.Strings = (
      'select * from ETIQUETA'
    )
    Params = <>
    Left = 204
    Top = 152
    object sqldEtiquetaIDETIQUETA: TLongintField
      FieldKind = fkData
      FieldName = 'IDETIQUETA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldEtiquetaETIQUETA: TStringField
      FieldKind = fkData
      FieldName = 'ETIQUETA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 100
    end
    object sqldEtiquetaALTURAFOLHA: TBCDField
      FieldKind = fkData
      FieldName = 'ALTURAFOLHA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaLARGURAFOLHA: TBCDField
      FieldKind = fkData
      FieldName = 'LARGURAFOLHA'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaMARGEMSUPERIOR: TBCDField
      FieldKind = fkData
      FieldName = 'MARGEMSUPERIOR'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaMARGEMESQUERDA: TBCDField
      FieldKind = fkData
      FieldName = 'MARGEMESQUERDA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaNUMEROLINHAS: TLongintField
      FieldKind = fkData
      FieldName = 'NUMEROLINHAS'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldEtiquetaNUMEROCOLUNAS: TLongintField
      FieldKind = fkData
      FieldName = 'NUMEROCOLUNAS'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldEtiquetaALTURAETIQUETA: TBCDField
      FieldKind = fkData
      FieldName = 'ALTURAETIQUETA'
      Index = 8
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaLARGURAETIQUETA: TBCDField
      FieldKind = fkData
      FieldName = 'LARGURAETIQUETA'
      Index = 9
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaDISTANCIAVERTICAL: TBCDField
      FieldKind = fkData
      FieldName = 'DISTANCIAVERTICAL'
      Index = 10
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaDISTANCIAHORIZONTAL: TBCDField
      FieldKind = fkData
      FieldName = 'DISTANCIAHORIZONTAL'
      Index = 11
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaDISTACOLVERTICAL: TBCDField
      FieldKind = fkData
      FieldName = 'DISTACOLVERTICAL'
      Index = 12
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
    object sqldEtiquetaDISTCOLHORIZ: TBCDField
      FieldKind = fkData
      FieldName = 'DISTCOLHORIZ'
      Index = 13
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 13
      Currency = False
      MaxValue = 0
      MinValue = 0
      Size = 2
    end
  end
end
