inherited frmRelatorioAgenda: TfrmRelatorioAgenda
  Height = 329
  Width = 578
  Caption = 'frmRelatorioAgenda'
  ClientHeight = 329
  ClientWidth = 578
  inherited pnButtons: TPanel
    Top = 295
    Width = 578
    ClientWidth = 578
    TabOrder = 3
  end
  object lbTelefone: TLabel[1]
    Left = 8
    Height = 15
    Top = 100
    Width = 51
    Caption = 'Telefone'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbeNome: TDBEdit[2]
    Left = 8
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 68
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
  object edFone: TEdit[3]
    Left = 8
    Height = 33
    Top = 116
    Width = 147
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object rgTipoRelatorio: TRadioGroup[4]
    Left = 8
    Height = 33
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
    ClientHeight = 15
    ClientWidth = 375
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
    DataSet = cdsAgenda
    Left = 312
    Top = 104
  end
  object sqldAgenda: TSQLQuery[6]
    FieldDefs = <>
    Params = <>
    Left = 216
    Top = 104
    object sqldAgendaNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldAgendaTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldAgendaTELEFONE2: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE2'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldAgendaTELEFONE3: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE3'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldAgendaFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspAgenda: TTimer[7]
    Left = 248
    Top = 104
  end
  object cdsAgenda: TMemDataset[8]
    FieldDefs = <>
    Left = 280
    Top = 104
    object cdsAgendaNOME: TStringField
      FieldKind = fkData
      FieldName = 'NOME'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsAgendaTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsAgendaTELEFONE2: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE2'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsAgendaTELEFONE3: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE3'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsAgendaFAX: TStringField
      FieldKind = fkData
      FieldName = 'FAX'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
end
