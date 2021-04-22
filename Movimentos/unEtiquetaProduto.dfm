inherited frmEtiquetaProduto: TfrmEtiquetaProduto
  ClientHeight = 402
  Caption = 'frmEtiquetaProduto'
  OldCreateOrder = True
  Font.Name = 'Verdana'
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbStatus: TStatusBar
    Top = 383
    ExplicitTop = 383
  end
  object dbeCodBarra: TDBEdit [2]
    Left = 8
    Top = 40
    Width = 161
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'CODBARRA'
    DataSource = dsPadrao
    TabOrder = 3
  end
  object dbeProduto: TDBEdit [3]
    Left = 8
    Top = 64
    Width = 497
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    TabOrder = 4
  end
  object dbePreco: TDBEdit [4]
    Left = 8
    Top = 88
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    DataField = 'PRECO'
    DataSource = dsPadrao
    TabOrder = 5
  end
  object dbgrdEtq: TDBGrid [5]
    Left = 0
    Top = 123
    Width = 755
    Height = 260
    Hint = ''
    ShowHint = True
    DataSource = dsPadrao
    LoadMask.Message = 'Loading data...'
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    ParentColor = False
    Color = clWindow
  end
  inherited actlNavigateActions: TActionList
    Left = 520
    Top = 172
    inherited actPrint: TAction
      Hint = 'Gerar etiquetas'
      ShortCut = 0
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 399
    Top = 256
  end
  object sqldPadrao: TSQLDataSet
    CommandText = 
      'select '#13#10'    IDETIQUETAPROD,'#13#10'    CODBARRA,'#13#10'    DESCRICAO,'#13#10'   ' +
      ' PRECO  '#13#10'from ETIQUETAPROD'#13#10'order by DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    Left = 304
    Top = 256
    object sqldPadraoIDETIQUETAPROD: TIntegerField
      FieldName = 'IDETIQUETAPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqldPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
    end
  end
  object dspPadrao: TDataSetProvider
    DataSet = sqldPadrao
    UpdateMode = upWhereKeyOnly
    Left = 336
    Top = 256
  end
  object cdsPadrao: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 368
    Top = 256
    object cdsPadraoIDETIQUETAPROD: TIntegerField
      FieldName = 'IDETIQUETAPROD'
      Required = True
    end
    object cdsPadraoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
    end
  end
  object sqldProduto: TSQLDataSet
    CommandText = 
      'select '#13#10'  CODBARRA,'#13#10'  ABREVIACAO,'#13#10'  VENDA'#13#10'from PRODUTOS'#13#10'ord' +
      'er by DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    Left = 304
    Top = 224
    object sqldProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object sqldProdutoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object sqldProdutoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Precision = 15
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sqldProduto
    Left = 336
    Top = 224
  end
  object cdsProduto: TMemDataset
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 368
    Top = 224
    object cdsProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object cdsProdutoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 80
    end
    object cdsProdutoVENDA: TFMTBCDField
      FieldName = 'VENDA'
      DisplayFormat = '#,##0.00'
      Precision = 15
    end
  end
end
