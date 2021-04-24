inherited frmRelatorioProdutoVencimento: TfrmRelatorioProdutoVencimento
  Height = 377
  Width = 608
  Caption = 'frmRelatorioProdutoVencimento'
  ClientHeight = 377
  ClientWidth = 608
  inherited pnButtons: TPanel
    Top = 343
    Width = 608
    ClientWidth = 608
  end
  object dbdDataVenc: TDBEdit[1]
    Left = 84
    Height = 33
    Hint = 'Produtos vencidos '#13#10'apartir desta data...'
    Top = 104
    Width = 319
    DataField = 'DATA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbeUnidade: TDBEdit[2]
    Left = 84
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 131
    Width = 319
    DataField = 'DESCRICAO'
    DataSource = dsUnidade
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeForn: TDBEdit[3]
    Left = 84
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 160
    Width = 319
    DataField = 'FANTAZIA'
    DataSource = dsForn
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbeGrupo: TDBEdit[4]
    Left = 84
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 189
    Width = 319
    DataField = 'DESCRICAO'
    DataSource = dsGrupo
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object rgTipo: TRadioGroup[5]
    Left = 16
    Height = 81
    Top = 16
    Width = 409
    AutoFill = True
    Caption = ' Tipo de Relatório '
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 63
    ClientWidth = 407
    ItemIndex = 1
    Items.Strings = (
      'Todos'
      'Por Unidade de Venda'
      'Por Fornecedor'
      'Por Grupo'
    )
    OnClick = rgTipoClick
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inherited dsPadrao: TDataSource[6]
    DataSet = cdsSelecao
    Left = 312
    Top = 64
  end
  object sqldSelecao: TSQLQuery[7]
    FieldDefs = <>
    Params = <>
    Left = 216
    Top = 64
    object sqldSelecaoDATA: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspSelecao: TTimer[8]
    Left = 248
    Top = 64
  end
  object cdsSelecao: TMemDataset[9]
    FieldDefs = <>
    Left = 280
    Top = 64
    object cdsSelecaoDATA: TDateTimeField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object sqldUnidade: TSQLQuery[10]
    FieldDefs = <>
    Params = <>
    Left = 8
    Top = 216
  end
  object dspUnidade: TTimer[11]
    Left = 40
    Top = 216
  end
  object cdsUnidade: TMemDataset[12]
    FieldDefs = <>
    Left = 72
    Top = 216
    object cdsUnidadeCODUNIDADE: TIntegerField
      FieldKind = fkData
      FieldName = 'CODUNIDADE'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsUnidadeDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 10
    end
  end
  object sqldForn: TSQLQuery[13]
    FieldDefs = <>
    Params = <>
    Left = 296
    Top = 216
    object sqldFornCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldFornFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldFornCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldFornTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspForn: TTimer[14]
    Left = 328
    Top = 216
  end
  object cdsForn: TMemDataset[15]
    FieldDefs = <>
    Left = 360
    Top = 216
    object cdsFornCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsFornFANTAZIA: TStringField
      FieldKind = fkData
      FieldName = 'FANTAZIA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsFornCNPJ: TStringField
      FieldKind = fkData
      FieldName = 'CNPJ'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsFornTELEFONE: TStringField
      FieldKind = fkData
      FieldName = 'TELEFONE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object sqldGrupo: TSQLQuery[16]
    FieldDefs = <>
    Params = <>
    Left = 152
    Top = 216
  end
  object dspGrupo: TTimer[17]
    Left = 184
    Top = 216
  end
  object cdsGrupo: TMemDataset[18]
    FieldDefs = <>
    Left = 216
    Top = 216
    object cdsGrupoCODGRUPO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODGRUPO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsGrupoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 30
    end
  end
  object dsUnidade: TDataSource[19]
    DataSet = cdsUnidade
    Left = 104
    Top = 216
  end
  object dsGrupo: TDataSource[20]
    DataSet = cdsGrupo
    Left = 248
    Top = 216
  end
  object dsForn: TDataSource[21]
    DataSet = cdsForn
    Left = 392
    Top = 216
  end
end
