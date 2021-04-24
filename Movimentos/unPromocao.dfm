inherited frmPromocao: TfrmPromocao
  Left = 219
  Height = 537
  Top = 173
  Width = 983
  Caption = 'frmPromocao'
  ClientHeight = 537
  ClientWidth = 983
  Font.Name = 'Verdana'
  inherited sbStatus: TStatusBar
    Top = 519
    Width = 983
  end
  inherited pnBotoesPadrao: TPanel
    Width = 983
    ClientWidth = 983
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
  object dbgrdPromocao: TDBGrid[2]
    Left = 0
    Height = 455
    Top = 64
    Width = 983
    Align = alBottom
    Color = clWindow
    Columns = <>
    DataSource = dsPadrao
    Font.CharSet = ANSI_CHARSET
    Font.Name = 'Verdana'
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ShowHint = True
    TabOrder = 2
  end
  inherited actlNavigateActions: TActionList[3]
    Left = 104
    Top = 180
    inherited actPrint: TAction
      OnExecute = actPrintExecute
      ShortCut = 0
    end
  end
  inherited dsPadrao: TDataSource[4]
    DataSet = cdsPadrao
    Left = 263
    Top = 180
  end
  object sqldPadrao: TSQLQuery[5]
    FieldDefs = <>
    Params = <>
    Left = 170
    Top = 180
    object sqldPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'PRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldPadraoABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldPadraoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 3
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object sqldPadraoDESCONTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCONTO'
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
    object sqldPadraoPRECO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'PRECO'
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
    object sqldPadraoINICIO: TDateField
      FieldKind = fkData
      FieldName = 'INICIO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldPadraoFIM: TDateField
      FieldKind = fkData
      FieldName = 'FIM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspPadrao: TTimer[6]
    Left = 200
    Top = 180
  end
  object cdsPadrao: TMemDataset[7]
    FieldDefs = <>
    AfterInsert = cdsPadraoAfterInsert
    Left = 232
    Top = 180
    object cdsPadraoCODIGO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODIGO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object cdsPadraoPRODUTO: TIntegerField
      FieldKind = fkData
      FieldName = 'PRODUTO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      OnValidate = cdsPadraoPRODUTOValidate
    end
    object cdsPadraoABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 2
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsPadraoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
      Index = 3
      LookupCache = False
      ProviderFlags = []
      ReadOnly = False
      Required = False
      DisplayFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoDESCONTO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'DESCONTO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      OnChange = cdsPadraoDESCONTOChange
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 15
      Currency = False
      MaxValue = '0'
      MinValue = '0'
    end
    object cdsPadraoPRECO: TFMTBCDField
      FieldKind = fkData
      FieldName = 'PRECO'
      Index = 5
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
    object cdsPadraoINICIO: TDateField
      FieldKind = fkData
      FieldName = 'INICIO'
      Index = 6
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPadraoFIM: TDateField
      FieldKind = fkData
      FieldName = 'FIM'
      Index = 7
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sqldProduto: TSQLQuery[8]
    FieldDefs = <>
    Params = <>
    Left = 432
    Top = 172
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
    object sqldProdutoABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object sqldProdutoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
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
    object sqldProdutoCODGRUPO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODGRUPO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object sqldProdutoCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object dspProduto: TTimer[9]
    Left = 464
    Top = 172
  end
  object cdsProduto: TMemDataset[10]
    FieldDefs = <>
    Left = 496
    Top = 172
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
    object cdsProdutoABREVIACAO: TStringField
      FieldKind = fkData
      FieldName = 'ABREVIACAO'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
    object cdsProdutoVENDA: TFMTBCDField
      FieldKind = fkData
      FieldName = 'VENDA'
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
    object cdsProdutoCODGRUPO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODGRUPO'
      Index = 4
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object cdsProdutoCODFORNECEDOR: TIntegerField
      FieldKind = fkData
      FieldName = 'CODFORNECEDOR'
      Index = 5
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object sqldSpDesmarcaPromocao: TSQLQuery[11]
    FieldDefs = <>
    Params = <>
    Left = 176
    Top = 136
  end
  object sqldGrupo: TSQLQuery[12]
    FieldDefs = <>
    Params = <>
    Left = 432
    Top = 136
    object sqldGrupoCODGRUPO: TIntegerField
      FieldKind = fkData
      FieldName = 'CODGRUPO'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object sqldGrupoDESCRICAO: TStringField
      FieldKind = fkData
      FieldName = 'DESCRICAO'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
      Size = 80
    end
  end
  object dspGrupo: TTimer[13]
    Left = 464
    Top = 136
  end
  object cdsGrupo: TMemDataset[14]
    FieldDefs = <>
    Left = 496
    Top = 136
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
      Size = 80
    end
  end
  object sqldForn: TSQLQuery[15]
    FieldDefs = <>
    Params = <>
    Left = 432
    Top = 208
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
  object dspForn: TTimer[16]
    Left = 464
    Top = 208
  end
  object cdsForn: TMemDataset[17]
    FieldDefs = <>
    Left = 496
    Top = 208
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
end
