inherited frmPerda: TfrmPerda
  Height = 410
  Width = 635
  Caption = 'frmPerda'
  ClientHeight = 410
  ClientWidth = 635
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 392
    Width = 635
  end
  inherited pnBotoesPadrao: TPanel
    Width = 635
    ClientWidth = 635
    TabOrder = 6
    inherited btnNovo: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnAlterar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnExcluir: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSalvar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnCancelar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnConsultar: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnSair: TSpeedButton
      Font.Name = 'Verdana'
    end
    inherited btnPrint: TSpeedButton
      Font.Name = 'Verdana'
    end
  end
  object lbQtde: TLabel[2]
    Left = 36
    Height = 15
    Top = 84
    Width = 31
    Caption = 'Qtde'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbPreco: TLabel[3]
    Left = 31
    Height = 15
    Top = 108
    Width = 36
    Caption = 'Preço'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbObs: TLabel[4]
    Left = 37
    Height = 15
    Top = 267
    Width = 29
    Caption = 'Obs.'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object lbPrecoCusto: TLabel[5]
    Left = 183
    Height = 15
    Top = 108
    Width = 47
    Caption = '(Custo)'
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
  end
  object dbdData: TDBEdit[6]
    Left = 66
    Height = 33
    Top = 128
    Width = 153
    DataField = 'DATA'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbQtde: TDBEdit[7]
    Left = 66
    Height = 33
    Top = 80
    Width = 73
    DataField = 'QTDE'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbProduto: TDBEdit[8]
    Left = 66
    Height = 33
    Hint = 'Pesquisar < F2 >'
    Top = 56
    Width = 361
    DataField = 'DESCRICAO'
    DataSource = dsPadrao
    ReadOnly = True
    CharCase = ecNormal
    Color = clBtnFace
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbPreco: TDBEdit[9]
    Left = 66
    Height = 33
    Top = 104
    Width = 113
    DataField = 'PRECO'
    DataSource = dsPadrao
    CharCase = ecNormal
    MaxLength = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object dbmOBS: TDBMemo[10]
    Left = 66
    Height = 89
    Top = 264
    Width = 383
    DataField = 'OBS'
    DataSource = dsPadrao
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 5
  end
  object dbrgrpMOTIVO: TDBRadioGroup[11]
    Left = 66
    Height = 105
    Top = 152
    Width = 153
    AutoFill = True
    Caption = 'Motivo'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    DataField = 'MOTIVO'
    DataSource = dsPadrao
    Items.Strings = (
      '&Danificado'
      '&Vencido'
      '&Furto'
      '&Perda de peso'
      '&Outro'
    )
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Values.Strings = (
      'D'
      'V'
      'F'
      'P'
      'O'
    )
  end
  inherited actlNavigateActions: TActionList[12]
    Left = 272
    Top = 100
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  inherited dsPadrao: TDataSource[13]
    DataSet = cdsPadrao
    Left = 367
    Top = 148
  end
  object sqldPadrao: TSQLQuery[14]
    FieldDefs = <>
    Params = <>
    Left = 272
    Top = 148
    object sqldPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoCODPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODPRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoQTDE: TIntegerField
      FieldKind = fkData
      FieldName = 'QTDE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoPRECO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'PRECO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoMOTIVO: TStringField
      FieldKind = fkData
      FieldName = 'MOTIVO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object sqldPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
  end
  object dspPadrao: TTimer[15]
    Left = 304
    Top = 148
  end
  object cdsPadrao: TMemDataset[16]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    Left = 336
    Top = 148
    object cdsPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoCODPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODPRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnValidate = cdsPadraoCODPRODUTOValidate
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoQTDE: TIntegerField
      FieldKind = fkData
      FieldName = 'QTDE'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'PRECO'
      Index = 4
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
    object cdsPadraoDATA: TDateField
      FieldKind = fkData
      FieldName = 'DATA'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPadraoMOTIVO: TStringField
      FieldKind = fkData
      FieldName = 'MOTIVO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 1
    end
    object cdsPadraoOBS: TMemoField
      FieldKind = fkData
      FieldName = 'OBS'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      BlobType = ftMemo
      Size = 1
      Transliterate = False
    end
  end
  object sqldProduto: TSQLQuery[17]
    FieldDefs = <>
    Params = <>
    Left = 272
    Top = 180
    object sqldProdutoIDPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDPRODUTO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldProdutoCODBARRA: TStringField
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object sqldProdutoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldProdutoABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldProdutoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldProdutoCUSTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 5
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
  object dspProduto: TTimer[18]
    Left = 304
    Top = 180
  end
  object cdsProduto: TMemDataset[19]
    FieldDefs = <>
    Left = 336
    Top = 180
    object cdsProdutoIDPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'IDPRODUTO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsProdutoCODBARRA: TStringField
      FieldKind = fkData
      FieldName = 'CODBARRA'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 13
    end
    object cdsProdutoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsProdutoABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 3
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsProdutoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsProdutoCUSTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'CUSTO'
      Index = 5
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
end
