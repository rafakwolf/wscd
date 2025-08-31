inherited frmRelatorioAniversarioCliente: TfrmRelatorioAniversarioCliente
  Height = 309
  Width = 598
  Caption = 'frmRelatorioAniversarioCliente'
  ClientHeight = 309
  ClientWidth = 598
  inherited pnButtons: TPanel
    Top = 275
    Width = 598
    ClientWidth = 598
  end
  object pnDiaMesAno: TPanel[1]
    Left = 8
    Height = 102
    Top = 72
    Width = 249
    ClientHeight = 102
    ClientWidth = 249
    Enabled = False
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object LabelMes: TLabel
      Left = 8
      Height = 15
      Top = 5
      Width = 23
      Caption = 'Mês'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelDo: TLabel
      Left = 8
      Height = 15
      Top = 47
      Width = 40
      Caption = 'Do dia'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelAte: TLabel
      Left = 88
      Height = 15
      Top = 47
      Width = 20
      Caption = 'Até'
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object edAno: TEdit
      Left = 167
      Height = 33
      Top = 63
      Width = 74
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '2007'
      OnKeyPress = edAnoKeyPress
    end
    object cmbMes: TComboBox
      Left = 8
      Height = 29
      Top = 20
      Width = 233
      ItemHeight = 0
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Março'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro'
      )
      ParentShowHint = False
      ShowHint = True
      Style = csDropDownList
      TabOrder = 0
    end
    object edDo: TSpinEdit
      Left = 8
      Height = 33
      Top = 62
      Width = 65
      MaxValue = 31
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Value = 1
    end
    object edAte: TSpinEdit
      Left = 88
      Height = 33
      Top = 62
      Width = 65
      MaxValue = 31
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Value = 31
    end
  end
  object pnDatas: TPanel[2]
    Left = 264
    Height = 103
    Top = 72
    Width = 257
    ClientHeight = 103
    ClientWidth = 257
    Enabled = False
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    object dbeDataIni: TDBEdit
      Left = 8
      Height = 33
      Top = 20
      Width = 241
      DataField = 'DATAINI'
      DataSource = dsPadrao
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object dbeDataFim: TDBEdit
      Left = 8
      Height = 33
      Top = 63
      Width = 241
      DataField = 'DATAFIM'
      DataSource = dsPadrao
      MaxLength = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object rgTipo: TRadioGroup[3]
    Left = 8
    Height = 57
    Top = 8
    Width = 249
    AutoFill = True
    Caption = ' Tipo '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 39
    ClientWidth = 247
    ItemIndex = 0
    Items.Strings = (
      'Envelopes'
      'Elenco'
    )
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object rgDatas: TRadioGroup[4]
    Left = 264
    Height = 57
    Top = 8
    Width = 257
    AutoFill = True
    Caption = ' Filtro '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 39
    ClientWidth = 255
    ItemIndex = 0
    Items.Strings = (
      'Por Dia Mês e Ano'
      'Por Data'
    )
    OnClick = rgDatasClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  inherited dsPadrao: TDataSource[5]
    DataSet = cdsSelecao
    Left = 214
    Top = 27
  end
  object sqldSelecao: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Macros = <>
    Left = 120
    Top = 26
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
    Left = 152
    Top = 26
  end
  object cdsSelecao: TMemDataset[8]
    FieldDefs = <>
    Left = 184
    Top = 26
    object cdsSelecaoDATAINI: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAINI'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsSelecaoDATAFIM: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATAFIM'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
end
