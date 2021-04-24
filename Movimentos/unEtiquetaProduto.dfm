inherited frmEtiquetaProduto: TfrmEtiquetaProduto
  Height = 440
  Width = 793
  Caption = 'frmEtiquetaProduto'
  ClientHeight = 440
  ClientWidth = 793
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 422
    Width = 793
  end
  inherited pnBotoesPadrao: TPanel
    Width = 793
    ClientWidth = 793
  end
  object dbeCodBarra: TDBEdit[2]
    Left = 8
    Height = 33
    Top = 40
    Width = 161
    DataField = 'CODBARRA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbeProduto: TDBEdit[3]
    Left = 8
    Height = 33
    Top = 76
    Width = 497
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object dbePreco: TDBEdit[4]
    Left = 8
    Height = 33
    Top = 112
    Width = 121
    DataField = 'PRECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object dbgrdEtq: TDBGrid[5]
    Left = 0
    Height = 260
    Top = 162
    Width = 793
    Align = alBottom
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    ShowHint = True
    TabOrder = 2
  end
  inherited actlNavigateActions: TActionList[6]
    Left = 520
    Top = 172
    inherited actPrint: TAction
      Hint = 'Gerar etiquetas'
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[7]
    DataSet = cdsPadrao
    Left = 399
    Top = 256
  end
  object sqldPadrao: TSQLQuery[8]
    FieldDefs = <>
    Params = <>
    Left = 304
    Top = 256
    object sqldPadraoIDETIQUETAPROD: TIntegerField
      FieldKind = fkData
      FieldName = 'IDETIQUETAPROD'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoCODBARRA: TStringField
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'PRECO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dspPadrao: TTimer[9]
    Left = 336
    Top = 256
  end
  object cdsPadrao: TMemDataset[10]
    FieldDefs = <>
    Left = 368
    Top = 256
    object cdsPadraoIDETIQUETAPROD: TIntegerField
      FieldKind = fkData
      FieldName = 'IDETIQUETAPROD'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoCODBARRA: TStringField
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'PRECO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object sqldProduto: TSQLQuery[11]
    FieldDefs = <>
    Params = <>
    Left = 304
    Top = 224
    object sqldProdutoCODBARRA: TStringField
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object sqldProdutoABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldProdutoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
  object dspProduto: TTimer[12]
    Left = 336
    Top = 224
  end
  object cdsProduto: TMemDataset[13]
    FieldDefs = <>
    Left = 368
    Top = 224
    object cdsProdutoCODBARRA: TStringField
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object cdsProdutoABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsProdutoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
  end
end
